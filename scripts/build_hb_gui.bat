cls
set msbuild="C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\MSBuild\15.0\Bin\msbuild.exe"
set pathToNSIS=C:\Program Files (x86)\NSIS3343;
::set toolset=v140
set project=build.xml
::HandBrake.sln
::set PATH=%PATH%;%pathToNSIS%
set curDir=%cd%

cd ..\Sources\win\CS
%msbuild% %project% /property:Configuration=Release /t:Release /property:Platform=x64 /p:PlatformToolset=%toolset% /m

copy %curDir%\..\_build-mingw_gcc_x64-debug\libhb\hb.dll %curDir%\..\Sources\win\CS\HandBrakeWPF\bin\x64\Release\hb.dll
cd %curDir%