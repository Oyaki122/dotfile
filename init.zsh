#!/bin/zsh

DIR="$( cd "$( dirname "$0" )" && pwd )"

# Install the dependencies
git submodule update --init

# Create Symbolic links in Dotfiles
pushd .config/cnvim/lua
echo "In .config/cnvim/lua"
ln -s ../../cnvim_config custom
echo "ln -s ../../cnvim_config custom"
popd

# Install Dotfiles

pushd ~
echo "In ~"
rootfiles=(".fzf.zsh" ".latexmkrc" ".p10.zsh" ".zshrc")
for f in "${rootfiles[@]}"; do
  ln -s $DIR/$f .
  echo "ln -s $DIR/$f ."
done
popd


configFiles=("cnvim",
  "mozc"
  "nvim"
  "rclone"
  "richNvim"
  "snvim"
  "tilda"
  "touchegg"
  "xkeysnail"
  "libinput-gestures.conf")

pushd ~/.config/
echo "In ~/.config/"
for f in "${configFiles[@]}"; do
  ln -s $DIR/.config/$f .
  echo "ln -s $DIR/.config/$f ."
done
popd

echo "Please check ~/.config/autostart and create symbolic link manually."

# Setup cloud
if [ ! -d ~/cloud ]; then
  echo "Setup cloud"
  mkdir -p ~/cloud
  mkdir -p ~/cloud/googleK
  mkdir -p ~/cloud/googleKRA/
  mkdir -p ~/cloud/googleP
  mkdir -p ~/cloud/onedriveK
  mkdir -p ~/cloud/onedriveP
  pushd ~/cloud
  ln -s $DIR/cloud/startCloud.sh .
  popd
fi

# Setup scripts
pushd ~
echo "In ~"
ln -s $DIR/script .
echo "ln -s $DIR/script ."
popd

Install software
# Install libinput-gestures
pushd ~
sudo gpasswd -a $USER input
sudo apt-get install wmctrl xdotool
sudo apt-get install libinput-tools
git clone https://github.com/bulletmark/libinput-gestures.git
pushd libinput-gestures
sudo ./libinput-gestures-setup install
libinput-gestures-setup autostart start
popd

## Install xkeysnail
sudo apt install python3-pip
sudo pip3 install xkeysnail


