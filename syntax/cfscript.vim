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
syn match   cfJavaDoc       contained /@\(.\| \)\+$/ contains=cfJavaDocAttr,cfJavaDocVal
syn match   cfJavaDocAttr   contained /@\([a-z]\)\+/
syn match   cfJavaDocVal    contained / \(.\)+$/
syn match   cfLineComment   /\/\/.*/ contains=cfCommentTodo,cfJavaDoc
syn region  cfComment       start="/\*" end="\*/" contains=cfCommentTodo,cfJavaDoc


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
syn keyword cfCondition     is gt gte lt lte not contains
" Loops
syn keyword cfLoop          for do while

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
syn keyword cfFunctions     hash hour htmlcodeformat htmleditformat iif imageaddborder imageblur imageclearrect imagecopy imagecrop imagedrawarc imagedrawbeveledrect imagedrawcubiccurve imagedrawline imagedrawlines imagedrawoval imagedrawpoint imagedrawquadraticcurve iamgedrawrect imagedrawroundrect imagedrawtext imageflip imagegetblob imagegetbufferedimage imagegetexifdata imagegetheight imagegetiptcmetadata imagegetiptctag imagegetwidth imagegrayscale imageinfo imagenegative imagenew imageoverlay imagepaste imageread imagereadbase64 imageresize imagerotate imagerotatedrawingaxis imagescaletofit imagesetantialiasing imagesetbackgroundcolor imagesetdrawingcolor imagesetdrawingstroke imagesetdrawingtransparency iamgesharpen imageshear imagesheardrawingacis imagetranslate imagetranslatedrawingaxis imagewrite imagewritebase64 imagexordrawingmode
syn keyword cfFunctions     incrementvalue inputbasen insert int isarray isauthenticated isauthorized isbinary isboolean iscustomfunctions isdate isddx isdebugmode isdefined isimage isimagefile isinstancteof isipv8 isjson isk2serverabroker isk2serverdoccountexceeded isk2serveronline isleapyear islocalhost isnull isnumeric isnumericdate isobject ispdffile isprotected isquery issimplevalue issoaprequest isspreadsheetfile isspreadsheetobject isstruct isuserinanyrole isuserinrole isuserloggedin isvalid iswddx isxml isxmlattribute isxmldoc isxmlelem isxmlnode isxmlroot javacast jsstringformat
syn keyword cfFunctions     lcase left len listappend listchangedelims listcontains listcontainsnocase listdeleteat listfind listfindnocase listfirst listgetat listinsertat listlast listlen listprepend listqualify listrest listsetat listsort listtoarray listvaluecount listvaluecountnocase ljustify location log log10 lscurrencyformat lsdateformat lseurocurrencyformat lsiscurrency lsisdate lsisnumeric lsnumberformat lsparsecurrency lsparsedatetime lsparseeurocurrency lsparsenumber lstimeformat ltrim
syn keyword cfFunctions     max mid min minute month monthasstring now numberformat objectequals objectload objectsave ormclearsession ormclosesession ormcloseallsessions ormevictcollection ormvictentity ormevictqueries ormexecutequery ormflush ormgetsession ormgetsessionfactory ormreload paragraphformat parameterexists parsedatetime pi precisionevaluate preservesinglequotes quarter queryaddcolumn queryaddrow queryconvertforgrid querynew querysetcell quotedvaluelist rand randomize randrange refind refindnocase rematch rematchnocase releasecomobject removechars repeatstring replace replacelist rereplace rereplacenocase reverse right rjustify round rtrim
syn keyword cfFunctions     second sendgatewaymessage serializejson setencoding setlocale setprofilestring setvariable sgn sin sleep spanexcluding spanincluding spreadsheetaddcolumn spreadsheetaddimage spreadsheetaddfreezepane spreadsheetaddinfo spreadsheetaddrow spreadsheetaddrows spreadsheetaddsplitpane spreadsheetcreatesheet spreadsheetdeletecolumn spreadsheetdeletecolumns spreadsheetdeleterow spreadsheetdeleterows spreadsheetformatcell spreadsheetformatcolumn spreadsheetformatcellrange spreadsheetformatcolumns spreadsheetformatrow spreadsheetformatrows spreadsheetgetcellcomment spreadsheetgetcellformula spreadsheetgetcellvalue spreadsheetinfo spreadsheetmergecells spreadsheetnew spreadsheetread spreadsheetreadbinary spreadsheetremovesheet spreadsheetsetactivesheet spreadsheetsetactivesheetnumber spreadsheetsetcellcomment spreadsheetsetcellformula spreadsheetsetcellvalue spreadsheetsetcolumnwidth spreadsheetsetfooter spreadsheetsetheader spreadsheetsetrowheight spreadsheetshiftcolumns spreadsheetshiftrows spreadsheetwrite sqr stringcr structappend structclear structcopy structcount structdelete structfind structfindkey structfindvalue structget structinsert structisempty structkeyarray structkeyexists structkeylist structnew structsort structupdate
syn keyword cfFunctions     tan threadjoin threadterminate throw timeformat tobase64 tobinary toscript tostring trace transactioncommit transactionrollback transactionsetsavepoint trim ucase urldecodeurlencodedformat urlsessionformat val valuelist verifyclient week wrap writeDump writeLog writeOutput xmlchildpos xmlelemnew xmlformat xmlgetnodetype xmlnew xmlparse xmlsearch xmltransform xmlvalidate year yesnoformat


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
  " JavaDoc syntax
  HiLink cfJavaDocAttr    StorageClass
  HiLink cfJavaDocVal     Function

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
  " Loop
  HiLink cfLoop           Conditional

  " CF Functions
  HiLink cfFunctions      Function
  delcommand HiLink
endif

" Set the syntax
if !exists('b:current_syntex')
  let b:current_syntex = 'cfscript'
endif
