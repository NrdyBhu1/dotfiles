" 
" Name: 	anaris.vim
" URL:		~/.config/nvim/colors/anaris.vim
" LICENSE:	MIT
"

function! HiForCterm(group, ...)
	let histring = 'hi ' . a:group . ' '

	" Set cterm background
	if strlen(a:1)
		let histring .= 'ctermbg=' . a:1 . ' '
	endif

	" Set cterm foreground
	if strlen(a:2)
		let histring .= 'ctermfg=' . a:2 . ' '
	endif

	if a:0 >= 3 && strlen(a:3)
		let histring .= 'cterm=' . a:3 . ' '
	endif
	execute histring
endfunction

function! HiForGui(group, ...)
	let histring = 'hi ' . a:group . ' '

	" Set gui background
	if strlen(a:1)
		let histring .= 'guibg=' . a:1 . ' '
	endif

	" Set gui foreground
	if strlen(a:2)
		let histring .= 'guifg=' . a:2 . ' '
	endif

	if a:0 >= 3 && strlen(a:3)
		let histring .= 'gui=' . a:3 . ' '
	endif
	execute histring
endfunction

if has('gui')
	set background=light
else
	set background=dark
endif
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "anaris"
"" TODO: Learn color theory and do this properly
"" Cterm
call HiForCterm("Comment", "NONE", 130)
call HiForCterm("Normal", 235, 249)
call HiForCterm("String", "NONE", 34)
call HiForCterm("Character", "NONE", 40)
call HiForCterm("Number", "NONE", 3)
call HiForCterm("Float", "NONE", 11)
call HiForCterm("Boolean", "NONE", 172)
call HiForCterm("Identifier", "NONE", 5)
call HiForCterm("Function", "NONE", 4)
call HiForCterm("Repeat", "NONE", 196)
call HiForCterm("Operator", "NONE", 163)
call HiForCterm("Statement", "NONE", 227)
call HiForCterm("Conditional", "NONE", 31)
call HiForCterm("Type", "NONE", 90)
call HiForCterm("Todo", 0, 10)

"" Gui
call HiForGui("Comment", "NONE", "#af5f00")
call HiForGui("Normal", "#262626", "#b2b2b2")
call HiForGui("String", "NONE", "#00af00")
call HiForGui("Character", "NONE", "#00d700")
call HiForGui("Number", "NONE", "#808000")
call HiForGui("Float", "NONE", "#ffff00")
call HiForGui("Boolean", "NONE", "#d78700")
call HiForGui("Identifier", "NONE", "#800080")
call HiForGui("Function", "NONE", "#000080")
call HiForGui("Repeat", "NONE", "#ff0000")
call HiForGui("Operator", "NONE", "#d700af")
call HiForGui("Statement", "NONE", "#ffff5f")
call HiForGui("Conditional", "NONE", "#0087af")
call HiForGui("Type", "NONE", "#870087")
call HiForGui("Todo", "#000000", "#00ff00")
