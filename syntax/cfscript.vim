" Language:     CFScript
" Maintainer:   Dave Long <http://davejlong.com>
" URL:          http://github.com/davejlong/coldfusion.vim
" License:      WTFPL

" Bail out if syntax is already loaded
if exists('b:current_syntex') && b:current_syntex == 'cfscript'
  finish
endif

syn case ignore

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

" Statements
syn keyword cfStatement     return var

" Strings
" Include Sql in string
if exists("b:current_syntax")
  unlet b:current_syntax
endif
syn include @cfSql $VIMRUNTIME/syntax/sql.vim

syn region cfStringD        start=+"+ skip=+\\\\\\|\\"+ end=+"\|$+ contains=@cfSql
syn region cfStringS        start=+'+ skip=+\\\\\\|\\"+ end=+'\|$+ contains=@cfSql

" Scopes
syn keyword cfScope         application arguments attributes caller cgi client
syn keyword cfScope         cookie flash form request server session this
syn keyword cfScope         thread url variables

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

  " Statements
  HiLink cfStatement      Statement
  HiLink cfStringD        String
  HiLink cfStringS        String

  " Scopes
  HiLink cfScope          Keyword
  delcommand HiLink
endif

" Set the syntax
if !exists('b:current_syntex')
  let b:current_syntex = 'cfscript'
endif
