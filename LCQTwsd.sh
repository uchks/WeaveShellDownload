#!/usr/bin/env bash

download_and_extract() {
  local url="$1"
  local file="$2"
  curl -L -o "$file" "$url"
  
  if [[ "$file" == *.jar ]]; then
    echo "Downloaded $file"
  else
    tar -xf "$file" || { echo "Error extracting $file"; exit 1; }
    rm "$file"
  fi
}

get_latest_weave_loader_version() {
  local latest_version_url="https://api.github.com/repos/Weave-MC/Weave-Loader/releases/latest"
  local version="$(curl -s "$latest_version_url" | grep -oE '"tag_name": "([^"]+)' | cut -d'"' -f4)"
  echo "$version"
}

cd ~/Documents
mkdir -p lunar-client-qt
cd lunar-client-qt

if [[ "$OSTYPE" == "linux"* ]]; then
  download_and_extract "https://github.com/Youded-byte/lunar-client-qt/releases/latest/download/linux.tar.gz" "linux.tar.gz"
elif [[ "$(uname)" == "Darwin" ]]; then
  if [[ "$(uname -p)" == "i386" || "$(uname -p)" == "arm" ]]; then
    download_and_extract "https://github.com/Youded-byte/lunar-client-qt/releases/latest/download/mac.tar.gz" "mac.tar.gz"
  else
    echo "Unsupported operating system."
    exit 1
  fi
else
  echo "Unsupported operating system."
  exit 1
fi

latest_weave_loader_version=$(get_latest_weave_loader_version)
download_and_extract "https://github.com/Weave-MC/Weave-Loader/releases/download/$latest_weave_loader_version/Weave-Loader-Agent-$latest_weave_loader_version.jar" "Weave-Loader-Agent-$latest_weave_loader_version.jar"
mkdir -p ~/.weave/mods

echo "Put your modifications in ~/.weave/mods."
echo "LCQT should open now, just add Weave as an agent. ~/Documents/lunar-client-qt/Weave-Loader-0.2.4.jar"
echo "LCQT also has a nice mod manager you can use if you wish."
echo "I would also recommend defining your Java runtime in the general tab to Lunar's bundled Java installation in ~/.lunarclient/jre"

cd ~/Documents/lunar-client-qt
if [[ "$(uname)" == "Darwin" ]]; then
  if [[ "$(uname -p)" == "i386" || "$(uname -p)" == "arm" ]]; then
    open ./lunar-client-qt.app
  else
    ./lunar-client-qt
  fi
fi
