echo Verificando Dependências...
sleep 1
if [ ! -e /usr/bin/yad ]; then
    dps=$(($dps+1))
fi
if [ ! -e /usr/bin/heimdall ]; then
    dps=$(($dps+1)) 
fi
case $dps in 2)
    echo Instalando Dependências...
    sudo apt install heimdall-flash yad -y
esac
case $dps in 1)
    echo Instalando Dependências...
    sudo apt install yad -y
esac
echo Instalando SamFlasher Tool v1.0...
sleep 1
sudo cp samflasher-tool /usr/bin/samflasher-tool
sudo chmod +x /usr/bin/samflasher-tool
cp icon.png $HOME/.local/share/icons/samflashertool.png    
sm=SamFlasherTool.desktop
echo [Desktop Entry] > $sm
echo Name=SamFlasher Tool v1.0 >> $sm
echo Comment=SamFlasher Tool based on Heimdall by Kreitinn >> $sm
echo Exec=/usr/bin/samflasher-tool >> $sm
echo Icon=$HOME/.local/share/icons/samflashertool.png >> $sm
echo Terminal=false >> $sm
echo StartupWMClass=SamFlasherTool >> $sm
echo Type=Application >> $sm
echo 'Categories=Other;' >> $sm
mv $sm $HOME/.local/share/applications/$sm
echo SamFlasher Tool v1.0 instalado com sucesso.
