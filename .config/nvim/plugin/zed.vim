" plugin/zed.vim
if exists('g:zed_loaded') | finish | endif

let s:save_cpo = &cpo
set cpo&vim

command! -nargs=1 Zed lua require'zed'.zed(<f-args>)

let &cpo = s:save_cpo
unlet s:save_cpo

let g:zed_loaded = 1
