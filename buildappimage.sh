#!/bin/sh
echo Downloading appimagetool...
wget -O appimagetool-x86_64.AppImage https://github.com/AppImage/AppImageKit/releases/download/13/appimagetool-x86_64.AppImage -q
chmod +x appimagetool-x86_64.AppImage
if [ ! -e samflashertool.AppDir ]; then echo Cannot find the samflashertool.AppDir.; fi
echo Initialising build...
sleep 0.3
./appimagetool-x86_64.AppImage samflashertool.AppDir/ SamFlasher-Tool-x86_64-$(date +'%s').AppImage
rm appimagetool-x86_64.AppImage
echo Build done.
