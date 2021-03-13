vim.cmd[[packadd packer.nvim]]

-- packer.nvim configuration and plugins
require('packer').startup(function()
  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}

  use 'tpope/vim-surround'

  use { 'nvim-treesitter/nvim-treesitter',
    requires = {
        'nvim-treesitter/nvim-treesitter-refactor',
        {
            'nvim-treesitter/completion-treesitter',
            run = function() vim.cmd [[TSUpdate]] end
        }
    },
    config = function() require('plugins.treesitter') end
    }

  use {
    'neovim/nvim-lspconfig',
    config = function() require('lsp') end
  }

  use {
    'hrsh7th/nvim-compe',
    config = function() require('plugins.completion') end
  }

  use 'sainnhe/gruvbox-material'
end)
