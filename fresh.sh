#!/usr/bin/env sh

echo "Setting up your Mac..."

#---------------------------
#  LOAD ENV VARIABLES
#---------------------------

export $(grep -v '^#' .env | xargs)

if [ ! -d "$DOTFILES_DESTINATION" ]; then
  mkdir "$DOTFILES_DESTINATION"
fi

CURDIR=$(pwd)
echo "Installing dotfiles to $DOTFILES_DESTINATION..."
if [[ $CURDIR = "$DOTFILES_DESTINATION" ]]; then ...
  cp -Rv $CURDIR $DOTFILES_DESTINATION
fi

cd "$DOTFILES_DESTINATION"

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

# Override Gatekeeper block for apps we just installed
spctl --add /Applications/VLC.app
spctl --add /Applications/Sourcetree.app

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -s "$DOTFILES_DESTINATION/.zshrc" $HOME/.zshrc

# Symlink the Mackup config file to the home directory
ln -s "$DOTFILES_DESTINATION/.mackup.cfg" $HOME/.mackup.cfg

mackup restore -v

# Clone Github repositories
./github.sh

# Set macOS preferences
# We will run this last because this will reload the shell
source .macos
