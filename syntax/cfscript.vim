" Language:     CFScript
" Maintainer:   Dave Long <http://davejlong.com>
" URL:          http://github.com/davejlong/coldfusion.vim
" License:      WTFPL

" Bail out if syntax is already loaded
"if exists('b:current_syntex') && b:current_syntex == 'cfscript'
"  finish
"endif

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
syn keyword cfFunctions     abs acos addsoaprequestheader addsoapresponseheader ajaxlink ajaxonload
syn keyword cfFunctions     applicationstop arrayappend arrayavg arrayclear arraycontains arraydelete
syn keyword cfFunctions     arraydeleteat arrayfind arrayfindnocase arrayinsertat arrayisdefined
syn keyword cfFunctions     arrayisempty arraylen arraymax arraylen arraynew arrayprepend arrayresize
syn keyword cfFunctions     arrayset arraysort arraysum arrayswap arraytolist asc asin atn authenticatedcontext
syn keyword cfFunctions     authenticateduser binarydecode binaryencode bitand bitmastclear bitmaskread
syn keyword cfFunctions     bitmaskset bitnot bitor bitshln bitshrn bitxor
syn keyword cfFunctions     cacheget cachegetallids cachegetmetadata cachegetsession cacheput cacheremove
syn keyword cfFunctions     cachesetproperties ceiling charsetdecode charsetencode chr cjustify compare
syn keyword cfFunctions     comparenocase cos createdate createdatatime createobject createodbcdate
syn keyword cfFunctions     createodbcdatetime createodbctime createtime createtimespan createuuid dateadd
syn keyword cfFunctions     datecompare dateconvert datediff dateformat datepart day dayofweek dayofweekasstring
syn keyword cfFunctions     dayofyear daysinmonth daysinyear de decimalformat decrementvalue decrypt
syn keyword cfFunctions     decryptbinary deleteclientvariable deserializejson directorycreate directorydelete
syn keyword cfFunctions     directoryexists directorylist directoryrename dollarformat dotnettocftype duplicate
syn keyword cfFunctions     encrypt encryptbinary entitydelete entityloadbyexample entityloadbypk entitymerge
syn keyword cfFunctions     entitynew entityreload entitysave entitytoquery evaluate exp expandpath fileclose
syn keyword cfFunctions     filecopy filedelete fileexists fileiseof filemove fileopen fileread filereadbinary
syn keyword cfFunctions     filereadline fileseek filesetaccessmode filesetattribute filesetlastmodified
syn keyword cfFunctions     fileskipbytes fileupload fileuploadall filewrite filewriteline find findnocase
syn keyword cfFunctions     findoneof firstdayofmonth fix formatbasen generatesecretkey getauthuser getbasetagdata
syn keyword cfFunctions     getbasetaglist getbasetemplatepath getclientvariableslist getcomponentmetadata
syn keyword cfFunctions     getcontextroot getcurentemplatepath getdirectoryfrompath getencoding getexception
syn keyword cfFunctions     getfilefrompath getfileinfo getfunctioncalledname getfunctionlist getgatewayhelper
syn keyword cfFunctions     gethttprequestdata gethttptimestring getk2serverdoccount getk2serverdoccountlimit
syn keyword cfFunctions     getlocale getlocaledisplayname getlocalhostip getmetadata getmetricdata getpagecontext
syn keyword cfFunctions     getprinterinfo getprinterlist getprofilesections getprofilestring getreadableimageformats
syn keyword cfFunctions     getsoaprequest getsoaprequestheader getsoapresponse getsoapresponseheader
syn keyword cfFunctions     gettempdirectory gettempfile gettickcount gettimezoneinfo gettoken getuserroles
syn keyword cfFunctions     getvfsmetadata getwriteableimageformats
syn keyword cfFunctions     hash hour htmlcodeformat htmleditformat iif imageaddborder imageblur imageclearrect
syn keyword cfFunctions     imagecopy imagecrop imagedrawarc imagedrawbeveledrect imagedrawcubiccurve imagedrawline
syn keyword cfFunctions     imagedrawlines imagedrawoval imagedrawpoint imagedrawquadraticcurve iamgedrawrect
syn keyword cfFunctions     imagedrawroundrect imagedrawtext imageflip imagegetblob imagegetbufferedimage imagegetexifdata
syn keyword cfFunctions     imagegetheight imagegetiptcmetadata imagegetiptctag imagegetwidth imagegrayscale
syn keyword cfFunctions     imageinfo imagenegative imagenew imageoverlay imagepaste imageread imagereadbase64
syn keyword cfFunctions     imageresize imagerotate imagerotatedrawingaxis imagescaletofit imagesetantialiasing
syn keyword cfFunctions     imagesetbackgroundcolor imagesetdrawingcolor imagesetdrawingstroke imagesetdrawingtransparency
syn keyword cfFunctions     iamgesharpen imageshear imagesheardrawingacis imagetranslate imagetranslatedrawingaxis
syn keyword cfFunctions     imagewrite imagewritebase64 imagexordrawingmode
syn keyword cfFunctions     incrementvalue inputbasen insert int isarray isauthenticated isauthorized isbinary
syn keyword cfFunctions     isboolean iscustomfunctions isdate isddx isdebugmode isdefined isimage isimagefile
syn keyword cfFunctions     isinstancteof isipv6 isjson isk2serverabroker isk2serverdoccountexceeded isk2serveronline
syn keyword cfFunctions     isleapyear islocalhost isnull isnumeric isnumericdate isobject ispdffile isprotected isquery
syn keyword cfFunctions     issimplevalue issoaprequest isspreadsheetfile isspreadsheetobject isstruct isuserinanyrole
syn keyword cfFunctions     isuserinrole isuserloggedin isvalid iswddx isxml isxmlattribute isxmldoc isxmlelem
syn keyword cfFunctions     isxmlnode isxmlroot javacast jsstringformat

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
