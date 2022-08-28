set runtimepath^=~/.vim runtimepath+=~/.nvim/
let &packpath = &runtimepath

source ~/.vimrc
lua require('plugins')
lua require 'nvim-treesitter.install'.compilers = { 'clang++'}

colorscheme anaris
if has('gui')
	set background=light
	set guifont=JetBrainsMono\ Nerd\ Font:h12
endif
