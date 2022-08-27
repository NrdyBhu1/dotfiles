set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

colorscheme anaris
if has('gui')
	set background=light
	set guifont=JetBrainsMono\ Nerd\ Font:h12
endif
