local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('packer').setup({
	'wbthomason/packer.nvim',

	-- fuzzy find files
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		-- branch = '0.1.x',
		dependencies = { {'nvim-lua/plenary.nvim'} }
	},

    -- file structure
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = {
        'nvim-tree/nvim-web-devicons', -- optional
        },
        config = function()
            require("nvim-tree").setup {
                view = {
                    width = 30,
                },
                actions = {
                    open_file = {
                        quit_on_open = true,
                    },
                },
            }
        end,
    },

	-- color scheme
	{
		'rose-pine/neovim',
		name = 'rose-pine',
		config = function()
			vim.cmd('colorscheme rose-pine')
		end
	},

	{'nvim-treesitter/nvim-treesitter', { build = ':TSUpdate' }},
	'nvim-treesitter/playground',
	'theprimeagen/harpoon',
	'mbbill/undotree',
	'tpope/vim-fugitive',
  'numToStr/Comment.nvim',

    -- formatter
    {
        'mhartington/formatter.nvim',
        opts = {function()
            return require "custom.configs.formatter"
        end}
    },

    -- lsp diagnostics
    {
        'folke/trouble.nvim',
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        opts = {},
    },

    -- tabs
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
    'romgrk/barbar.nvim',

    -- language server
	{
  		'VonHeikemen/lsp-zero.nvim',
  		branch = 'v2.x',
  		dependencies = {
    		-- LSP Support
    			{'neovim/nvim-lspconfig'},             -- Required
    			{                                      -- Optional
      				'williamboman/mason.nvim',
      				build = function()
        			  pcall(vim.api.nvim_command, 'MasonUpdate')
      				end,
    			},
    		{'williamboman/mason-lspconfig.nvim'}, -- Optional

    		-- Autocompletion
    		{'hrsh7th/nvim-cmp'},     -- Required
    		{'hrsh7th/cmp-nvim-lsp'}, -- Required
    		{'L3MON4D3/LuaSnip'},     -- Required
        { "rafamadriz/friendly-snippets" },
        {'saadparwaiz1/cmp_luasnip'},
  	},

    'christoomey/vim-tmux-navigator',
    { "catppuccin/nvim", name = "catppuccin" }},


})
