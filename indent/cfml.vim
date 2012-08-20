" Vim indent file
" Language: ColdFusion 10 Markup Language 
" Maintainer:   Jeremey Hustman
" Last Change:  2012 July 26

" Only load this indent file when no other was loaded.
if exists("b:did_indent")
    finish
endif
" let b:did_indent = 1


" lets use HTML formatting rules first.
runtime! indent/html.vim
setlocal cindent
setlocal cinkeys={
