@echo off
REM This batch file does an out-of-source CMake build in ../build_windows
REM This is for users who like to configure & build Blender with a single command.

setlocal ENABLEEXTENSIONS
set BLENDER_DIR=%~dp0
set BUILD_DIR=%BLENDER_DIR%..\build
set BUILD_TYPE=Release
set BUILD_CMAKE_ARGS=

REM Detect MSVC Installation
if DEFINED VisualStudioVersion goto msvc_detect_finally
set VALUE_NAME=ProductDir
REM Check 64 bits
set KEY_NAME="HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\VisualStudio\12.0\Setup\VC"
for /F "usebackq skip=2 tokens=1-2*" %%A IN (`REG QUERY %KEY_NAME% /v %VALUE_NAME% 2^>nul`) DO set MSVC_VC_DIR=%%C
if DEFINED MSVC_VC_DIR goto msvc_detect_finally
REM Check 32 bits
set KEY_NAME="HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\VisualStudio\12.0\Setup\VC"
for /F "usebackq skip=2 tokens=1-2*" %%A IN (`REG QUERY %KEY_NAME% /v %VALUE_NAME% 2^>nul`) DO set MSVC_VC_DIR=%%C
if DEFINED MSVC_VC_DIR goto msvc_detect_finally
:msvc_detect_finally
if DEFINED MSVC_VC_DIR call "%MSVC_VC_DIR%\vcvarsall.bat"


REM Sanity Checks
where /Q msbuild
if %ERRORLEVEL% NEQ 0 (
	echo Error: "MSBuild" command not in the PATH.
	echo You must have MSVC installed and run this from the "Developer Command Prompt"
	echo ^(available from Visual Studio's Start menu entry^), aborting!
	goto EOF
)
where /Q cmake
if %ERRORLEVEL% NEQ 0 (
	echo Error: "CMake" command not in the PATH.
	echo You must have CMake installed and added to your PATH, aborting!
	goto EOF
)
if NOT EXIST %BLENDER_DIR%..\lib\nul (
	echo Error: Path to libraries not found "%BLENDER_DIR%..\lib\"
	echo This is needed for building, aborting!
	goto EOF
)



set BUILD_CMAKE_ARGS=%BUILD_CMAKE_ARGS% ^
	-C"%BLENDER_DIR%\build_files\cmake\config\blender_core.cmake"

if "%PROCESSOR_ARCHITECTURE%" == "x86" (
	set WINDOWS_ARCH=
) else (
	set WINDOWS_ARCH=Win64
)

set BUILD_CMAKE_ARGS=%BUILD_CMAKE_ARGS% -G "Visual Studio 12 2013 %WINDOWS_ARCH%"
if NOT EXIST %BUILD_DIR%\nul (
	mkdir %BUILD_DIR%
)

REM Only configure on first run
if NOT EXIST %BUILD_DIR%\Blender.sln (
	cmake ^
		%BUILD_CMAKE_ARGS% ^
		-H%BLENDER_DIR% ^
		-B%BUILD_DIR% ^
		%BUILD_CMAKE_ARGS%

	if %ERRORLEVEL% NEQ 0 (
		echo "Configuration Failed"
		goto EOF
	)
)

REM Scripts only
msbuild ^
	%BUILD_DIR%\INSTALL.vcxproj ^
	/property:Configuration=%BUILD_TYPE% ^
	/verbosity:quiet

echo.
echo edit build configuration with: "%BUILD_DIR%\CMakeCache.txt" run make again to rebuild.
echo Blender successfully built, run from: "%BUILD_DIR%\bin\%BUILD_TYPE%"
echo.

:EOF

