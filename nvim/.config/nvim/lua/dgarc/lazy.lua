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

require('lazy').setup({

    -- text folding
    { 'kevinhwang91/nvim-ufo', dependencies = { 'kevinhwang91/promise-async'}},

	-- fuzzy find files
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		-- branch = '0.1.x',
		dependencies = { {'nvim-lua/plenary.nvim'} }
	},

    -- file structure
    'nvim-tree/nvim-web-devicons',
    {
        'nvim-tree/nvim-tree.lua',
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

	{'nvim-treesitter/nvim-treesitter'},
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
      'williamboman/mason.nvim',
      build = {function()
          pcall(vim.api.nvim_command, 'MasonUpdate')
      end},
    },

    'neovim/nvim-lspconfig',
    'williamboman/mason-lspconfig.nvim',

    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    -- dap

    "mfussenegger/nvim-dap",

    "theHamsta/nvim-dap-virtual-text",

    --
    'christoomey/vim-tmux-navigator',

    -- theme
    { "catppuccin/nvim", name = "catppuccin" },


})
