set curDir=%cd%
cls
..\_build-mingw_gcc_x64-debug\HandBrakeCLI.exe -i %cd%\%1 -e vce_h265 -o %cd%\%~n1_x265_vce.mkv
::.\compare.bat %1 %~n1_x264_amf.mkv


