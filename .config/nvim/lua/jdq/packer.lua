-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'github/copilot.vim'
  use 'theprimeagen/harpoon'
  use 'mbbill/undotree'
  use 'tpope/vim-fugitive'
  use 'rcarriga/nvim-notify'

  -- auto close brackets and tags
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag' 

  use {
    'yamatsum/nvim-nonicons',
    requires = {'kyazdani42/nvim-web-devicons'}
  }

  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use({ 
    'rose-pine/neovim', as = 'rose-pine', config = function()
    vim.cmd('colorscheme rose-pine')
  end 
  })

  use({ 'ellisonleao/gruvbox.nvim', as = 'gruvbox', config = function()
    vim.cmd('colorscheme gruvbox')
  end 
  })

  use({ 'rebelot/kanagawa.nvim', as = "kanagawa", config = function()
    vim.cmd('colorscheme kanagawa')
  end 
  })

  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  use("nvim-treesitter/nvim-treesitter-context");
  use({ 
    'rust-lang/rust.vim', config = function()
      vim.cmd('let g:rustfmt_autosave = 1')
  end 
  })

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

 use { "j-hui/fidget.nvim", branch = "legacy" }
  

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
       
       -- prettier format
		  {'jose-elias-alvarez/null-ls.nvim'},
		  {'MunifTanjim/prettier.nvim'},
	  }
  }
end)
