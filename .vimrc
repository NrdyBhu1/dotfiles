"==============================
"
"		NrdyBhu1(2022)
"
" github.com/NrdyBhu1/dotfiles
"
"		$HOME/.vimrc
"
"==============================

filetype indent plugin on
syntax enable
set ts=4 sw=4
set mouse=a
set nu
set nowrap
set autoindent
colorscheme fnaqevan
" AirlineTheme fairyfloss

" if has('nvim')
" 	colorscheme railscasts
" endif
" vim ft=vim

au BufRead *.jinja2 set ft=html

nmap <C-n> :Texplore<CR>
vmap <C-n> :Texplore<CR>
