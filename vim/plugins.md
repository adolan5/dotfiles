# Vim Plugins

This file contains plugins that I frequently use, as well as the basic commands
for their installation.

## The Plugins

* [ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim) - Fuzzy file finder.
* [ack.vim](https://github.com/mileszs/ack.vim) - Word search from Vim.

## Installation Commands

These commands assume Vim's native package management for loading; however,
[pathogen.vim](https://github.com/tpope/vim-pathogen) is compatible with these
locations (i.e., `~/.vim/pack`).

Instructions below are the same for the Windows installation, just under the
`vimfiles` directory instead of `.vim`.

```bash
# Directory setup
mkdir -p ~/.vim/autoload ~/.vim/pack/plugins/start

# For Vim < 8, get pathogen.vim
# curl -L -o ~/.vim/autoload/pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim

# Clone plugins
git clone https://github.com/ctrlpvim/ctrlp.vim ~/.vim/pack/plugins/start/ctrlp
git clone https://github.com/mileszs/ack.vim ~/.vim/pack/plugins/start/ack.vim
```
