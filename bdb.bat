@echo off

:: Debug blender in GDB
set local

cd ../install
gdb --args blender --disable-crash-handler --debug-gpu 2> nul
cd ../blender

endlocal
