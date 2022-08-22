; Script generated by the HM NIS Edit Script Wizard.

; HM NIS Edit Wizard helper defines
!define PRODUCT_NAME "Telepythy"
!define PRODUCT_VERSION "0.5.0"
!define PRODUCT_PUBLISHER "Telepythy"
!define PRODUCT_WEB_SITE "https://github.com/dhagrow/telepythy"
!define PRODUCT_DIR_REGKEY "Software\Microsoft\Windows\CurrentVersion\App Paths\telepythy.exe"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"

SetCompressor lzma

; MUI 1.67 compatible ------
!include "MUI.nsh"

; MUI Settings
!define MUI_ABORTWARNING
!define MUI_ICON "..\res\snake.ico"
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\modern-uninstall.ico"

; Welcome page
!insertmacro MUI_PAGE_WELCOME
; License page
!insertmacro MUI_PAGE_LICENSE "..\LICENSE"
; Directory page
!insertmacro MUI_PAGE_DIRECTORY
; Instfiles page
!insertmacro MUI_PAGE_INSTFILES
; Finish page
!define MUI_FINISHPAGE_RUN "$INSTDIR\telepythy.exe"
!define MUI_FINISHPAGE_SHOWREADME "$INSTDIR\README.md"
!insertmacro MUI_PAGE_FINISH

; Uninstaller pages
!insertmacro MUI_UNPAGE_INSTFILES

; Language files
!insertmacro MUI_LANGUAGE "English"

; Reserve files
!insertmacro MUI_RESERVEFILE_INSTALLOPTIONS

; MUI end ------

Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "..\dist\telepythy-setup.exe"
InstallDir "$PROGRAMFILES64\Telepythy"
InstallDirRegKey HKLM "${PRODUCT_DIR_REGKEY}" ""
ShowInstDetails show
ShowUnInstDetails show

Section "MainSection" SEC01
  SetOutPath "$INSTDIR"
  SetOverwrite try
  File "..\build\telepythy.dist\api-ms-win-core-console-l1-1-0.dll"
  File "..\build\telepythy.dist\api-ms-win-core-datetime-l1-1-0.dll"
  File "..\build\telepythy.dist\api-ms-win-core-debug-l1-1-0.dll"
  File "..\build\telepythy.dist\api-ms-win-core-errorhandling-l1-1-0.dll"
  File "..\build\telepythy.dist\api-ms-win-core-fibers-l1-1-0.dll"
  File "..\build\telepythy.dist\api-ms-win-core-file-l1-1-0.dll"
  File "..\build\telepythy.dist\api-ms-win-core-file-l1-2-0.dll"
  File "..\build\telepythy.dist\api-ms-win-core-file-l2-1-0.dll"
  File "..\build\telepythy.dist\api-ms-win-core-handle-l1-1-0.dll"
  File "..\build\telepythy.dist\api-ms-win-core-heap-l1-1-0.dll"
  File "..\build\telepythy.dist\api-ms-win-core-interlocked-l1-1-0.dll"
  File "..\build\telepythy.dist\api-ms-win-core-libraryloader-l1-1-0.dll"
  File "..\build\telepythy.dist\api-ms-win-core-localization-l1-2-0.dll"
  File "..\build\telepythy.dist\api-ms-win-core-memory-l1-1-0.dll"
  File "..\build\telepythy.dist\api-ms-win-core-namedpipe-l1-1-0.dll"
  File "..\build\telepythy.dist\api-ms-win-core-processenvironment-l1-1-0.dll"
  File "..\build\telepythy.dist\api-ms-win-core-processthreads-l1-1-0.dll"
  File "..\build\telepythy.dist\api-ms-win-core-processthreads-l1-1-1.dll"
  File "..\build\telepythy.dist\api-ms-win-core-profile-l1-1-0.dll"
  File "..\build\telepythy.dist\api-ms-win-core-rtlsupport-l1-1-0.dll"
  File "..\build\telepythy.dist\api-ms-win-core-string-l1-1-0.dll"
  File "..\build\telepythy.dist\api-ms-win-core-synch-l1-1-0.dll"
  File "..\build\telepythy.dist\api-ms-win-core-synch-l1-2-0.dll"
  File "..\build\telepythy.dist\api-ms-win-core-sysinfo-l1-1-0.dll"
  File "..\build\telepythy.dist\api-ms-win-core-timezone-l1-1-0.dll"
  File "..\build\telepythy.dist\api-ms-win-core-util-l1-1-0.dll"
  File "..\build\telepythy.dist\api-ms-win-core-winrt-l1-1-0.dll"
  File "..\build\telepythy.dist\api-ms-win-core-winrt-string-l1-1-0.dll"
  File "..\build\telepythy.dist\api-ms-win-crt-conio-l1-1-0.dll"
  File "..\build\telepythy.dist\api-ms-win-crt-convert-l1-1-0.dll"
  File "..\build\telepythy.dist\api-ms-win-crt-environment-l1-1-0.dll"
  File "..\build\telepythy.dist\api-ms-win-crt-filesystem-l1-1-0.dll"
  File "..\build\telepythy.dist\api-ms-win-crt-heap-l1-1-0.dll"
  File "..\build\telepythy.dist\api-ms-win-crt-locale-l1-1-0.dll"
  File "..\build\telepythy.dist\api-ms-win-crt-math-l1-1-0.dll"
  File "..\build\telepythy.dist\api-ms-win-crt-process-l1-1-0.dll"
  File "..\build\telepythy.dist\api-ms-win-crt-runtime-l1-1-0.dll"
  File "..\build\telepythy.dist\api-ms-win-crt-stdio-l1-1-0.dll"
  File "..\build\telepythy.dist\api-ms-win-crt-string-l1-1-0.dll"
  File "..\build\telepythy.dist\api-ms-win-crt-time-l1-1-0.dll"
  File "..\build\telepythy.dist\api-ms-win-crt-utility-l1-1-0.dll"
  File "..\build\telepythy.dist\concrt140.dll"
  File "..\build\telepythy.dist\libcrypto-1_1.dll"
  File "..\build\telepythy.dist\libffi-7.dll"
  File "..\build\telepythy.dist\libssl-1_1.dll"
  File "..\build\telepythy.dist\msvcp140.dll"
  File "..\build\telepythy.dist\msvcp140_1.dll"
  File "..\build\telepythy.dist\msvcp140_2.dll"
  File "..\build\telepythy.dist\pyexpat.pyd"
  SetOutPath "$INSTDIR\PySide6\qt-plugins\iconengines"
  File "..\build\telepythy.dist\PySide6\qt-plugins\iconengines\qsvgicon.dll"
  SetOutPath "$INSTDIR\PySide6\qt-plugins\imageformats"
  File "..\build\telepythy.dist\PySide6\qt-plugins\imageformats\qgif.dll"
  File "..\build\telepythy.dist\PySide6\qt-plugins\imageformats\qicns.dll"
  File "..\build\telepythy.dist\PySide6\qt-plugins\imageformats\qico.dll"
  File "..\build\telepythy.dist\PySide6\qt-plugins\imageformats\qjpeg.dll"
  File "..\build\telepythy.dist\PySide6\qt-plugins\imageformats\qsvg.dll"
  File "..\build\telepythy.dist\PySide6\qt-plugins\imageformats\qtga.dll"
  File "..\build\telepythy.dist\PySide6\qt-plugins\imageformats\qtiff.dll"
  File "..\build\telepythy.dist\PySide6\qt-plugins\imageformats\qwbmp.dll"
  File "..\build\telepythy.dist\PySide6\qt-plugins\imageformats\qwebp.dll"
  SetOutPath "$INSTDIR\PySide6\qt-plugins\platforms"
  File "..\build\telepythy.dist\PySide6\qt-plugins\platforms\qdirect2d.dll"
  File "..\build\telepythy.dist\PySide6\qt-plugins\platforms\qminimal.dll"
  File "..\build\telepythy.dist\PySide6\qt-plugins\platforms\qoffscreen.dll"
  File "..\build\telepythy.dist\PySide6\qt-plugins\platforms\qwindows.dll"
  SetOutPath "$INSTDIR\PySide6\qt-plugins\styles"
  File "..\build\telepythy.dist\PySide6\qt-plugins\styles\qwindowsvistastyle.dll"
  SetOutPath "$INSTDIR\PySide6"
  File "..\build\telepythy.dist\PySide6\QtCore.pyd"
  File "..\build\telepythy.dist\PySide6\QtGui.pyd"
  File "..\build\telepythy.dist\PySide6\QtNetwork.pyd"
  File "..\build\telepythy.dist\PySide6\QtOpenGL.pyd"
  File "..\build\telepythy.dist\PySide6\QtOpenGLWidgets.pyd"
  File "..\build\telepythy.dist\PySide6\QtSvg.pyd"
  File "..\build\telepythy.dist\PySide6\QtWidgets.pyd"
  SetOutPath "$INSTDIR"
  File "..\build\telepythy.dist\pyside6.abi3.dll"
  File "..\build\telepythy.dist\python3.dll"
  File "..\build\telepythy.dist\python310.dll"
  File "..\build\telepythy.dist\qt6core.dll"
  File "..\build\telepythy.dist\qt6gui.dll"
  File "..\build\telepythy.dist\qt6network.dll"
  File "..\build\telepythy.dist\qt6opengl.dll"
  File "..\build\telepythy.dist\qt6openglwidgets.dll"
  File "..\build\telepythy.dist\qt6svg.dll"
  File "..\build\telepythy.dist\qt6widgets.dll"
  File "..\build\telepythy.dist\select.pyd"
  SetOutPath "$INSTDIR\shiboken6"
  File "..\build\telepythy.dist\shiboken6\Shiboken.pyd"
  SetOutPath "$INSTDIR"
  File "..\build\telepythy.dist\shiboken6.abi3.dll"
  SetOutPath "$INSTDIR\telepythy"
  File "..\build\telepythy.dist\telepythy\telepythy_service.pyz"
  SetOutPath "$INSTDIR"
  File "..\build\telepythy.dist\telepythy.exe"
  CreateDirectory "$SMPROGRAMS\Telepythy"
  CreateShortCut "$SMPROGRAMS\Telepythy\Telepythy.lnk" "$INSTDIR\telepythy.exe"
  File "..\build\telepythy.dist\ucrtbase.dll"
  File "..\build\telepythy.dist\unicodedata.pyd"
  File "..\build\telepythy.dist\vcruntime140.dll"
  File "..\build\telepythy.dist\vcruntime140_1.dll"
  File "..\build\telepythy.dist\_asyncio.pyd"
  File "..\build\telepythy.dist\_bz2.pyd"
  File "..\build\telepythy.dist\_ctypes.pyd"
  File "..\build\telepythy.dist\_decimal.pyd"
  File "..\build\telepythy.dist\_elementtree.pyd"
  File "..\build\telepythy.dist\_hashlib.pyd"
  File "..\build\telepythy.dist\_lzma.pyd"
  File "..\build\telepythy.dist\_multiprocessing.pyd"
  File "..\build\telepythy.dist\_overlapped.pyd"
  File "..\build\telepythy.dist\_queue.pyd"
  File "..\build\telepythy.dist\_socket.pyd"
  File "..\build\telepythy.dist\_ssl.pyd"
  File "..\build\telepythy.dist\_uuid.pyd"
  File "..\build\telepythy.dist\_zoneinfo.pyd"
  SetOverwrite ifnewer
  File "..\README.md"
SectionEnd

Section -AdditionalIcons
  CreateShortCut "$SMPROGRAMS\Telepythy\Uninstall.lnk" "$INSTDIR\uninst.exe"
SectionEnd

Section -Post
  WriteUninstaller "$INSTDIR\uninst.exe"
  WriteRegStr HKLM "${PRODUCT_DIR_REGKEY}" "" "$INSTDIR\telepythy.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayIcon" "$INSTDIR\telepythy.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "URLInfoAbout" "${PRODUCT_WEB_SITE}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"
SectionEnd


Function un.onUninstSuccess
  HideWindow
  MessageBox MB_ICONINFORMATION|MB_OK "$(^Name) was successfully removed from your computer."
FunctionEnd

Function un.onInit
  MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 "Are you sure you want to completely remove $(^Name) and all of its components?" IDYES +2
  Abort
FunctionEnd

Section Uninstall
  Delete "$INSTDIR\uninst.exe"
  Delete "$INSTDIR\README.md"
  Delete "$INSTDIR\_zoneinfo.pyd"
  Delete "$INSTDIR\_uuid.pyd"
  Delete "$INSTDIR\_ssl.pyd"
  Delete "$INSTDIR\_socket.pyd"
  Delete "$INSTDIR\_queue.pyd"
  Delete "$INSTDIR\_overlapped.pyd"
  Delete "$INSTDIR\_multiprocessing.pyd"
  Delete "$INSTDIR\_lzma.pyd"
  Delete "$INSTDIR\_hashlib.pyd"
  Delete "$INSTDIR\_elementtree.pyd"
  Delete "$INSTDIR\_decimal.pyd"
  Delete "$INSTDIR\_ctypes.pyd"
  Delete "$INSTDIR\_bz2.pyd"
  Delete "$INSTDIR\_asyncio.pyd"
  Delete "$INSTDIR\vcruntime140_1.dll"
  Delete "$INSTDIR\vcruntime140.dll"
  Delete "$INSTDIR\unicodedata.pyd"
  Delete "$INSTDIR\ucrtbase.dll"
  Delete "$INSTDIR\telepythy.exe"
  Delete "$INSTDIR\telepythy\telepythy_service.pyz"
  Delete "$INSTDIR\shiboken6.abi3.dll"
  Delete "$INSTDIR\shiboken6\Shiboken.pyd"
  Delete "$INSTDIR\select.pyd"
  Delete "$INSTDIR\qt6widgets.dll"
  Delete "$INSTDIR\qt6svg.dll"
  Delete "$INSTDIR\qt6openglwidgets.dll"
  Delete "$INSTDIR\qt6opengl.dll"
  Delete "$INSTDIR\qt6network.dll"
  Delete "$INSTDIR\qt6gui.dll"
  Delete "$INSTDIR\qt6core.dll"
  Delete "$INSTDIR\python310.dll"
  Delete "$INSTDIR\python3.dll"
  Delete "$INSTDIR\pyside6.abi3.dll"
  Delete "$INSTDIR\PySide6\QtWidgets.pyd"
  Delete "$INSTDIR\PySide6\QtSvg.pyd"
  Delete "$INSTDIR\PySide6\QtOpenGLWidgets.pyd"
  Delete "$INSTDIR\PySide6\QtOpenGL.pyd"
  Delete "$INSTDIR\PySide6\QtNetwork.pyd"
  Delete "$INSTDIR\PySide6\QtGui.pyd"
  Delete "$INSTDIR\PySide6\QtCore.pyd"
  Delete "$INSTDIR\PySide6\qt-plugins\styles\qwindowsvistastyle.dll"
  Delete "$INSTDIR\PySide6\qt-plugins\platforms\qwindows.dll"
  Delete "$INSTDIR\PySide6\qt-plugins\platforms\qoffscreen.dll"
  Delete "$INSTDIR\PySide6\qt-plugins\platforms\qminimal.dll"
  Delete "$INSTDIR\PySide6\qt-plugins\platforms\qdirect2d.dll"
  Delete "$INSTDIR\PySide6\qt-plugins\imageformats\qwebp.dll"
  Delete "$INSTDIR\PySide6\qt-plugins\imageformats\qwbmp.dll"
  Delete "$INSTDIR\PySide6\qt-plugins\imageformats\qtiff.dll"
  Delete "$INSTDIR\PySide6\qt-plugins\imageformats\qtga.dll"
  Delete "$INSTDIR\PySide6\qt-plugins\imageformats\qsvg.dll"
  Delete "$INSTDIR\PySide6\qt-plugins\imageformats\qjpeg.dll"
  Delete "$INSTDIR\PySide6\qt-plugins\imageformats\qico.dll"
  Delete "$INSTDIR\PySide6\qt-plugins\imageformats\qicns.dll"
  Delete "$INSTDIR\PySide6\qt-plugins\imageformats\qgif.dll"
  Delete "$INSTDIR\PySide6\qt-plugins\iconengines\qsvgicon.dll"
  Delete "$INSTDIR\pyexpat.pyd"
  Delete "$INSTDIR\msvcp140_2.dll"
  Delete "$INSTDIR\msvcp140_1.dll"
  Delete "$INSTDIR\msvcp140.dll"
  Delete "$INSTDIR\libssl-1_1.dll"
  Delete "$INSTDIR\libffi-7.dll"
  Delete "$INSTDIR\libcrypto-1_1.dll"
  Delete "$INSTDIR\concrt140.dll"
  Delete "$INSTDIR\api-ms-win-crt-utility-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-crt-time-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-crt-string-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-crt-stdio-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-crt-runtime-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-crt-process-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-crt-math-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-crt-locale-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-crt-heap-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-crt-filesystem-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-crt-environment-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-crt-convert-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-crt-conio-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-core-winrt-string-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-core-winrt-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-core-util-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-core-timezone-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-core-sysinfo-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-core-synch-l1-2-0.dll"
  Delete "$INSTDIR\api-ms-win-core-synch-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-core-string-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-core-rtlsupport-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-core-profile-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-core-processthreads-l1-1-1.dll"
  Delete "$INSTDIR\api-ms-win-core-processthreads-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-core-processenvironment-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-core-namedpipe-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-core-memory-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-core-localization-l1-2-0.dll"
  Delete "$INSTDIR\api-ms-win-core-libraryloader-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-core-interlocked-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-core-heap-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-core-handle-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-core-file-l2-1-0.dll"
  Delete "$INSTDIR\api-ms-win-core-file-l1-2-0.dll"
  Delete "$INSTDIR\api-ms-win-core-file-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-core-fibers-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-core-errorhandling-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-core-debug-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-core-datetime-l1-1-0.dll"
  Delete "$INSTDIR\api-ms-win-core-console-l1-1-0.dll"

  Delete "$SMPROGRAMS\Telepythy\Uninstall.lnk"
  Delete "$SMPROGRAMS\Telepythy\Telepythy.lnk"

  RMDir "$SMPROGRAMS\Telepythy"
  RMDir "$INSTDIR\telepythy"
  RMDir "$INSTDIR\shiboken6"
  RMDir "$INSTDIR\PySide6\qt-plugins\styles"
  RMDir "$INSTDIR\PySide6\qt-plugins\platforms"
  RMDir "$INSTDIR\PySide6\qt-plugins\imageformats"
  RMDir "$INSTDIR\PySide6\qt-plugins\iconengines"
  RMDir "$INSTDIR\PySide6"
  RMDir "$INSTDIR"

  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
  DeleteRegKey HKLM "${PRODUCT_DIR_REGKEY}"
  SetAutoClose true
SectionEnd
