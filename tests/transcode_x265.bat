set curDir=%cd%

..\Scripts\_build-mingw_gcc_x64-debug\HandBrakeCLI.exe -i %cd%\%1 -e x265 -o %cd%\%~n1_x265.mkv
.\compare.bat %1 %~n1_x265.mkv


