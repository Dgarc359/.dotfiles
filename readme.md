# Dotfiles Repo
Personal configurations for various different linux utilities and tools.
Each configuration is modular, meaning that you can choose to use the nvim config, but not the
i3 config, if you want. This is made possible with `stow` (make sure to install it!)


# General Usage
To pull the .dotfiles repo into your $HOME directory:
* git clone this directory into your $HOME directory
* stow <folder-name>


# General Dependencies
* stow - will make your life a lot easier when it comes to creating the symlinks between this repo and your home directory dotfiles. It will automatically create a symlink for all the files contained in your target folder.
* git > 2.37.0 -- If you want auto setup remote branches to work, you'll need at least this git version


# Nvim | ^v0.9.4
This nvim config uses Packer!

## dependencies
* packer
* ripgrep
* lua

After you have stowed the nvim folder to your home directory, do the following:
* Open nvim `nvim .`
* `:PackerSync` to install plugins
* Good to go!


# I3 | ^v4.22
A tiling window manager

> NOTE! The default ubuntu apt repository will not have the latest version of I3, It's recommended to have at least version 4.22, which merged in i3-gaps
