# Dotfiles Repo

# Dependencies
* stow - will make your life a lot easier when it comes to creating the symlinks between this repo and your home directory dotfiles. It will automatically create a symlink for all the files contained in your target folder.
* git > 2.37.0 -- If you want auto setup remote branches to work, you'll need at least this git version

## nvim
* packer
* ripgrep
* lua

# General Usage
To pull the .dotfiles repo into your $HOME directory:
* git clone this directory into your $HOME directory
* stow <folder-name>

## Nvim
This nvim config uses Packer!

After you have stowed the nvim folder to your home directory, do the following:
* Open nvim `nvim .`
* `:PackerSync` to install plugins
* Good to go!
