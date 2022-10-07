"==============================
"
"		NrdyBhu1(2022)
"
" github.com/NrdyBhu1/dotfiles
"
"		$HOME/.vimrc
"
"==============================

set ts=4 sw=4
set mouse=a
set nu
set nowrap
set autoindent
syntax enable
colorscheme delek

" if has('nvim')
" 	colorscheme railscasts
" endif
" vim ft=vim

au BufRead *.jinja2 set ft=html

nmap <C-n> :Texplore<CR>
vmap <C-n> :Texplore<CR>
