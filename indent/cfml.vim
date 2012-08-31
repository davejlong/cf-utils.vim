" Vim indent file
" Language:     ColdFusion
" Maintainer:   Jeremey Hustman
" Last Change:  2012 Aug 30

" Only load this indent file when no other was loaded.
if exists("b:did_indent")
    echo "did_indent"
    finish
endif
" let b:did_indent = 1

setlocal indentexpr=GetColdFusionIndent(v:lnum)
"setlocal indentkeys=o,O,*<Return>,<>>,{,}

if exists("*GetColdFusionIndent")
    "    finish
    echo "finish"
endif

" lets use HTML formatting rules first.
" runtime! indent/html.vim

function! s:GetPrevNonCommentLineNum( line_num )

    " Skip lines starting with a comment
    let SKIP_LINES = '^\s*\(\((\*\)\|\(\*\ \)\|\(\*)\)\|{\|}\)'

    let nline = a:line_num
    while nline > 0
        let nline = prevnonblank(nline-1)
        if getline(nline) !~? SKIP_LINES
            break
        endif
    endwhile

    return nline
endfunction

function! GetColdFusionIndent( line_num )
echo line_num

endfunction

" setlocal cindent
" setlocal cinkeys={
"setlocal cinwords=function,cffileupload
