#!/usr/bin/env bash
echo "Setting up your Mac..."

export $(grep -v '^#' .env | xargs)
UNAME="$(uname -s)"

# Install Xcode
xcode-select --install

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

# Create symlinks for config
source "$PWD/setup-dotfiles-link.sh"

# Symlink the Mackup config file to the home directory
# ln -s $HOME/.dotfiles/config/.mackup.cfg $HOME/.mackup.cfg

# Iterate through setup scripts under apps
# and execute each in turn
for f in $PWD/apps/*; do
  source "$PWD/apps/$f"
done

# OPTIONAL:  tell Mackup to restore your previously backed up settings
# mackup restore -fv

# Configure MacOS defaults.
# You only want to run this once during setup. Additional runs may reset changes you make manually.
source ./macos

