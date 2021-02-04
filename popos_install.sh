#!/bin/bash

# Update, upgrade and autoremove
apt update
apt full-upgrade -y

# GRUB settings UEFI
# apt -y install grub-efi grub2-common grub-customizer
# grub-install
# cp /boot/grub/x86_64-efi/grub.efi /boot/efi/EFI/pop/grubx64.efi

# GRUB setting Legacy Mode
# apt -y install os-prober grub-customizer
# os-prober
# grub-update

apt -y install ubuntu-restricted-extras

# Install programs
cat packages.txt | xargs apt -y install

# Install Dash to Dock
wget -O dash-to-dock.zip https://extensions.gnome.org/review/download/12397.shell-extension.zip
unzip dash-to-dock.zip -d ~/.local/share/gnome-shell/extensions/dash-to-dock@micxgx.gmail.com/
rm dash-to-dock.zip

CUSTOM_SHORCUT_LIST=$(dconf read /org/gnome/shell/enabled-extensions)
NEW_SHORTCUT_LIST="${CUSTOM_SHORTCUTS_LIST%]*}, 'dash-to-dock@micxgx.gmail.com']"

dconf write /org/gnome/shell/favorite-apps "['firefox.desktop', 'org.gnome.Nautilus.desktop', 'com.alacritty.Alacritty.desktop', 'code.desktop', 'slack.desktop', 'discord.desktop', 'Zoom.desktop', 'insomnia.desktop', 'mongodb-compass.desktop', 'gnome-control-center.desktop', 'io.elementary.appcenter.desktop']"

# Install minimize and maximize buttons on windows
apt -y install gnome-tweaks
dconf write /org/gnome/desktop/wm/preferences/button-layout "'appmenu:minimize,maximize,close'"

# Super + E to Dolphin
dconf write /org/gnome/settings-daemon/plugins/media-keys/home "['<Super>e']"

# Super + L to Lock Screen
dconf write /org/gnome/settings-daemon/plugins/media-keys/screensaver "['<Super>l']"

# Alt + F4 to Close Window
dconf write /org/gnome/desktop/wm/keybindings/close "['<Alt>F4']"

# Ctrl + Alt + Del for Power Off Menu
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/binding "'<Primary><Alt>Delete'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/command "'gnome-session-quit --power-off'"
dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/name "'Power off / Restart'"

# Install Oreo Grey Cursor

# Install Papirus Icon Theme


# Install zsh and powerlevel10k
apt -y install zsh zsh-syntax-highlighting zsh-autosuggestions
touch "$HOME/.cache/zshhistory"
#-- Setup Alias in $HOME/zsh/aliasrc
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc



