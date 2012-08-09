" Language:       CF
" Maintainer:     Dave Long <http://davejlong.com>
" URL:            http://github.com/davejlong/coldfusion.vim
" License:        WTFPL

autocmd BufNewFile,BufRead *.cfm set filetype=cfml
autocmd BufNewFile,BufRead *.cfml set filetype=cfml

function! s:DetectCF()
  if getline(1) =~ '^component'
    set filetype=cfscript
  elseif getline(1) =~ '^\/\*'
    set filetype=cfscript " handles comments on first line of CFC
  else
    set filetype=cfml
  endif
endfunction

" For CFCs there needs to be a check somewhere if it is script or tag
autocmd BufNewFile,BufRead,BufEnter *.cfc call s:DetectCF()
