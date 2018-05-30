set curDir=%cd%

..\_build-mingw_gcc_x64-debug\HandBrakeCLI.exe -i %cd%\%1 -e x264 -o %cd%\%~n1_x264.mkv
.\compare.bat %1 %~n1_x264.mkv


