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
syn keyword cfCommentTodo   contained TODO FIXME XXX TBD
syn match   cfLineComment   /\/\/.*/ contains=cfCommentTodo
syn region  cfComment       start="/\*" end="\*/" contains=cfCommentTodo

" Definitions
syn keyword cfComponent     component
syn keyword cfFunction	    function
syn match	  cfBraces	      "[{}\[\]]"
syn match	  cfParens	      "[()]"
syn keyword cfFunctionScope public private protected package
syn keyword cfType          any array binary boolean component date
syn keyword cfType          guid numeric query string struct uuid
syn keyword cfType          void xml

" Statements
syn keyword cfStatement     return var

" Strings
syn region  cfHash          contained start=+#+ end=+#+
syn region  cfStringD       start=+"+ end=+"+ contains=cfHash
syn region  cfStringS       start=+'+ end=+'+ contains=cfHash
syn keyword cfBoolean       true false

" Scopes
syn keyword cfScope         application arguments attributes caller cgi client
syn keyword cfScope         cookie flash form request server session this
syn keyword cfScope         thread url variables

" Conditionals
syn keyword cfCondition     if else switch case

" CF Functions
" Array functions
syn keyword cfFunctions     arrayappend arrayavg arrayclear arraydeleteat arrayinsertat arraycontains
syn keyword cfFunctions     arrayisdefined arrayisempty arraylen arraymax arraymin arraydelete
syn keyword cfFunctions     arraynew arrayprepend arrayresize arrayset arraysort arrayfind
syn keyword cfFunctions     arraysum arrayswap arraytolist isarray listtoarray arrayfindnocase

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
  HiLink cfType           Type

  " Statements
  HiLink cfStatement      Statement

  " Strings
  HiLink cfStringD        String
  HiLink cfStringS        String
  HiLink cfHash           PreProc
  HiLink cfBoolean        Boolean

  " Scopes
  HiLink cfScope          Keyword

  " Conditional
  HiLink cfCondition      Conditional

  " CF Functions
  HiLink cfFunctions      Function
  delcommand HiLink
endif

" Set the syntax
if !exists('b:current_syntex')
  let b:current_syntex = 'cfscript'
endif
