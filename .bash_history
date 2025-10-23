sudo usermod -aG video alpha
sudo apt install zsh && chsh -s /bin/zsh
cd /etc/X11/xorg.conf.d/
sudo vi 30-touchpad.conf
sudo apt purge send-anywhere
apt list --installed | grep send
sudo apt purge sendanywhere -y
clear
' cd
cd
ls
cd Downloads/
ls
mv 30-touchpad.conf /etc/X11/xorg.conf.d/
sudo mv 30-touchpad.conf /etc/X11/xorg.conf.d/
lsblk
sudo mount /dev/sda1
sudo mount /dev/sda1 /mnt
cd /mnt
ls
sl
ls -a
cd ..
ls
cd 
cd Downloads
ls
cd backup
ls
cd home
ls
cd alpha
ls
ls -lah
cd .config
ls
cd i3
ls
cd ..
mv i3 rofi polybar  ~/.config/
ls
cd
sudo apt install nala -y && sudo apt install i3 rofi polybar -y
polybar
systemctl restart gdm3
clear
cd Downloads/
ls
cd backup
sl
ls
cd home
ls
cd alphs
cd alpha
ls
ls -a
vi ~/.config/polybar/config.ini 
sudo nala search firacode
cd
vi .Xresources 
clear
clg
clear
clg
clear
vi .bashrc
clg
exit
clg
clear
vi .bashrc
exit
clg
vi .bashrc
exit
clg
vi .bashrc
exit
clg
clear
cd code
ls
clear
ls
java q1.java
sudo nala install xclip -y
cat q1.java |xclip
xci
xclip < q1.java
nvim q1.java
sudo nala install gnome-screenshot -y
cat q2.java
vi q2.java
clear
java q2.java
vi q3.java 
java q3.java
clg
vi .bashrc
bash
ls
clear
vi .bashrc
cd
vi .bash
vi .bashrc 
clg
clear
exit
clg
clear
mkdir satya
cd satya
ls
touch MainApp.java
touch Calculator.java
vi MainApp.java 
vi Calculator.java 
vi *.java
javac *.java
ls
java MainApp.class
java Calculator.java
javac *.java
.cd
ls
cd ..
cd satya/
ls
mkdir mypackage
mv Calculator.java mypackage/
javac *.java
java MainApp
clear
java MainApp
ls
rm * -r
ls
lsblk
sudo mount /dev/sda1
sudo mount /dev/sda1 /mnt
cd /mnt
ls
cp sept.tar ~
ls
cd
ls
mv sept.tar Music/
ls
cd Music/
ls
tar -xzvf sept.tar
tar -xvf sept.tar
ls
rm sept.tar
rm .* -r
ls
cd Music/
ls
mv .* ~/
cd
ls
cd Music/
ls
cd .config
cd
ls
rm -r .config
cd Music
ls
mv .config ~/
ls
ls -a
rm
rm -r .* -r
ls
sudo apt install i3 polybar rofi -y
systemctl restart gdm3
sudo cryptsetup luksDump /dev/sdb3 
sudo cryptsetup luksAddKey /dev/sdb3
sudo cryptsetup luksDump /dev/sdb3 
sudo luksKillSlot /dev/sdb3 0
sudo cryptsetup luksKillSlot /dev/sdb3 0
clevis
sudo cryptsetup luksDump /dev/sdb3 
sudo systemd-cryptenroll --tpm2-device=auto /dev/sdb3
reboot
systemctl reboot
sudo cryptsetup luksDump /dev/sdb3
reboot
poweroff
reboot
ls /dev/tpm*
lsmod | grep tpm
sudo modprobe tpm_tis
sudo apt install tpm2-tools -y
reboot
systemctl reboot
sudo vi /etc/crypttab 
sudo update-initramfs -u -k $(uname -r)
systemctl reboot
lsblk
sudo lsblk
sudo systemd-cryptenroll --wipe-slot=tpm2 /dev/sdb3
sudo cryptsetup luksDump /dev/sdb3
systemd-cryptenroll --tpm2-device=auto --tpm2-pcrs=0+1+2+3+4+5+7+8 /dev/sdb3
sudo systemd-cryptenroll --tpm2-device=auto --tpm2-pcrs=0+1+2+3+4+5+7+8 /dev/sdb3
sudo /etc/dracut.conf.d/cmdline.conf
sudo vi  /etc/dracut.conf.d/cmdline.conf
reboot
systemctl reboot
sudo vi /etc/crypttab 
reboot
systemctl reboot
sudo apt install dracut -y
cd /etc/dracut.conf.d/
ls
sudo touch tpm2.conf
ls
sudo vi tpm2.conf 
dracut -f
sudo dracut -f
poweroff
systemctl reboot
systemctl poweroff
sudo vi /etc/crypttab
cd /etc/dracut.conf.d/
ls
rm tpm2.conf
sudo rm tpm2.conf
ls
exit
sudo systemd-cryptenroll --wipe-slot=tpm2 /dev/sdb3
sudo cryptsetup luksKeyDump /dev/sdb3
sudo cryptsetup luksDump /dev/sdb3
cd
mkdir script
cd script
ls
vi script.sh
chmod +x script.sh 
sudo ./script.sh 
sudo systemd-cryptenroll --wipe-slot=tpm2 /dev/sdb3
sudo systemd-cryptenroll --wipe-slot=tpm2 /dev/sdb3 0
sudo systemd-cryptenroll --wipe-slot=tpm2 /dev/sdb3 
vi script.sh
sudo ./script.sh
vi script.sh
sudo ./script.sh
vi script.sh
sudo ./script.sh
reboot
systemctl reboot
systemd-cryptenroll --wipe-slot=tpm2 /dev/sdb3
sudo systemd-cryptenroll --wipe-slot=tpm2 /dev/sdb3
#!/bin/bash
set -euo pipefail
DEVICE="/dev/sdb3"
# Check TPM2 presence
echo "Checking TPM2 presence..."
if ! command -v tpm2_getcap &> /dev/null; then   echo "Error: tpm2-tools not installed. Please install it first.";   exit 1; fi
if ! tpm2_getcap -c properties-fixed &> /dev/null; then   echo "Error: TPM2 not found or not initialized.";   exit 1; fi
cd script/
ls
echo "">script.sh 
vi script.sh 
./script.sh
sudo ./script.sh
sudo apt install clevis tpm2
sudo apt install clevis tpm2-tools
sudo apt autoremove
tpm2_getcap -c properties-fixed
tpm2_getcap -c 
tpm2
tpm2_pcrread
sudo tpm2_pcrread
lsblk
sudo clevis luks bind -d /dev/sdb3 tpm2 '{}'
sudo update-initramfs -u
reboot
systemctl reboot
rm .* -r
./VentoyWeb.sh 
sudo ./VentoyWeb.sh 
wget -c https://gemmei.ftp.acc.umu.se/debian-cd/current-live/amd64/iso-hybrid/debian-live-13.1.0-amd64-gnome.iso
ls
cp *.iso ~/Downloads
cd Downloads
cd
cd Downloads/
ls
wget -c https://gemmei.ftp.acc.umu.se/debian-cd/current-live/amd64/iso-hybrid/debian-live-13.1.0-amd64-gnome.iso
sudo systemd-cryptenroll --wipe-slot=tpm2 /dev/sdb3
lsblk
sudo cryptsetup luksDump /dev/sdb3
zsh
sudo apt install nala -y && sudo apt install zsh -y
sudo apt install nala -y && sudo nala install zsh -y
zsh
sudo clevis luks unbind -d /dev/sdb3 -s 0
reboot
systemctl reboot
sudo clevis luks bind -d /dev/sdX tpm2 '{"pcr_bank":"sha256","pcr_ids":"1,7"}'
sudo clevis luks bind -d /dev/sdb3 tpm2 '{"pcr_bank":"sha256","pcr_ids":"1,7"}'
lsblk
sudo clevis luks unbind -d /dev/sda3 -s 0
sudo cyrptsetup luksDump /dev/sda3
sudo cryptsetup luksDump /dev/sda3
sudo cryptsetup luksKillSlot /dev/sda3 0
sudo clevis luks bind -d /dev/sda3 tpm2 '{"pcr_bank":"sha256","pcr_ids":"1,7"}'
sudo clevis luks bind -d /dev/sda3 tpm2 '{"pcr_ids":"1,7"}'
sudo cryptsetup luksDump /dev/sda3
sudo update-intraimfs
sudo update-intiramfs -u -k all
sudo update-initramfs -u -k all
systemctl reboot
sudo cryptsetup luksKillSlot /dev/sda3 0
lsblk
sudo cryptsetup luksKillSlot /dev/sdb3 0
sudo clevis luks bind -d /dev/sdb3 tpm2 '{"pcr_ids":"1,7"}'
systemctl reboot
sudo update-initramfs -u -k all 
systemctl poweroff
sudo cryptsetup luksKillSlot /dev/sdb3 0
sudo cryptsetup luksKillSlot /dev/sda3 0
sudo clevis luks bind -d /dev/sdb3 tpm2 '{"pcr_ids":"1,2,3,4,5,6,7,8,9"}'
sudo clevis luks bind -d /dev/sda3 tpm2 '{"pcr_ids":"1,2,3,4,5,6,7,8,9"}'
sudo cyrptsetup luksKillSlot /dev/sda3 0
sudo cryptsetup luksKillSlot /dev/sda3 0
lsblk
sudo clevis luks bind -d /dev/sda3 tpm2 '{"pcr_ids":"1,2,3,4,5,6,7,8,9"}'
sudo clevis luks bind -d /dev/sda3 tpm2 '{"pcr_ids":"1,2,3,4,5,6,7"}'
poweroff
systemctl poweroff
sudo cryptsetup luksKillSlot /dev/sda3 0
sudo clevis luks bind -d /dev/sda3 tpm2 '{"pcr_ids":"1,2,3,4,5,6,7"}'
sudo update-initramfs -u -k all 
systemctl poweroff
mkdir project
cd project
git clone https://github.com/balena-io/etcher.git
cd etcher
sudo apt install git -y
git clone https://github.com/balena-io/etcher.git
cd etcher/
ls
npm install
sudo apt install npm -y
npm install
ls
cd lib
ls
cd gui
ls
cd app
ls
cd pages
ls
cd main
ls
vi Flash.tsx 
ls
vi MainPage.tsx 
cd
cd project/
cd etcher
ls
grep -R "startFlash" lib/gui/app | head -n 20
grep -R "selectImage" lib/gui/app | head -n 20
grep -n "function " lib/gui/app/models/selection-state.ts
vi lib/gui/app/modules/custom-autoflash.ts
vi lib/gui/app/components/source-selector/source-selector.tsx
clear
cd
rm -r project -r
mkdir usb-flasher
cd usb-flasher
npm init -y
npm install electron etcher-sdk drivelist axios
npm install --save-dev electron-builder
touch main.js index.html renderer.js package.json
vi main.js
vi index.html
vi renderer.js
ls
vi package.json
npm install
npm start
vi package.json
ls
npm install
vi package.json
npm install
vi package.json
npm install
sudo rm -r * -y
sudo rm -r * 
npm install -g balena-cli
sudo npm install -g balena-cli
npm install electron axios drivelist
npm install --save-dev electron-builder
vi main.js
vi index.html
vi renderer.js
vi package.json
npm install
npm start
vi main.js
vi index.html
vi renderer.js
vi package.json
npm install && npm start
sudo  npm start
vi main.js
vi index.html
vi renderer.js 
npm install && npm start 
vi renderer.js 
npm install && npm start 
[200~https://chuangtzu.ftp.acc.umu.se/debian-cd/current/amd64/iso-cd/debian-13.1.0-amd64-netinst.iso~
https://chuangtzu.ftp.acc.umu.se/debian-cd/current/amd64/iso-cd/debian-13.1.0-amd64-netinst.iso
rm  -r
rm -r * 
vi flash_iso_curl.py
chmod +x flash_iso_curl.py 
cd  ~/.locall/share/applications/
cd 
cd .local
cd .share
cd share
ls
cd applications
vi Usb-flasher.desktop
sudo apt install neovim -y
vi Usb-flasher.desktop
cd
cd usb-flasher/
ls
cd -
cd 
cd .local/share/applications
ls
vi Usb-flasher.desktop 
sudo apt install python3 -y
python3
cd
ls
cd usb-flasher/
ls
python3 flash_iso_curl.py 
python3-pip install tkinter -y
sudo apt search pip
sudo apt install python3-pip
python3-pip install tkinter -y
pip
pip install tkinter 
sudo apt install python3-tkinter -y
python3 flash_iso_curl.py 
sudo apt install python3-tk -y
python3 flash_iso_curl.py 
sudo apt install curl -y
vi flash_iso_curl.py 
sudo python3 flash_iso_curl.py 
sudo apt install nethogs 
sudo nethogs
cd usb-flasher/
ls
python3 flash_iso_curl.py 
cd
ls
vi .local/share
cd .local/share
ls
cd applications/
ls
vi Usb-flasher.desktop 
sudo nethogs
cd 
cd usb-flasher/
ls
python3 flash_iso_curl.py 
sudo python3 flash_iso_curl.py 
python3 flash_iso_curl.py 
sudom rm -r *
sudo rm -r *
systemctl reboot
sudo systemctl reboot
exit
vi run-helper.sh
cd
cd .local/share
ls
cd applications/
ls
vi Usb-flasher.desktop 
ls
chmod -x Usb-flasher.desktop 
exit
cd .local
ls
cd share
ls
cd applications/
ls
vi Usb-flasher.desktop 
ls
chmod +x Usb-flasher.desktop 
cd
cd usb-flasher/
ls
chmod +x run-helper.sh 
sudo poweroff
systemctl poweroff
sudo systemctl poweroff
sudo apt install nala  -y
sudo nala install fzf rofi i3 nethogs htop zsh  -y
chsh -s /bin/zsh
exit
systemctl poweroff
clear
ls
clear
cat .bashrc
clg
clear
sudo nala install ferdium -y
clear
clg
clear
ls
clear
ls
gcc p1.c && ./a.out
gcc p2.c && ./a.out
gcc p3.c && ./a.out
gcc p4.c && ./a.out
gcc p5.c && ./a.out
clear
gcc p1.c && ./a.out
gcc p2.c && ./a.out
gcc p3.c && ./a.out
gcc p4.c && ./a.out
ps -elf | grep z
clear
gcc p1.c && ./a.out
gcc p2.c && ./a.out
gcc p3.c && ./a.out
gcc p4.c && ./a.out
ps -elf | grep z
gcc p5.c && ./a.out
ps -l
