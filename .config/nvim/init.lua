require 'plugins'
-- require 'completion'
-- require 'lsp'
require 'coc'
require 'fzf'
require 'indentLine'
require 'vim-json'

vim.cmd([[
colorscheme tokyonight
syntax on

highlight CursorLineNr ctermbg=NONE guibg=NONE
highlight EndOfBuffer ctermbg=NONE guibg=NONE
highlight LineNr ctermbg=NONE guibg=NONE
highlight NonText ctermbg=NONE guibg=NONE
highlight Normal ctermbg=NONE guibg=NONE
highlight SpecialKey ctermbg=NONE guibg=NONE
highlight clear SignColumn

autocmd BufNewFile,BufRead *.jl set filetype=julia
autocmd BufNewFile,BufRead *.sh set filetype=bash
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx
]])

vim.g.python3_host_prog = '/usr/bin/python'
vim.o.completeopt = 'menuone,noselect'

vim.api.nvim_set_option('autoindent', true)
vim.api.nvim_set_option('smartindent', true)
vim.api.nvim_set_option('clipboard', 'unnamed')
vim.api.nvim_set_option('scrolloff', 10)
vim.api.nvim_set_option('splitright', true)
vim.api.nvim_set_option('tabstop', 2)
vim.api.nvim_set_option('termguicolors', true)
vim.api.nvim_set_option('updatetime', 100)
vim.api.nvim_set_option('shiftwidth', 2)
vim.api.nvim_buf_set_option(0, 'expandtab', true)
vim.api.nvim_buf_set_option(0, 'shiftwidth', 2)
vim.api.nvim_win_set_option(0, 'list', true)
vim.api.nvim_win_set_option(0, 'listchars', 'tab:»-,trail:-,extends:»,nbsp:%')
vim.api.nvim_win_set_option(0, 'number', true)
vim.api.nvim_win_set_option(0, 'relativenumber', true)

vim.api.nvim_set_keymap('', '<Space>', '<Leader>', {})
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'O', [[:<C-u>call append(expand("."), '')<Cr>j]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gf', ':<C-u>Format<Cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gq', ':<C-u>CocFix<Cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 's', ':<C-u>HopChar2<Cr>', { noremap = true, silent = true })

-- fzf.vim
vim.api.nvim_set_keymap('n', '<Leader>f', ':<C-u>GFiles<Cr>', { noremap = true, silent = true })

vim.cmd[[set shiftwidth=2
set expandtab]]
