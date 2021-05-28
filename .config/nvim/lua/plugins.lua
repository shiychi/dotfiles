vim.cmd 'packadd packer.nvim'

local function lualine_config()
require('lualine').setup{
  options = {
    theme = 'tokyonight',
  },
}
end

return require('packer').startup(function()
  use 'Yggdroot/indentLine'
  use 'cohama/lexima.vim'
  use 'editorconfig/editorconfig-vim'
  use 'elzr/vim-json'
  use 'folke/tokyonight.nvim'
  use 'junegunn/fzf.vim'
  use 'previm/previm'
  use 'tpope/vim-surround'
  use 'tyru/open-browser.vim'
  use 'wbthomason/packer.nvim'
  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    config = function() require('lualine').setup{
      options = {
        theme = 'tokyonight'
      }
    } end
  }
  use { 'neoclide/coc.nvim', branch = 'release' }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'phaazon/hop.nvim', branch = 'pre-extmarks' }
end)
