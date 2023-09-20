cd ~/Documents
mkdir lunar-launcher-inject
cd ~/Documents/lunar-launcher-inject
echo please kill the lunar launcher task.
curl https://github.com/Nilsen84/lunar-launcher-inject/releases/download/v1.3.0/lunar-launcher-inject-linux-1.3.0 -output lli
curl https://github.com/Weave-MC/Weave-Loader/releases/download/v0.2.4/Weave-Loader-Agent-0.2.4.jar -output Weave-Loader-Agent-0.2.4.jar
echo 'chmod +x lli' must be run before opening lli.
cd ~/
mkdir .weave
cd ~/.weave
mkdir mods
echo put mods in ~/.weave/mods
cd ~/Documents/lunar-launcher-inject
chmod +x lli
./lli
