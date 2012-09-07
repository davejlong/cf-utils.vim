" Vim filetype plugin file
" Language: coldFusion
" Maintainer:   Jeremey Hustman
" Last Changed: 2012-09-04
" URL:

if exists("b:did_ftplugin") | finish | endif
let b:did_ftplugin = 1

" Make sure the continuation lines below do not cause problems in
" compatibility mode.
let s:save_cpo = &cpo
set cpo-=C


setlocal matchpairs+=<:>
setlocal commentstring=<!---%s--->
setlocal comments=s:<!---,m:\ \ \ \ ,e:--->


if exists("g:ft_cfml_autocomment") && (g:ft_cfml_autocomment == 1)
    setlocal formatoptions-=t formatoptions+=croql
endif



if exists("loaded_matchit")
    let b:match_ignorecase = 1
    let b:match_words = '<:>,' .
    \ '<\@<=[ou]l\>[^>]*\%(>\|$\):<\@<=li\>:<\@<=/[ou]l>,' .
    \ '<\@<=dl\>[^>]*\%(>\|$\):<\@<=d[td]\>:<\@<=/dl>,' .
    \ '<\@<=\([^/][^ \t>]*\)[^>]*\%(>\|$\):<\@<=/\1>'
endif




" Undo the stuff we changed.
let b:undo_ftplugin = "setlocal matchpairs< commentstring< comments< formatoptions<" .
    \	" | unlet! b:match_ignorecase b:match_words"

" Restore the saved compatibility options.
let &cpo = s:save_cpo
