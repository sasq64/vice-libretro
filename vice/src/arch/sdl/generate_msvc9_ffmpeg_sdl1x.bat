@echo off

rem generate_msvc9_ffmpeg_sdl1x.bat - generate MSVC9/VS2008 SDL1.x & FFMPEG project directory
rem
rem Written by
rem  Marco van den Heuvel <blackystardust68@yahoo.com>
rem
rem This file is part of VICE, the Versatile Commodore Emulator.
rem See README for copyright notice.
rem
rem  This program is free software; you can redistribute it and/or modify
rem  it under the terms of the GNU General Public License as published by
rem  the Free Software Foundation; either version 2 of the License, or
rem  (at your option) any later version.
rem
rem  This program is distributed in the hope that it will be useful,
rem  but WITHOUT ANY WARRANTY; without even the implied warranty of
rem  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
rem  GNU General Public License for more details.
rem
rem  You should have received a copy of the GNU General Public License
rem  along with this program; if not, write to the Free Software
rem  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
rem  02111-1307  USA.

if not exist ..\win32\vs_tmpl\mkmsvc.exe goto missingmkmsvc
echo generating SDL1x MSVC9 project as win32-sdl1x-msvc9-ffmpeg
if exist win32-sdl1x-msvc9-ffmpeg goto removedir
:makemsvcdir
mkdir win32-sdl1x-msvc9-ffmpeg
cd ..\win32\vs_tmpl
mkmsvc.exe -ffmpeg -sdl -9 vice
cd ..\..\sdl
copy msvc-files\make-bindist-sdl1x.bat.proto win32-sdl1x-msvc9-ffmpeg\make-msvc-bindist.bat
copy msvc-files\debug.h win32-sdl1x-msvc9-ffmpeg
copy msvc-files\dirent.h win32-sdl1x-msvc9-ffmpeg
copy msvc-files\ide-config.h win32-sdl1x-msvc9-ffmpeg
copy msvc-files\ide-siddefs.h win32-sdl1x-msvc9-ffmpeg
copy msvc-files\ide-siddtvdefs.h win32-sdl1x-msvc9-ffmpeg
copy msvc-files\inttypes.h win32-sdl1x-msvc9-ffmpeg
copy msvc-files\stdint.h win32-sdl1x-msvc9-ffmpeg
copy msvc-files\vice.manifest win32-sdl1x-msvc9-ffmpeg
copy msvc-files\winid_ia64.bat win32-sdl1x-msvc9-ffmpeg
copy msvc-files\winid_x64.bat win32-sdl1x-msvc9-ffmpeg
copy msvc-files\winid_x86.bat win32-sdl1x-msvc9-ffmpeg
copy msvc-files\ffmpeg-config.h win32-sdl1x-msvc9-ffmpeg
copy msvc-files\lame-config.h win32-sdl1x-msvc9-ffmpeg
copy msvc-files\x264_config.h win32-sdl1x-msvc9-ffmpeg
copy msvc-files\x264-config.h win32-sdl1x-msvc9-ffmpeg
echo SDL1x MSVC9 project files generated in win32-sdl1x-msvc9-ffmpeg
goto end
:missingmkmsvc
echo ..\win32\vs_tmpl\mkmsvc.exe is missing
goto end
:removedir
echo y | del win32-sdl1x-msvc9-ffmpeg\*.* /S
rd win32-sdl1x-msvc9-ffmpeg /s /q
if exist win32-sdl1x-msvc9-ffmpeg goto cannotremovedir
goto makemsvcdir
:cannotremovedir
echo can't delete the win32-sdl1x-msvc9-ffmpeg directory, please remove win32-sdl1x-msvc9-ffmpeg manually and run this batch file again.
:end
pause
