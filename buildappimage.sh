#!/bin/sh
case $1 in '')
    echo Usage: buildappimage.sh {x86,x64}
    exit
    ;;
    x86)
    if [ ! -e samflashertool_x86.AppDir ]; then echo Cannot find the samflashertool_x86.AppDir.; fi
    ;;
    x64)
    if [ ! -e samflashertool.AppDir ]; then echo Cannot find the samflashertool.AppDir.; fi
esac
echo Downloading appimagetool...
case $(sudo dpkg --print-architecture) in amd64)
    wget -O appimagetool-x86_64.AppImage https://github.com/AppImage/AppImageKit/releases/download/13/appimagetool-x86_64.AppImage -q
    chmod +x appimagetool-x86_64.AppImage
    ;;
    i?86)
    wget -O appimagetool-i686.AppImage https://github.com/AppImage/AppImageKit/releases/download/12/appimagetool-i686.AppImage -q
    chmod +x appimagetool-i686.AppImage
esac
echo Initialising build...
sleep 0.3
case $1 in x64)
    case $(sudo dpkg --print-architecture) in amd64)
        ./appimagetool-x86_64.AppImage samflashertool.AppDir/ SamFlasher-Tool-x64-$(date +'%s').AppImage
        ;;
        i?86)
        ./appimagetool-i686.AppImage samflashertool.AppDir/ SamFlasher-Tool-x64-$(date +'%s').AppImage
    esac
    ;;
    x86)
    case $(sudo dpkg --print-architecture) in amd64)
        ./appimagetool-x86_64.AppImage samflashertool_x86.AppDir/ SamFlasher-Tool-x86-$(date +'%s').AppImage
        ;;
        i?86)
        ./appimagetool-i686.AppImage samflashertool_x86.AppDir/ SamFlasher-Tool-x86-$(date +'%s').AppImage
    esac
esac
rm appimagetool-*.AppImage
echo Build done.
