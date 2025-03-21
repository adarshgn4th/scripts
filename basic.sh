#!/bin/bash

# Update package lists
echo "Updating package lists..."
sudo apt update -y

# Install prerequisites
echo "Installing prerequisites..."
sudo apt install -y wget curl gpg apt-transport-https software-properties-common

# Install Google Chrome
echo "Installing Google Chrome..."
wget -qO- https://dl.google.com/linux/linux_signing_key.pub | sudo gpg --dearmor -o /usr/share/keyrings/google-chrome-keyring.gpg
echo 'deb [signed-by=/usr/share/keyrings/google-chrome-keyring.gpg] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt update -y
sudo apt install -y google-chrome-stable

# Install Skype
echo "Installing Skype..."
wget -O skype.deb https://go.skype.com/skypeforlinux-64.deb
sudo apt install -y ./skype.deb
rm -f skype.deb

# Install GitHub Desktop
echo "Installing GitHub Desktop..."
wget -O github-desktop.deb https://github.com/shiftkey/desktop/releases/download/release-3.3.11-linux1/GitHubDesktop-linux-amd64-3.3.11-linux1.deb
sudo apt install -y ./github-desktop.deb
rm -f github-desktop.deb

# Install VS Code
echo "Installing Visual Studio Code..."
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /usr/share/keyrings/packages.microsoft.gpg > /dev/null
echo "deb [signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list
sudo apt update -y
sudo apt install -y code

# Install DeskTime
echo "Installing DeskTime..."
wget -O desktime.deb https://desktime.com/updates/electron/linux?deb
sudo apt install -y ./desktime.deb
rm -f desktime.deb

# Install Git
echo "Installing Git..."
sudo apt install -y git


# Install Git
echo "Installing Anydesk..."
sudo apt install ca-certificates curl apt-transport-https
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://keys.anydesk.com/repos/DEB-GPG-KEY -o /etc/apt/keyrings/keys.anydesk.com.asc
sudo chmod a+r /etc/apt/keyrings/keys.anydesk.com.asc
echo "deb [signed-by=/etc/apt/keyrings/keys.anydesk.com.asc] https://deb.anydesk.com all main" | sudo tee /etc/apt/sources.list.d/anydesk-stable.list > /dev/null
sudo apt update
sudo apt install anydesk

# Cleanup
echo "Installation complete!"
