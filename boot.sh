#!/bin/bash

ansi_art='██████   █████  ██████   ██████ ██   ██ ██    ██ 
██   ██ ██   ██ ██   ██ ██      ██   ██  ██  ██  
██████  ███████ ██████  ██      ███████   ████   
██   ██ ██   ██ ██   ██ ██      ██   ██    ██    
██████  ██   ██ ██   ██  ██████ ██   ██    ██    
                                                 
                                                 

'

clear
echo -e "\n$ansi_art\n"

sudo pacman -Sy --noconfirm --needed git

echo -e "\nCloning Barchy..."
rm -rf ~/.local/share/omarchy/
git clone https://github.com/logno-dev/barchy.git ~/.local/share/barchy >/dev/null

# Use custom branch if instructed
if [[ -n "$OMARCHY_REF" ]]; then
  echo -e "\eUsing branch: $OMARCHY_REF"
  cd ~/.local/share/barchy
  git fetch origin "${OMARCHY_REF}" && git checkout "${OMARCHY_REF}"
  cd -
fi

echo -e "\nInstallation starting..."
source ~/.local/share/barchy/install.sh
