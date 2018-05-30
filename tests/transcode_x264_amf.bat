set curDir=%cd%
cls
..\_build-mingw_gcc_x64-debug\HandBrakeCLI.exe -i %cd%\%1 -e x264_amf -o %cd%\%~n1_x264_amf.mkv
::.\compare.bat %1 %~n1_x264_amf.mkv


