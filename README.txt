This repo contains all the various workflow scripts/utilities/settings files
I use when developing Blender on Windows with CMake/MSVC2013.

Note: 
 The build scripts depend on the "CustomLogger.dll" component, for filtering
 the MsBuild output. The source code for compiling CustomLogger.dll can be
 found at:
      https://github.com/Aligorith/blender_msbuild_loggers

-------------

File Descriptions
=================

GIT STUFF:
 * `git-info-exclude` - ".git/info/exclude" file. Use this to hide all the workflow tools provided here


CMAKE CONFIG FILES:
 * `blender_core.cmake` - Reduced CMake profile that disables all "non-essential" 3rd-party libraries
   that some features in Blender rely on. Again to reduce disk space usage, compile troubles, and to
   avoid having to deal with stuff I don't use. (Note: "Cycles" is disabled too, since it has gazillions
   of dependencies, and annoyingly gets recompiled everytime I do so much as add a punctuation-mark to
   a RNA property's tooltip! That is really bad for a lot of the work I do, as it really gets in the way!)
   It is used by all the compile scripts below.

 * `blender_core_scripts.cmake` - Used by `the bsc.bat` compile script - Disable compiling Blender, so we
   can just copy the scripts faster.


BLENDER 2.7X:
 * `bmc.bat` - Do a "full compile" of Blender. Release build.
 * `bmc_full.bat` - Like bmc.bat, except the Custom Logger stuff is disabled. 
    Use to track down problems caused by the logger.

 * `bsc.bat` - Run CMake to copy over scripts only.
   (TODO: This could be a lot faster if we hacked up our own logic for this)
 * `smc.bat` - Only compile the "C/C++" parts of Blender (i.e. don't copy scripts).
    Use for faster compiles when no scripts change.

 * `..\install\blender` - Command used to run newly compiled Blender. 
    It requires a symlink ("..\install") pointing to the `..\build\bin\Release\` folder, sitting in `..\`


BLENDER 2.8:  (Special commands are needed due to various problems on my config)
 * `dmc.bat` - Do a "full compile" of Blender in "ReleaseWithDebInfo" mode.
    This is less space intensive and performance-affecting than a full debug build, while still allowing
    us to get some backtraces to track down segfaults. This is important when working with a pre-alpha
    codebase where we get extremely regular crashes.

 * `dbf.bat` - Run the "ReleaseWithDebInfo" build created by `dmc.bat`.
   I made this wrapper for 2 reasons: 1) To work around some driver-related problems causing crashes when
   starting Blender (i.e. --debug-gpu is needed to run Blender at all, but then I need to silence all stderr
   output to get it semi-usable at all),  and  2) To avoid having to type too much to run the build.

 * `rbf.bat` - Run the "Release" build created by `bmc.bat`.  This is like `dbf.bat`, except it runs the standard build.

----------------

Installation
============

1) Rename and copy `git-info-exclude` to `.git/info/exclude`
2) Copy over all the .bat files to the root folder of the repo (i.e. alongside `.gitignore`)
3) Copy over the .cmake files to `build_files/cmake/config/`
4) Add the contents of `git_config_addons.ini` to the end of `.git/config`


----------------

Original Author: Joshua Leung (aligorith@gmail.com), adapted from Blender's `make.bat` and `blender-lite.cmake`



   
