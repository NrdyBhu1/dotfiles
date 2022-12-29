"==============================
"
"		NrdyBhu1(2022)
"
" github.com/NrdyBhu1/dotfiles
"
"		$HOME/.vimrc
"
"==============================

set nocompatible
filetype indent plugin on
syntax enable
set ts=4 sw=4
" set mouse=a
set nu
set nowrap
set autoindent
colorscheme asuna_dark
set notermguicolors
"" set termguicolors
let g:python3_host_prog="/usr/bin/python3.10"
" AirlineTheme fairyfloss

" if has('nvim')
" 	colorscheme railscasts
" endif
" vim ft=vim

au BufRead *.jinja2 set ft=html
au BufRead *.hx set ft=haxe

function! Build()
	if &filetype ==# "rust"
		call system("cargo build")
	endif
endfunction

let g:airline_theme = "base16_chalk"
" base16_mocha also good
" let g:airline_left_sep='>'
" let g:airline_right_sep='<'
" let g:airline_left_sep = "\uE0B4"
" let g:airline_right_sep = "\uE0B6"

function! Run()
	if &filetype ==# "rust"
		call system("cargo run")
	endif
endfunction
