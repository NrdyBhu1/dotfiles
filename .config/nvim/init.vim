set runtimepath^=~/.vim runtimepath+=~/.nvim/
let &packpath = &runtimepath

source ~/.vimrc
lua require('plugins')
lua require 'nvim-treesitter.install'.compilers = { 'clang++'}
lua require('lsp')
lua require('bubbles')

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

colorscheme onedark
if has('gui')
	set background=light
	set guifont=JetBrainsMono\ Nerd\ Font:h12
endif
