# HandBrake_dev



### Build GUI and create installer

nuget.exe is neaded(https://www.nuget.org/downloads)

Run Scripts/build_hb_gui.bat

In case of  makensis error:
1. Download NSIS (http://nsis.sourceforge.net/Download) and install
2. Download Inetc (http://nsis.sourceforge.net/mediawiki/images/c/c9/Inetc.zip) and put into 
NSIS plugins dir(C:\Program Files (x86)\NSIS\Plugins)
3. If neaded set pathToNSIS variable in build_hb_gui script on line 3
4. Run Scripts/build_hb_gui.bat