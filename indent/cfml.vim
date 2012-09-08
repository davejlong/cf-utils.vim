" Vim indent file
" Language:     ColdFusion
" Maintainer:   Jeremey Hustman
" Last Change:  04 Sep 2012

" Only load this indent file when no other was loaded yet.
if exists("b:did_indent")
    finish
endif
let b:did_indent = 1



" Always use ":setlocal" to set 'indentexpr'.  This avoids it being carried over
" to other buffers.
" 
" To trigger the indenting after typing a word like "endif", add the word to the
" 'cinkeys' option with "+=".
" 
" You normally set 'indentexpr' to evaluate a function and then define that
" function.  That function only needs to be defined once for as long as Vim is
" running.  Add a test if the function exists and use ":finish", like this:
" 	if exists("*GetMyIndent")
" 	  finish
" 	endif
" 
" The user may have several options set unlike you, try to write the file such
" that it works with any option settings.  Also be aware of certain features not
" being compiled in.

setlocal indentexpr=GetCFMLIndent(v:lnum)
setlocal indentkeys=o,O,*<Return>,<>>,{,}

if exists("g:cfml_indent_tags")
    unlet g:cfml_indent_tags
endif



" [-- helper function to assemble tag list --]
fun! <SID>CFMLIndentPush(tag)
    if exists('g:cfml_indent_tags')
        let g:cfml_indent_tags = g:cfml_indent_tags.'\|'.a:tag
    else
        let g:cfml_indent_tags = a:tag
    endif
endfun


" [-- <ELEMENT ? - - ...> --]
call <SID>CFMLIndentPush('cfcache')
call <SID>CFMLIndentPush('cfcase')
call <SID>CFMLIndentPush('cfcatch')
call <SID>CFMLIndentPush('cfchart')
call <SID>CFMLIndentPush('cfchartseries')
call <SID>CFMLIndentPush('cfcomponent')
call <SID>CFMLIndentPush('cfdefaultcase')
call <SID>CFMLIndentPush('cfdiv')
call <SID>CFMLIndentPush('cfelse')
call <SID>CFMLIndentPush('cffinally')
call <SID>CFMLIndentPush('cfform')
call <SID>CFMLIndentPush('cffunction')
call <SID>CFMLIndentPush('cfgrid')
call <SID>CFMLIndentPush('cfif')
call <SID>CFMLIndentPush('cfloop')
call <SID>CFMLIndentPush('cfoutput')
call <SID>CFMLIndentPush('cfquery')
call <SID>CFMLIndentPush('cfswitch')
call <SID>CFMLIndentPush('cfscript')
call <SID>CFMLIndentPush('cfsilent')
call <SID>CFMLIndentPush('cftree')
call <SID>CFMLIndentPush('cftry')

" [-- <ELEMENT ? O O ...> --]
if !exists('g:html_indent_strict')
    call <SID>CFMLIndentPush('body')
    call <SID>CFMLIndentPush('head')
endif


delfun <SID>CFMLIndentPush

let s:cpo_save = &cpo
set cpo-=C




" [-- count indent-increasing tags of line a:lnum --]
fun! <SID>CFMLIndentOpen(lnum, pattern)
    let s = substitute('x'.getline(a:lnum),
                \ '.\{-}\(\(<\)\('.a:pattern.'\)\>\)', "\1", 'g')
    let s = substitute(s, "[^\1].*$", '', '')
    return strlen(s)
endfun

" [-- count indent-decreasing tags of line a:lnum --]
fun! <SID>CFMLIndentClose(lnum, pattern)
    let s = substitute('x'.getline(a:lnum),
                \ '.\{-}\(\(<\)/\('.a:pattern.'\)\>>\)', "\1", 'g')
    let s = substitute(s, "[^\1].*$", '', '')
    return strlen(s)
endfun

" [-- count indent-increasing '{' of (java|css) line a:lnum --]
fun! <SID>CFMLIndentOpenAlt(lnum)
    return strlen(substitute(getline(a:lnum), '[^{]\+', '', 'g'))
endfun

" [-- count indent-decreasing '}' of (java|css) line a:lnum --]
fun! <SID>CFMLIndentCloseAlt(lnum)
    return strlen(substitute(getline(a:lnum), '[^}]\+', '', 'g'))
endfun


" [-- return the sum of indents respecting the syntax of a:lnum --]
fun! <SID>CFMLIndentSum(lnum, style)
    if a:style == match(getline(a:lnum), '^\s*</')
        if a:style == match(getline(a:lnum), '^\s*</\<\('.g:cfml_indent_tags.'\)\>')
            let open = <SID>CFMLIndentOpen(a:lnum, g:cfml_indent_tags)
            let close = <SID>CFMLIndentClose(a:lnum, g:cfml_indent_tags)
            if 0 != open || 0 != close
                return open - close
            endif
        endif
    endif
    if '' != &syntax &&
                \ synIDattr(synID(a:lnum, 1, 1), 'name') =~ '\(css\|java\).*' &&
                \ synIDattr(synID(a:lnum, strlen(getline(a:lnum)), 1), 'name')
                \ =~ '\(css\|java\).*'
        if a:style == match(getline(a:lnum), '^\s*}')
            return <SID>CFMLIndentOpenAlt(a:lnum) - <SID>CFMLIndentCloseAlt(a:lnum)
        endif
    endif
    return 0
endfun


fun! GetCFMLIndent(lnum)
    " Find a non-empty line above the current line.
    let lnum = prevnonblank(a:lnum - 1)

    " Hit the start of the file, use zero indent.
    if lnum == 0
        return 0
    endif

    let restore_ic = &ic
    setlocal ic " ignore case

    " Compiler directives should always go in column zero.
    if this_codeline =~ '^\s*{\(\$cfif\|\$cfelse\|\$\/cfif\)'
        return 0
    endif


    " [-- special handling for <pre>: no indenting --]
    if getline(a:lnum) =~ '\c</pre>'
                \ || 0 < searchpair('\c<pre>', '', '\c</pre>', 'nWb')
                \ || 0 < searchpair('\c<pre>', '', '\c</pre>', 'nW')
        " we're in a line with </pre> or inside <pre> ... </pre>
        if restore_ic == 0
            setlocal noic
        endif
        return -1
    endif

    " [-- special handling for <javascript>: use cindent --]
    let js = '<script'

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " by Tye Zdrojewski <zdro@yahoo.com>, 05 Jun 2006
    " ZDR: This needs to be an AND (we are 'after the start of the pair' AND
    "      we are 'before the end of the pair').  Otherwise, indentation
    "      before the start of the script block will be affected; the end of
    "      the pair will still match if we are before the beginning of the
    "      pair.
    "
    if   0 < searchpair(js, '', '</script>', 'nWb')
                \ && 0 < searchpair(js, '', '</script>', 'nW')
        " we're inside javascript
        if getline(lnum) !~ js && getline(a:lnum) != '</script>'
            if restore_ic == 0
                setlocal noic
            endif
            return cindent(a:lnum)
        endif
    endif

    " [-- special handling for <cfscript>: use cindent --]
    let cfs = '<cfscript>'

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " by Tye Zdrojewski <zdro@yahoo.com>, 05 Jun 2006
    " ZDR: This needs to be an AND (we are 'after the start of the pair' AND
    "      we are 'before the end of the pair').  Otherwise, indentation
    "      before the start of the script block will be affected; the end of
    "      the pair will still match if we are before the beginning of the
    "      pair.
    "
    if   0 < searchpair(js, '', '</cfscript>', 'nWb')
                \ && 0 < searchpair(js, '', '</cfscript>', 'nW')
        " we're inside cfscript
        if getline(lnum) !~ js && getline(a:lnum) != '</cfscript>'
            if restore_ic == 0
                setlocal noic
            endif
            return cindent(a:lnum)
        endif
    endif

    if getline(lnum) =~ '\c</pre>'
        " line before the current line a:lnum contains
        " a closing </pre>. --> search for line before
        " starting <pre> to restore the indent.
        let preline = prevnonblank(search('\c<pre>', 'bW') - 1)
        if preline > 0
            if restore_ic == 0
                setlocal noic
            endif
            return indent(preline)
        endif
    endif

    " If the previous line was indenting...
    if prev_codeline =~ '^\s*\<\(cfif\|cfcase\|cfelse\)\>'
        " then indent.
        let indnt = indnt + &shiftwidth
        " BUT... if this is the start of a multistatement block then we
        " need to align the begin with the previous line.
        if this_codeline =~ '^\s*cfif\>'
            return indnt - &shiftwidth
        endif

        " We also need to keep the indentation level constant if the
        " whole if-then statement was on one line.
        if prev_codeline =~ '\<cfelse\>.\+'
            let indnt = indnt - &shiftwidth
        endif
    endif


    let ind = <SID>CFMLIndentSum(lnum, -1)
    let ind = ind + <SID>CFMLIndentSum(a:lnum, 0)

    if restore_ic == 0
        setlocal noic
    endif

    return indent(lnum) + (&sw * ind)
endfun

let &cpo = s:cpo_save
unlet s:cpo_save

" [-- EOF <runtime>/indent/cfml.vim --]
