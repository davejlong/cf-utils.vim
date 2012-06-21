" Language:     CFScript
" Maintainer:   Dave Long <http://davejlong.com>
" URL:          http://github.com/davejlong/coldfusion.vim
" License:      WTFPL

" Bail out if syntax is already loaded
if exists('b:current_syntex') && b:current_syntex == 'cfscript'
  finish
endif

let b:ignorecase = "true"

" Comments
syn keyword cfCommentTodo   contained  TODO FIXME XXX TBD
syn match   cfLineComment   contains=cfCommentTodo /\/\/.*/
syn region  cfComment       contains=cfCommentTodo start="/\*" end="\*/"

" Definitions
syn keyword cfComponent     component
syn keyword cfFunction	    function
syn match	  cfBraces	      "[{}\[\]]"
syn match	  cfParens	      "[()]"
syn keyword cfFunctionScope public private protected package

" Scopes
syn keyword cfScope         arguments variables session url form cgi
" syn keyword cfScope         Arguments Variables Session Url Form Cgi
" syn keyword cfScope         ARGUMENTS VARIABLES SESSION URL FORM CGI
" Define default highlighting
if version >= 508
  if version < 508
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  " Comments
  HiLink cfComment        comment
  HiLink cfLineComment    comment
  HiLink cfCommentTodo    Todo
  " Definitions
  HiLink cfComponent      StorageClass
  HiLink cfFunction       Function
  HiLink cfBraces         Function
  HiLink cfFunctionScope  StorageClass
  " Scopes
  HiLink cfScope          Keyword
  delcommand HiLink
endif

" Set the syntax
if !exists('b:current_syntex')
  let b:current_syntex = 'cfscript'
endif
