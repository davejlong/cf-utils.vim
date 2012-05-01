" Language:       cfml
" Maintainer:     Dave Long <http://davejlong.com>
" URL:            http://github.com/davejlong/coldfusion.vim
" License:        WTFPL

" Bail if out syntax is already loaded
if exists('b:current_syntax') && b:current_syntax == 'cfml'
  finish
endif



if !exists('b:current_syntax')
  let b:current_syntex = 'cfml'
endif
