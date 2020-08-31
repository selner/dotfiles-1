#!/bin/sh

echo "Configuring Github and cloning repositories..."

#---------------------------
#  LOAD ENV VARIABLES
#---------------------------

export $(grep -v '^#' .env | xargs)


#---------------------------
#  CONFIGURE GITHUB SSH
#---------------------------
#
#if [ -z ${GITHUB_USER+x} ] || [ -z ${GITHUB_KEYFILE+x} ]; then
#  echo "ERROR!   GITHUB_KEYFILE AND GITHUB_USER environment variables are not set.  Aborting!"
#  exit 1
#else
#  echo "... adding github ssh values to .ssh/config"
#  echo "" >>"$HOME/.ssh/config"
#  echo "" >>"$HOME/.ssh/config"
#  echo "##############################################################" >>"$HOME/.ssh/config"
#  echo "#       ADDED BY DOTFILES SETUP - $(date +'%Y%m%d_%H%M_%S')           #" >>"$HOME/.ssh/config"
#  echo "##############################################################" >>"$HOME/.ssh/config"
#  echo "Host $GITHUB_USER" >>"$HOME/.ssh/config"
#  echo "HostName GitHub" >>"$HOME/.ssh/config"
#  echo "PreferredAuthentications publickey" >>"$HOME/.ssh/config"
#  echo "IdentityFile $GITHUB_KEYFILE" >>"$HOME/.ssh/config"
#  echo "##############################################################" >>"$HOME/.ssh/config"
#fi
#
echo "... testing github connection"
ssh -T git@github.com


#---------------------------
#  CLONE REPOSITORIES
#---------------------------

echo "... creating code directory..."
CODE=$HOME/Dropbox/code
mkdir -pv "$CODE"
cd "$CODE" || exit

# SITES=$HOME/Sites
# BLADE=$SITES/blade-ui-kit
# LARAVEL=$SITES/laravel

# # Personal
git clone git@github.com:selner/pyhelperutils.git "$CODE/pyhelperutils"
git clone git@github.com:selner/pyBryUtils.git "$CODE/pyBryUtils"
git clone git@github.com:selner/pyFitnessTracker.git "$CODE/pyFitnessTracker"
git clone git@github.com:selner/seattle_construction.git "$CODE/seattle_construction"
git clone git@github.com:selner/hail_caesar.git "$CODE/hail_caesar"

