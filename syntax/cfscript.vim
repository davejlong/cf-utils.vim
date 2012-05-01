" Language:     ColdFusion Script (cfscript)
" Maintainer:   Dave Long <http://davejlong.com>
" URL:          http://github.com/davejlong/coldfusion.vim
" License:      WTFPL

" Bail out if syntax is already loaded
if exists('b:current_syntex') && b:current_syntex == 'cfscript'
  finish
endif


" Set the syntax
if !exists('b:current_syntex')
  let b:current_syntex = 'cfscript'
endif
