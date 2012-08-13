" Vim filetype plugin file
" Language: coldFusion
" Maintainer:   Jeremey Hustman
" Last Changed: 09 Aug 2012
" URL:

if exists("b:did_ftplugin") | finish | endif

" Make sure the continuation lines below do not cause problems in
" compatibility mode.
let s:save_cpo = &cpo
set cpo-=C



setlocal commentstring=<!--- %s --->


" Restore the saved compatibility options.
let &cpo = s:save_cpo
