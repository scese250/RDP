#! /bin/bash
printf "Installing RDP Be Patience... " >&2
{
sudo useradd -m RDP
sudo adduser RDP sudo
echo 'RDP:1234' | sudo chpasswd
sed -i 's/\/bin\/sh/\/bin\/bash/g' /etc/passwd
sudo apt-get update
sudo apt-get install vim-gnome
sudo apt-get install vlc
sudo apt-get install nload
sudo apt install qbittorrent
sudo apt-get install xarchiver
wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
sudo dpkg --install chrome-remote-desktop_current_amd64.deb
sudo apt install --assume-yes --fix-broken
sudo DEBIAN_FRONTEND=noninteractive \
apt install --assume-yes xfce4 desktop-base xfce4-terminal
sudo bash -c 'echo "exec /etc/X11/Xsession /usr/bin/xfce4-session" > /etc/chrome-remote-desktop-session'  
sudo apt remove --assume-yes gnome-terminal
sudo systemctl disable lightdm.service
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg --install google-chrome-stable_current_amd64.deb
sudo apt install --assume-yes --fix-broken
sudo apt install nautilus nano -y 
sudo adduser RDP chrome-remote-desktop
} &> /dev/null &&
printf "\nSetup Complete " >&2 ||
printf "\nError Occured " >&2
printf '\nCheck https://remotedesktop.google.com/headless  Copy Command Of Debian Linux And Paste Down\n'
read -p "Paste Here: " CRP
su - RDP -c """$CRP"""
printf 'Check https://remotedesktop.google.com/u/1/access/ \n\n'
if sudo apt-get upgrade &> /dev/null
then
    printf "\n\nUpgrade Completed " >&2
else
    printf "\n\nError Occured " >&2
fi
