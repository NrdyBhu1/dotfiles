" plugin/ned.vim
if exists('g:ned_loaded') | finish | endif

let s:save_cpo = &cpo
set cpo&vim
set noshowmode

function ned#clear_statusline()
	set statusline=
endfunction

let modes = {
	\"n"		: " NORMAL ",
	\"no"		: " NORMAL ", 
	\"v"		: " VISUAL ", 
	\"V"		: " VISUAL LINE ", 
	\"CTRL-V"	: " VISUAL BLOCK ", 
	\"s"		: " SELECT ", 
	\"S"		: " SELECT LINE ", 
	\"CTRL-S"	: " SELECT BLOCK ", 
	\"i"		: " INSERT ", 
	\"ic"		: " INSERT ", 
	\"R"		: " REPLACE ", 
	\"Rv"		: " VISUAL REPLACE ", 
	\"c"		: " COMMAND ", 
	\"cv"		: " VIM EX ", 
	\"ce"		: " EX ", 
	\"r"		: " PROMPT ", 
	\"rm"		: " MOAR ", 
	\"r?"		: " CONFIRM ", 
	\"!"		: " SHELL ", 
	\"t"		: " TERMINAL " 
	\}

"" file
hi StatusLineFile ctermfg=0 ctermbg=49 guifg=#000000 guibg=#00ffaf
hi StatusLineFileInverse ctermfg=49 ctermbg=0 guifg=#00ffaf guibg=#000000

"" mode
hi StatusLineMode ctermfg=0 ctermbg=26 guifg=#000000 guibg=#005fd7
hi StatusLineModeInverse ctermfg=26 ctermbg=0 guifg=#005fd7 guibg=#000000

function SetStatusLineColor()
	let c_mode = mode()
	if c_mode == "i"
		hi StatusLineMode ctermfg=0 ctermbg=46 guifg=#000000 guibg=#00ff00
		hi StatusLineModeInverse ctermfg=46 ctermbg=0 guifg=#00ff00 guibg=#000000
	elseif c_mode == "c"
		hi StatusLineMode ctermfg=0 ctermbg=226 guifg=#000000 guibg=#00ff00
		hi StatusLineModeInverse ctermfg=226 ctermbg=0 guifg=#00ff00 guibg=#000000
	else
		hi StatusLineMode ctermfg=0 ctermbg=26 guifg=#000000 guibg=#005fd7
		hi StatusLineModeInverse ctermfg=26 ctermbg=0 guifg=#005fd7 guibg=#000000
	endif
endfunction

set statusline+=%#StatusLineModeInverse#
set statusline+=
set statusline+=%#StatusLineMode#
set statusline+=%{modes[mode()]}
set statusline+=%#StatusLineModeInverse#
set statusline+=
set statusline+=%=%#StatusLineFileInverse#
set statusline+=
set statusline+=%#StatusLineFile#
set statusline+=
set statusline+=%{' '.expand('%:t').' '}
set statusline+=
set statusline+=%#StatusLineFileInverse#
set statusline+=

augroup StatusLine
	au!
	au ModeChanged * call SetStatusLineColor()
augroup end

" let s:ned = lua require'ned'
" 
" function! GetMode()
" 	let s:mod = s:ned.get_mode()
" 	return s:mod
" endfunction
" 
" " set statusline=%!lua require'ned'.get_mode()
" set statusline=%!GetMode()

let &cpo = s:save_cpo
unlet s:save_cpo

let g:ned_loaded = 1
