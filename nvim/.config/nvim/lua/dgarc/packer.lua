vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	-- fuzzy find files
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		-- branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

    -- file structure
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
        'nvim-tree/nvim-web-devicons', -- optional
        },
        config = function()
            require("nvim-tree").setup {
                view = {
                    width = 30,
                },
            }
        end,
    }

	-- color scheme
	use({
		'rose-pine/neovim',
		as = 'rose-pine',
		config = function()
			vim.cmd('colorscheme rose-pine')
		end
	})

	use({'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' }})
	use('nvim-treesitter/playground')
	use('theprimeagen/harpoon')
	use('mbbill/undotree')
	use('tpope/vim-fugitive')
    use('numToStr/Comment.nvim')

    -- formatter
    use {
        'mhartington/formatter.nvim',
        opts = {function()
            return require "custom.configs.formatter"
        end}
    }

    -- lsp diagnostics
    use {
        'folke/trouble.nvim',
        requires = {
            "nvim-tree/nvim-web-devicons",
        },
        opts = {},
    }
    -- language server
	use {
  		'VonHeikemen/lsp-zero.nvim',
  		branch = 'v2.x',
  		requires = {
    		-- LSP Support
    			{'neovim/nvim-lspconfig'},             -- Required
    			{                                      -- Optional
      				'williamboman/mason.nvim',
      				run = function()
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
  	};

    use ('christoomey/vim-tmux-navigator');
    use { "catppuccin/nvim", as = "catppuccin" }}


end)
