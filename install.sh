#!/bin/bash
DOTFILES_DIR=$(readlink -f $(dirname -- "${BASH_SOURCE[0]}"))
DEST_DIR=$HOME
WSL_INSTALL=0
SKIP_CONF=0

source $DOTFILES_DIR/scripts/install/install_dotfiles.sh

usage() {
  echo "Usage: bash install.sh [-d <dest_dir>] [-y] [-w] [-h]"
}

prompt_user() {
  echo "Dots dir is $DOTFILES_DIR"
  read -p "This script will install configurations into $DEST_DIR - continue? (y/[n]): " yn
  case $yn in
    y)
      echo "Continuing..."
      ;;
    *)
      echo "Exiting."
      usage
      exit 1
      ;;
  esac
}

while getopts "d:wyh" arg; do
  case $arg in
    d)
      DEST_DIR="$OPTARG"
      ;;
    w)
      WSL_INSTALL=1
      ;;
    y)
      SKIP_CONF=1
      ;;
    h)
      usage
      exit 0
      ;;
  esac
done
shift $(($OPTIND - 1))

if [ $SKIP_CONF -eq 0 ]; then
  prompt_user
fi

# Init submodules
pushd $DOTFILES_DIR
git submodule update --init

# Call installation functions
create_dots_dirs
create_dots_symlinks
create_dots_files

# Clean up
popd
