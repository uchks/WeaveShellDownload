#!/usr/bin/env bash
clear

download_and_extract() { # Function to download files via cURL and extract .tar.gz.
  local url="$1"
  local file="$2"
  curl -L -o "$file" "$url"
  clear

  if [[ "$file" == *.jar ]]; then
    :
  else
    tar -xf "$file" || { echo "Error extracting $file"; exit 1; }
    rm "$file"
  fi
}

get_latest_weave_loader_version() { # Function to parse GitHub API and find the latest version of Weave Loader.
  local latest_version_url="https://api.github.com/repos/Weave-MC/Weave-Loader/releases/latest"
  local version=$(curl -s "$latest_version_url" | grep -oE '"tag_name": "([^"]+)' | cut -d'"' -f4)
  version="${version#v}"
  echo "$version"
}

cd ~/Documents
mkdir -p lunar-client-qt
cd lunar-client-qt

if [[ "$OSTYPE" == "linux"* ]]; then # Detects if user is running on linux, download and extract linux version.
  download_and_extract "https://github.com/Youded-byte/lunar-client-qt/releases/latest/download/linux.tar.gz" "linux.tar.gz"
elif [[ "$(uname)" == "Darwin" ]]; then # Detects if user is running on macOS, download and extract macOS version.
  download_and_extract "https://github.com/Youded-byte/lunar-client-qt/releases/latest/download/mac.tar.gz" "mac.tar.gz"
else
  echo "Unsupported operating system."
  exit 1
fi

latest_weave_loader_version=$(get_latest_weave_loader_version) # Creates a variable of latest Weave Loader version for use below.
download_and_extract "https://github.com/Weave-MC/Weave-Loader/releases/download/v$latest_weave_loader_version/Weave-Loader-Agent-$latest_weave_loader_version.jar" "Weave-Loader-Agent-$latest_weave_loader_version.jar"
mkdir -p ~/.weave/mods

echo "LCQT should open now, just add Weave as an agent"
echo "~/Documents/lunar-client-qt/Weave-Loader-$latest_weave_loader_version.jar"
echo
echo "Put your mods in ~/.weave/mods or use LCQT's mod manager."
echo
echo "I recommend defining \"Use Custom JRE\" to Lunar's bundled JRE:"
echo "~/.lunarclient/jre"

if [[ "$(uname)" == "Darwin" ]]; then
  open ./lunar-client-qt.app # macOS version is a .app, opens the .app
else
  ./lunar-client-qt 
fi
