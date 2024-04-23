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
            -- config https://github.com/MarioCarrion/videos/blob/269956e913b76e6bb4ed790e4b5d25255cb1db4f/2023/01/nvim/lua/plugins/nvim-tree.lua
            require("nvim-tree").setup {
                disable_netrw = true,
                hijack_netrw = true,
                respect_buf_cwd = true,
                sync_root_with_cwd = true,
                view = {
                    width = function()
                        return math.floor(vim.opt.columns:get() * 0.5)
                    end,
                    float = {
                        enable = true,
                        open_win_config = function()
                            local screen_w = vim.opt.columns:get()
                            local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
                            local window_w = screen_w * 0.5
                            local window_h = screen_h * 0.8
                            local window_w_int = math.floor(window_w)
                            local window_h_int = math.floor(window_h)
                            local center_x = (screen_w - window_w) / 2
                            local center_y = ((vim.opt.lines:get() - window_h) / 2)
                                             - vim.opt.cmdheight:get()
                            return {
                              border = "rounded",
                              relative = "editor",
                              row = center_y,
                              col = center_x,
                              width = window_w_int,
                              height = window_h_int,
                            }
                        end,
                    },
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
    --{
	--"rcarriga/nvim-dap-ui",
    --    dependencies = {
    --        "mfussenegger/nvim-dap"
    --    },
    --    config = function()
    --        require('dapui').setup()
    --    end,
    --},

    "theHamsta/nvim-dap-virtual-text",

    -- snippets
    {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp",
        dependencies = { "rafamadriz/friendly-snippets" },
    },
    { 'saadparwaiz1/cmp_luasnip' },
    -- comments
    {
        "kkoomen/vim-doge",
    },
    --
    'christoomey/vim-tmux-navigator',

    -- theme
    { "catppuccin/nvim", name = "catppuccin" },


})
