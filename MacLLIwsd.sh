cd ~/Documents
mkdir lunar-launcher-inject
cd ~/Documents/lunar-launcher-inject
curl https://github.com/Nilsen84/lunar-launcher-inject/releases/download/v1.3.0/lunar-launcher-inject-mac-1.3.0 -output lli
curl https://github.com/Weave-MC/Weave-Loader/releases/download/v0.2.4/Weave-Loader-Agent-0.2.4.jar -output Weave-Loader-Agent-0.2.4.jar
cd ~/
mkdir .weave
cd ~/.weave
mkdir mods
cd ~/Documents/lunar-launcher-inject
chmod +x lli
echo you will have to run 'chmod +x lli' and run the launcher through lli every time you want to use weave. since you are on Mac after chmod it should be okay to double click it.
echo the script will attempt to open lli, but if lunar client's launcher is open it won't work and will need to be done manually
./lli
