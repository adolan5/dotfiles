# Andy Dolan's Dotfiles

*A collection of configurations*

## Vim

Contains my Vim configuration files.

### Optional Dependencies

* [Pathogen](https://github.com/tpope/vim-pathogen)
  * Plugin manager that simplifies laoding plugins below
* [kien's ctrlp](https://github.com/ctrlpvim/ctrlp.vim)
  * Fuzzy file searching
* [ack](https://github.com/mileszs/ack.vim)
  * Search for terms with `ack` or `ag`
  * I use `K` to search for the current term under the cursor

### Vimrc (`vim/linux/.vimrc`)

* Contains my core configuration, including mappings, colors, highlight groups,
  a few custom file formats
* Can be used on both Unix and Windows

### GVim (`vim/windows/_gvimrc`)

* Additional configuration settings to be read by GVim on a Windows host
* Simply sets colorscheme, removes menu/tool/scroll bars, and visual bell
* Not meant to contain entire Windows vim configuration; `.vimrc` should also be
  copied/included as `$HOME/_vimrc`

### `ftplugin`

* Directory that contains definitions for specific ftplugin settings, per file
  type/extension
* Currently, these include similar definitions for Markdown and TeX files

## `zsh`

* Contains general zsh configuration files, including:
  * `.zshrc`: Defaults to be used on a fresh installation of zsh
  * `.zsh_aliases`: Sourced by `.zshrc`, contains basic aliases
* There are also more platform specific files:
  * `cygwin`: Contains a few functions and aliases used on a Cygwin terminal
  * `wsl`: Contains functions/aliases to be used on a WSL terminal

## Scripts

* Basic scripts that I've wanted to hang on to
* Currently includes:
  * `chromswitch.sh`: For use in a Linux DE where you want a keybind to either
    launch a new instance of chrome or focus on an existing one, Windows style
    (this is hacky, but it functions)
  * `shared.sh`: A script I put together for easily mounting a VirtualBox (and
    guest additions) shared directory. This script should be installed/ used on
    the guest OS.

## Misc

### Git

My `.gitconfig` is available here as well, for core settings and aliases.

### Tmux Configuration

My `.tmux.conf` is here as well; it defines a few basic fixes for colors and
keybinds that are somewhat vim-like.

## Legacy

The topics under this header are not often updated or have fallen out of use.

### Bash

There are a number of Bash/terminal resources available here that I find very
convenient, namely:

* Some of my favorite aliases (bash\_aliases)
* Some resources (bash\_resources):
  * Fixes for the Windows 10 Ubuntu shell, such as an explicit screen directory
    and quality-of-life color changes
  * `hag`, a quick function to grep your history
* Some extra mapping settings that typically go into `.inputrc`
