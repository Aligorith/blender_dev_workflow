# turn everything OFF except for python which defaults to ON
# and is needed for the UI
#
# Example usage:
#   cmake -C../blender/build_files/cmake/config/blender_lite.cmake  ../blender
#

set(WITH_INSTALL_PORTABLE    ON  CACHE BOOL "" FORCE)
set(WITH_SYSTEM_GLEW         ON  CACHE BOOL "" FORCE)

# XXX: for general dev, not needed...
set(WITH_PYTHON_INSTALL      OFF  CACHE BOOL "" FORCE)
set(WITH_PYTHON_INSTALL_NUMPY  OFF  CACHE BOOL "" FORCE)

# Override CMake flags to limit the number of cores the compiler can use
set(CMAKE_C_FLAGS     "${CMAKE_C_FLAGS} /maxcpucount:3 /mp:1")

set(WITH_BUILDINFO           ON CACHE BOOL "" FORCE)
set(WITH_BULLET              ON CACHE BOOL "" FORCE)
set(WITH_CODEC_AVI           ON CACHE BOOL "" FORCE)
set(WITH_CODEC_FFMPEG        ON CACHE BOOL "" FORCE)
set(WITH_CODEC_SNDFILE       OFF CACHE BOOL "" FORCE)
set(WITH_CYCLES              OFF CACHE BOOL "" FORCE)
set(WITH_FFTW3               ON CACHE BOOL "" FORCE)
set(WITH_LIBMV               ON CACHE BOOL "" FORCE) # looks like this can't actually be disabled
set(WITH_LLVM                OFF CACHE BOOL "" FORCE)
set(WITH_GAMEENGINE          OFF CACHE BOOL "" FORCE)
set(WITH_COMPOSITOR          OFF CACHE BOOL "" FORCE)
set(WITH_FREESTYLE           ON CACHE BOOL "" FORCE)
set(WITH_GHOST_XDND          OFF CACHE BOOL "" FORCE)
set(WITH_IK_SOLVER           ON CACHE BOOL "" FORCE)
set(WITH_IK_ITASC            ON CACHE BOOL "" FORCE)
set(WITH_IMAGE_CINEON        OFF CACHE BOOL "" FORCE)
set(WITH_IMAGE_DDS           OFF CACHE BOOL "" FORCE)
set(WITH_IMAGE_FRAMESERVER   OFF CACHE BOOL "" FORCE)
set(WITH_IMAGE_HDR           OFF CACHE BOOL "" FORCE)
set(WITH_IMAGE_OPENEXR       OFF CACHE BOOL "" FORCE)
set(WITH_IMAGE_OPENJPEG      ON CACHE BOOL "" FORCE)
set(WITH_IMAGE_REDCODE       OFF CACHE BOOL "" FORCE)
set(WITH_IMAGE_TIFF          ON CACHE BOOL "" FORCE)
set(WITH_INPUT_NDOF          OFF CACHE BOOL "" FORCE)
set(WITH_INTERNATIONAL       OFF CACHE BOOL "" FORCE)
set(WITH_JACK                OFF CACHE BOOL "" FORCE)
set(WITH_LZMA                ON CACHE BOOL "" FORCE)
set(WITH_LZO                 ON CACHE BOOL "" FORCE)
set(WITH_MOD_BOOLEAN         OFF CACHE BOOL "" FORCE)
set(WITH_MOD_FLUID           OFF CACHE BOOL "" FORCE)
set(WITH_MOD_REMESH          OFF CACHE BOOL "" FORCE)
set(WITH_MOD_SMOKE           OFF CACHE BOOL "" FORCE)
set(WITH_MOD_OCEANSIM        OFF CACHE BOOL "" FORCE)
set(WITH_AUDASPACE           ON CACHE BOOL "" FORCE)
set(WITH_OPENAL              ON CACHE BOOL "" FORCE)
set(WITH_OPENCOLLADA         OFF CACHE BOOL "" FORCE)
set(WITH_OPENCOLORIO         OFF CACHE BOOL "" FORCE)
set(WITH_OPENIMAGEIO         OFF CACHE BOOL "" FORCE)
set(WITH_OPENMP              OFF CACHE BOOL "" FORCE)
set(WITH_RAYOPTIMIZATION     OFF CACHE BOOL "" FORCE)
set(WITH_SDL                 ON CACHE BOOL "" FORCE)
set(WITH_X11_XINPUT          OFF CACHE BOOL "" FORCE)
set(WITH_X11_XF86VMODE       OFF CACHE BOOL "" FORCE)



