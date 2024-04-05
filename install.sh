#!/usr/bin/env bash

#-------------------------------------------------------------------------
# DEPENDENCIES
#-------------------------------------------------------------------------

echo
echo "INSTALLING DEPENDENCIES"
echo

cd ~
sudo pacman -Sy

PKGSAUR=(
  'base-devel'
  'curl'
  'git'
  'less'
  'ripgrep'
)

for PKGAUR in "${PKGSAUR[@]}"; do
  echo
  echo "INSTALLING: ${PKGAUR}"
  echo
  sudo pacman -S "$PKGAUR" --needed
done

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
source ~/.bashrc
nvm install --lts
source ~/.bashrc

#-------------------------------------------------------------------------
# SYSTEM UPDATE
#-------------------------------------------------------------------------

# echo
# echo "SYSTEM UPDATE"
# echo

# sudo pacman -Syu
# source ~/.bashrc

#-------------------------------------------------------------------------
# INSTALLING PACKAGES
#-------------------------------------------------------------------------

echo
echo "INSTALLING PACKAGES"
echo

PKGS=(
  
  # -- GPARTED & DEPENDENCIES --

  'gparted'
  'btrfs-progs'   # for btrfs partitions
  'dosfstools'    # for FAT16 and FAT32 partitions
  'exfatprogs'    # for exFAT partitions
  'f2fs-tools'    # Flash-Friendly File System
  'gpart'         # for recovering corrupt partiton tables
  'jfsutils'      # for jfs partitions
  'mtools'        # utilities to access MS-DOS disks
  'nilfs-utils'   # for nilfs2 support
  'ntfs-3g'       # for ntfs partitions
  'reiserfsprogs' # for reiser partitions
  'udftools'      # for UDF file system support
  'xfsprogs'      # for xfs partitions

  # -- MISC --

  'alacritty'
  'bitwarden'
  'blender'
  'brightnessctl'
  'btop'
  'cmatrix'  
  'discord'
  'flameshot'
  'gimp'
  'git'
  'gtop'
  'htop'
  'kate'
  # 'linux419-virtualbox-host-modules'
  'man-db'
  'meson'
  'neofetch'
  'neovim'
  'networkmanager'
  'nitrogen'
  'obsidian'
  'okular'
  'polkit'
  'python-pip'
  'python-pipenv'
  'qbittorrent'
  'redshift'
  'rust'
  'tectonic'
  'telegram-desktop'
  'thunar'
  # 'virtualbox'
  'vlc'
  'wget'
  'zathura'

)

for PKG in "${PKGS[@]}"; do
  echo
  echo "INSTALLING: ${PKG}"
  echo
  sudo pacman -S "$PKG" --needed
done

source ~/.bashrc

#-------------------------------------------------------------------------
# AUR PACKAGES
#-------------------------------------------------------------------------

echo
echo 'INSTALLING AUR PACKAGES'
echo

git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ~
source ~/.bashrc

paru -S etcher-bin
#paru -S bitwig-studio
#paru -S deezer
paru -S vscodium-bin
paru -S waterfox-bin

#-------------------------------------------------------------------------
# ADDITIONAL
#-------------------------------------------------------------------------

# Eww
git clone https://github.com/elkowar/eww
cd eww
cargo build --release --no-default-features --features x11
cd target/release
chmod +x ./eww
cd ~

echo
echo "Done!"
echo
