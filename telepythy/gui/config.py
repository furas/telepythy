import os

import appdirs
import snekcfg
from qtpy import QtGui, QtWidgets

from ..lib import logs
from ..lib import utils

log = logs.get(__name__)

def get_config_path(*names):
    cfg_dir = appdirs.user_config_dir('telepythy', False)
    return os.path.join(cfg_dir, *names)

def get_config_file_path():
    return get_config_path('telepythy.cfg')

def expand_path(path):
    return os.path.expanduser(os.path.expandvars(path))

def init(path=None):
    path = expand_path(path or get_config_file_path())

    os.makedirs(os.path.dirname(path), exist_ok=True)
    log.debug('config: %s', path)

    # rename the snekcfg logger
    snekcfg.log = logs.get(log.name)

    cfg = snekcfg.Config(path)
    register_types(cfg)

    cfg.register_type('path', None, expand_path)

    sct = cfg.section('profiles')
    sct.define('default.command', utils.DEFAULT_COMMAND)
    sct.define('connect.connect', utils.DEFAULT_ADDR)
    sct.define('serve.serve', utils.DEFAULT_ADDR)

    cfg.define('startup.source_path', get_config_path('startup.py'), 'path')

    sct = cfg.section('style')
    sct.define('app', 'dark')
    sct.define('highlight', 'gruvbox-dark')
    sct.define('font', QtGui.QFont('monospace', 12))

    sct = cfg.section('window')

    size = QtWidgets.QApplication.primaryScreen().availableSize()
    default_size = (int(size.width() / 2.5), int(size.height() / 1.5))
    sct.define('size', default_size, 'tuple[int, ...]')

    sct.define('view.menu', True)

    cfg.read()
    cfg.write()

    return cfg

def register_types(cfg):
    def str2font(v):
        family, size = v.split(',')
        return QtGui.QFont(family.strip(), int(size.strip()))
    cfg.register_type(QtGui.QFont,
        lambda v: f'{v.family()},{v.pointSize()}',
        str2font,
        )
