#!/bin/sh
sudo usermod -aG video $USERNAME
echo -e "${BLUE}Configuring Zsh...${NC}"
sudo apt install zsh -y

# Change default shell for the current user
sudo chsh -s $(which zsh) $USER
sudo apt install gdm3 --no-install-recommends
