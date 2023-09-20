cd ~/Documents
mkdir lunar-client-qt
cd lunar-client-qt
curl "https://github.com/Youded-byte/lunar-client-qt/releases/download/v1.5.4/linux.tar.gz" -O youded-lcqt.tar.gz
curl "https://github.com/Weave-MC/Weave-Loader/releases/download/v0.2.4/Weave-Loader-Agent-0.2.4.jar" -O Weave-Loader-Agent-0.2.4.jar
tar -xf youded-lcqt.tar.gz
cd ~/
mkdir .weave
cd ~/.weave
mkdir mods
echo put mods in ~/.weave/mods
echo lcqt should open now, just add weave as an agent. ~/Documents/lunar-client-qt/Weave-Loader-0.2.4.jar
echo lcqt also has a nice mod manager you can use
cd ~/Documents/lunar-client-qt/Lunar Client QT/
./lunar-client-qt

