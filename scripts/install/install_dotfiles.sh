#!/bin/bash
# Create directories
create_dots_dirs() {
  mkdir -p $DEST_DIR/.vim/pack $DEST_DIR/.zsh
}

# Create symlinks
create_dots_symlinks() {
  ## zsh
  ln -s -T $DOTFILES_DIR/zsh/plugins $DEST_DIR/.zsh/plugins
  ln -s -T $DOTFILES_DIR/zsh/zshrc $DEST_DIR/.zsh/zshrc
  ln -s -T $DOTFILES_DIR/zsh/zsh_aliases $DEST_DIR/.zsh/zsh_aliases

  ## vim
  ln -s -T $DOTFILES_DIR/vim/ftplugin $DEST_DIR/.vim/ftplugin
  ln -s -T $DOTFILES_DIR/vim/plugins $DEST_DIR/.vim/pack/plugins
  ln -s -T $DOTFILES_DIR/vim/colors $DEST_DIR/.vim/pack/colors
  ln -s -T $DOTFILES_DIR/vim/vimrc $DEST_DIR/.vimrc
  ln -s -T $DOTFILES_DIR/vim/gvimrc $DEST_DIR/.gvimrc

  ## Other configs
  ln -s -T $DOTFILES_DIR/configs/tmux.conf $DEST_DIR/.tmux.conf
  ln -s -T $DOTFILES_DIR/configs/gitconfig $DEST_DIR/.gitconfig

  ## Install WSL-related stuff, if desired
  if [ $WSL_INSTALL -eq 1 ]; then
    create_dots_symlinks_wsl
  fi
}

create_dots_symlinks_wsl() {
  ln -s -T $DOTFILES_DIR/zsh/wsl $DEST_DIR/.zsh/wsl
  ln -s -T $DOTFILES_DIR/zsh/zlogout $DEST_DIR/.zlogout
}

create_dots_files() {
  if [ ! -e $DEST_DIR/.zshrc ]; then
    echo "Creating .zshrc"
    touch $DEST_DIR/.zshrc
  else
    echo ".zshrc exists. Backing it up just in case"
    cp $DEST_DIR/.zshrc $DEST_DIR/.zshrc.bak
  fi

  echo "Prepending source line to .zshrc. Uncomment to source zshrc base."
  echo -e "#source $DEST_DIR/.zsh/zshrc\n\n#source $DEST_DIR/.zsh/wsl" | cat - $DEST_DIR/.zshrc | tee $DEST_DIR/.zshrc
}
