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
colorscheme everblush
set termguicolors
" AirlineTheme fairyfloss

" if has('nvim')
" 	colorscheme railscasts
" endif
" vim ft=vim

au BufRead *.jinja2 set ft=html

function! Build()
	if &filetype ==# "rust"
		call system("cargo build")
	endif
endfunction

function! Run()
	if &filetype ==# "rust"
		call system("cargo run")
	endif
endfunction
