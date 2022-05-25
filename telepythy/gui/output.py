import re
import enum
import itertools
import collections

from qtpy.QtCore import Qt
from qtpy import QtCore, QtGui, QtWidgets

from pygments.lexers import PythonConsoleLexer

from . import textedit

PS1 = '>>> '
PS2 = '... '
BUFFER_TIMEOUT = 50 # ms

# regex to remove prompts
rx_ps = re.compile('^({}|{})'.format(PS1, PS2))

class BlockState(enum.IntEnum):
    source = 0
    output = 1
    session = 2

class BlockChain:
    """This shell is powered by blockchain technology."""
    def __init__(self, chain_id, document, state, start_block):
        self._chain_id = chain_id
        self._doc = document
        self._state = state

        self._fold_block = None

        self._start_block = start_block
        self._end_block = None

    @property
    def id(self):
        return self._chain_id

    @property
    def state(self):
        return self._state

    @property
    def is_folded(self):
        return bool(self._fold_block)

    def add_blocks(self, start_block, end_block):
        chain_id = self.id
        visible = not self.is_folded
        for block in self._doc.blocks(start_block, end_block):
            block.setUserState(chain_id)
            block.setVisible(visible)
        self._end_block = end_block

        fold_block = self._fold_block
        if fold_block:
            cur = QtGui.QTextCursor(fold_block)
            cur.movePosition(cur.NextCharacter)
            cur.movePosition(cur.NextWord, cur.KeepAnchor)
            cur.removeSelectedText()
            cur.insertText(f'{self.count() - 1} ')

    def count(self):
        return (self._end_block.blockNumber() -
            self._start_block.blockNumber() + 1)

    def blocks(self):
        yield from self._doc.blocks(self._start_block, self._end_block)

    def fold(self):
        if self.is_folded:
            return

        blocks = self.blocks()
        first_block = next(blocks) # skip first line
        for block in blocks:
            block.setVisible(False)

        # add a fold info block
        cur = QtGui.QTextCursor(first_block)
        cur.movePosition(cur.EndOfBlock)
        cur.insertBlock()
        fold_block = self._fold_block = cur.block()
        fold_block.setUserState(self.id)

        tpl = (' <div style="background: #49A0AE">'
            '[{} more lines. Double-click to unfold)]</div>')
        cur.insertHtml(tpl.format(self.count() - 2))

    def unfold(self):
        if not self.is_folded:
            return

        # remove the fold info block
        cur = QtGui.QTextCursor(self._fold_block)
        cur.select(cur.BlockUnderCursor)
        cur.removeSelectedText()

        for block in self.blocks():
            block.setVisible(True)

        self._fold_block = None

class OutputEdit(textedit.TextEdit):
    def __init__(self, parent=None):
        super().__init__(PythonConsoleLexer(), parent)

        self._buffer = []
        self.startTimer(BUFFER_TIMEOUT)

        self.setReadOnly(True)
        self.setTextInteractionFlags(
            Qt.TextSelectableByMouse | Qt.TextSelectableByKeyboard)

        # tracks the cursor for the context menu
        self._context_cursor = None

        self._chains = collections.OrderedDict()
        self._last_state = None

        self.setup_actions()

    def setup_actions(self):
        self.action_clear = QtWidgets.QAction('Clear Output')
        self.action_clear.setShortcut('Ctrl+l')
        self.action_clear.triggered.connect(self.clear_output)
        self.addAction(self.action_clear)

        self.action_fold_block = QtWidgets.QAction('Fold Block')
        self.action_fold_block.setShortcut('Ctrl+-')
        self.action_fold_block.triggered.connect(lambda: self.fold_block())
        self.addAction(self.action_fold_block)

        self.action_unfold_block = QtWidgets.QAction('Unfold Block')
        self.action_unfold_block.setShortcut('Ctrl+=')
        self.action_unfold_block.triggered.connect(lambda: self.unfold_block())
        self.addAction(self.action_unfold_block)

        self.action_copy_source = QtWidgets.QAction('Copy Source')
        self.action_copy_source.setShortcut('Ctrl+Shift+c')
        self.action_copy_source.triggered.connect(self.copy_source)
        self.addAction(self.action_copy_source)

    ## events ##

    def timerEvent(self, event):
        self._flush_buffer()

    def contextMenuEvent(self, event):
        menu = self.createStandardContextMenu()
        before = menu.actions()[-2]

        self._context_cursor = cur = self.cursorForPosition(event.pos())
        chain = self._get_chain(cur.block())
        blocks = chain.blocks()
        first_block = next(blocks)

        # is there any source at all?
        if self._source_line(first_block.text()):
            menu.insertAction(before, self.action_copy_source)

        if chain.count() > 2:
            menu.insertSeparator(before)
            menu.insertAction(before, self.action_unfold_block
                if chain.is_folded else self.action_fold_block)

        menu.exec(event.globalPos())

    def mouseDoubleClickEvent(self, event):
        self._context_cursor = cur = self.cursorForPosition(event.pos())
        chain = self._get_chain(cur.block())
        chain.unfold()

    ## append ##

    @QtCore.Slot(str)
    def append(self, text, state=None):
        state = BlockState.output if state is None else state
        self._buffer.append((text, state))

    @QtCore.Slot()
    def append_prompt(self):
        self.append(PS1, BlockState.source)

    def append_source(self, source):
        source = source.strip()
        if not source:
            return

        lines = source.splitlines()
        text = [lines[0], '\n']
        for line in lines[1:]:
            text.extend([PS2, line, '\n'])

        self.append(''.join(text), BlockState.source)

    def append_session(self, version):
        text = []
        if self.blockCount() > 1:
            text.append('<br>')

        # TODO: take style into account
        tpl = '<div style="background: {};">{}</div>'
        text.append(tpl.format('#49A0AE', version))
        text.append('<p></p>')

        self.append(''.join(text), BlockState.session)
        self.append_prompt()

    def _flush_buffer(self):
        buf = self._buffer
        self._buffer = []

        if not buf:
            return

        doc = self.document()
        cur = self.textCursor()
        cur.movePosition(cur.End)

        is_prompt = lambda state, text: (
            state == BlockState.source and text.startswith(PS1))

        key = lambda item: item[1]
        for state, items in itertools.groupby(buf, key):
            start_block = cur.block()

            text = ''.join(item[0] for item in items)
            if state == BlockState.session:
                cur.insertHtml(text)
            else:
                cur.insertText(text)

            end_block = cur.block()
            if not end_block.text():
                end_block = end_block.previous()

            if state != self._last_state or is_prompt(state, text):
                # new chain
                chain = BlockChain(len(self._chains), doc, state, start_block)
                self._chains[chain.id] = chain
            else:
                # last chain
                chain = next(reversed(self._chains.values()))

            chain.add_blocks(start_block, end_block)
            self._last_state = state

        self.scroll_to_bottom()

    ## blocks ##

    def copy_source(self):
        clip = QtWidgets.QApplication.clipboard()

        doc = self.document()
        cur = self.textCursor()
        start = cur.selectionStart()
        end = cur.selectionEnd()

        # find selected blocks
        cur.movePosition(cur.Start)
        cur.movePosition(cur.Right, cur.MoveAnchor, start)
        start_block = cur.block()
        cur.movePosition(cur.Right, cur.KeepAnchor, end - cur.position())
        end_block = cur.block()

        # find source blocks
        text = []
        for block in doc.blocks(start_block, end_block):
            if block.userState() == BlockState.source:
                text.append(self._source_line(block.text()))

        clip.setText('\n'.join(text))

    ## folding ##

    def fold_block(self, cur_block=None):
        if cur_block is None:
            cur = self._context_cursor or self.textCursor()
            cur_block = cur.block()

        self._get_chain(cur_block).fold()
        self.reset()

    def unfold_block(self, cur_block=None):
        if cur_block is None:
            cur = self._context_cursor or self.textCursor()
            cur_block = cur.block()

        self._get_chain(cur_block).unfold()
        self.reset()

    ## internal ##

    def reset(self):
        # seems to be the only way to call _q_adjustScrollbars
        # (which is private) and reset the scroll bars
        self.setDocument(self.document())

    def _get_chain(self, block):
        return self._chains[block.userState()]

    def _source_line(self, line):
        return rx_ps.sub('', line).rstrip()
