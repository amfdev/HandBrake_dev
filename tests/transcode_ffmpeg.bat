set curDir=%cd%

..\_build-mingw_gcc_x64-debug\HandBrakeCLI.exe -i %cd%\%1 -e ffmpeg -o %cd%\%~n1_ffmpeg.mkv
.\compare.bat %1 %~n1_ffmpeg.mkv