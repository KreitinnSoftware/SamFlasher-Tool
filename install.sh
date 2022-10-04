echo Checking Dependencies...
sleep 1
if [ ! -e /usr/bin/yad ]; then
    dps=$(($dps+1))
fi
if [ ! -e /usr/bin/heimdall ]; then
    dps=$(($dps+1)) 
fi
case $dps in 2)
    echo Installing Dependencies...
    sudo apt install heimdall-flash yad -y
esac
case $dps in 1)
    echo Installing Dependencies...
    sudo apt install heimdall-flash yad -y
esac
echo Installing SamFlasher Tool v1.2...
sleep 1
sudo cp samflasher-tool /usr/bin/samflasher-tool
sudo chmod +x /usr/bin/samflasher-tool
cp icon.png $HOME/.local/share/icons/samflashertool.png    
sm=SamFlasherTool.desktop
echo [Desktop Entry] > $sm
echo Name=SamFlasher Tool v1.2 >> $sm
echo Comment=SamFlasher Tool based on Heimdall >> $sm
echo Exec=/usr/bin/samflasher-tool >> $sm
echo Icon=$HOME/.local/share/icons/samflashertool.png >> $sm
echo Terminal=false >> $sm
echo StartupWMClass=SamFlasherTool >> $sm
echo Type=Application >> $sm
echo 'Categories=Other;' >> $sm
mv $sm $HOME/.local/share/applications/$sm
echo SamFlasher Tool v1.2 installed sucessfully.
