#!/bin/bash

# Install Nano Editor (with syntax highlighting) on MacOS without using Homebrew
# You can get the latest version number from https://www.nano-editor.org

# Instructions:
# - First off, download this Bash script from the browser & make it executable:
#   $ chmod +x install_nano_on_macos_without_homebrew.sh
# - If you have "wget" installed (you most likely do), just run the script with:
#   $ ./install_nano_on_macos_without_homebrew.sh
#   ...and you're ready.
# - If you don't have "wget" installed, download the latest release of the Nano Editor in *.tar.gz
#   from https://www.nano-editor.org and make sure the version referenced in the *.tar.gz file is also
#   referenced in the VERSION specified after these comments & then run the script with:
#   $ ./install_nano_on_macos_without_homebrew.sh
#   ...which will use the file your downloaded for the Nano Editor to install it directly.

VERSION="7.2" # As of Jan 2024 - set the version number here

cd ~/Downloads

if [ ! -f "nano-${VERSION}.tar.gz" ]; then
    wget -O nano.tar.gz https://www.nano-editor.org/dist/latest/nano-${VERSION}.tar.gz
fi

tar -xvf nano.tar.gz
mv nano ~/.nano
cd ~/.nano
./configure
make
sudo make install

touch ~/.nanorc
cat > "~/.nanorc" <<EOF
## Some defaults
set autoindent
set historylog
set indicator
set linenumbers
set locking
set mouse
set softwrap
set stateflags
set tabsize 4
set tabstospaces
## Enable syntax highlighting in Nano
include ~/.nano/syntax/*.nanorc
EOF

exit
