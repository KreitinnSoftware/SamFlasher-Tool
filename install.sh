OS=$(cat /etc/os-release)
echo Checking Dependencies...
sleep 0.5
case $OS in *arch*linux*)
    echo Arch Linux detected!
    if [ ! -e /usr/bin/heimdall ]; then
        sudo pacman -S heimdall
    fi
    if [ ! -e /usr/bin/yad ]; then
        sudo pacman -S yad
    fi
    ;;
    *ubuntu*)
    echo Ubuntu detected!
    if [ ! -e /usr/bin/heimdall ]; then
        sudo apt install heimdall-flash
    fi
    if [ ! -e /usr/bin/yad ]; then
        sudo apt install yad
    fi
esac
if [ ! -e $HOME/.local/share ]; then mkdir $HOME/.local/share; fi
if [ ! -e $HOME/.local/share/applications ]; then mkdir $HOME/.local/share/applications; fi
if [ ! -e $HOME/.local/share/icons ]; then mkdir $HOME/.local/share/icons; fi
echo Installing SamFlasher Tool v1.6...
sleep 0.4
sudo cp samflasher-tool /usr/bin/samflasher-tool
sudo chmod +x /usr/bin/samflasher-tool
cp icon.png $HOME/.local/share/icons/samflashertool.png    
sm=SamFlasherTool.desktop
echo [Desktop Entry] > $sm
echo Name=SamFlasher Tool v1.6 >> $sm
echo Comment=SamFlasher Tool based on Heimdall >> $sm
echo Exec=/usr/bin/samflasher-tool >> $sm
echo Icon=$HOME/.local/share/icons/samflashertool.png >> $sm
echo Terminal=false >> $sm
echo StartupWMClass=SamFlasherTool >> $sm
echo Type=Application >> $sm
echo 'Categories=Other;' >> $sm
mv $sm $HOME/.local/share/applications/$sm
if [ ! -e $HOME/.local/share/samflasher-tool-settings/ ]; then
    mkdir $HOME/.local/share/samflasher-tool-settings/; fi
echo EN-US > $HOME/.local/share/samflasher-tool-settings/language.txt
echo SamFlasher Tool v1.6 installed sucessfully.

