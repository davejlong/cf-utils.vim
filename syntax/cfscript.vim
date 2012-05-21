" Language:     CFScript
" Maintainer:   Dave Long <http://davejlong.com>
" URL:          http://github.com/davejlong/coldfusion.vim
" License:      WTFPL

" Bail out if syntax is already loaded
if exists('b:current_syntex') && b:current_syntex == 'cfscript'
  finish
endif

" Scopes and Keywords
syn keyword   cfScope           contained cgi cffile cookie request caller this thistag
syn keyword   cfScope           contained cfcatch variables application server session
syn keyword   cfScope           contained client form url local
syn keyword   cfBool            contained yes no true false

" Operator strings
" Old crap
syn keyword   cfOperator        contained xor eqv and or lt le lte gt ge gte equal eq neq not is mod contains
syn match     cfOperatorMatch   contained "+"
syn match     cfOperatorMatch   contained "\-"
syn match     cfOperatorMatch   contained "[\*\/\\\^\&][\+\-\*\/\\\^\&]\@!"

" Set the syntax
if !exists('b:current_syntex')
  let b:current_syntex = 'cfscript'
endif
