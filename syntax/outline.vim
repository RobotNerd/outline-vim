" Syntax setup {{{1
if exists('b:current_syntax') && b:current_syntax == 'outline'
  finish
endif

" Syntax: Strings {{{1
syn region  outlineString    start=+"+  skip=+\\\\\|\\"+  end=+"\|\n+  contains=outlineEscape

" Syntax: Label {{{1
syn match outlineSection     "^[A-Z].*$"

" Syntax: TODO
syn match outlineTodo "\v([A-Za-z-_])@<!(BUG|DEPRECATED|FIXME|IMPORTANT|TODO)([A-Za-z-_])@!"
"syn match outlineTodo "\([A-Za-z-_]\)\@<!\(BUG\|DEPRECATED\|FIXME\|IMPORTANT\|TODO\)\([A-Za-z-_]\)\@!"

" Syntax: Exception {{{1
syn region outlineQuestion   start=+? + end=+\v\n\n@=|\n([A-Z])@=|(^\s*- )@=|(^\s*\* )@=|(^\s*! )@=|(^\s*x )@=+ contains=outlineTodo
"syn region outlineQuestion   start=+? + end=+\n\n\@=\|\n\([A-Z]\)\@=\|\(^\s*- \)\@=\|\(^\s*\* \)\@=\|\(^\s*! \)\@=\|\(^\s*x \)\@=+ contains=outlineTodo

" Syntax: Tag {{{1
syn region outlineImportant  start=+! + end=+\v\n\n@=|\n([A-Z])@=|(^\s*- )@=|(^\s*\* )@=|(^\s*\? )@=|(^\s*x )@=+ contains=outlineTodo
"syn region outlineImportant  start=+! + end=+\n\n\@=\|\n\([A-Z]\)\@=\|\(^\s*- \)\@=\|\(^\s*\* \)\@=\|\(^\s*? \)\@=\|\(^\s*x \)\@=+ contains=outlineTodo

" Syntax: Tag {{{1
syn region outlineInvalid    start=+x + end=+\v\n\n@=|\n([A-Z])@=|(^\s*- )@=|(^\s*\* )@=|(^\s*\? )@=|(^\s*! )@=+ contains=outlineTodo
"syn region outlineInvalid    start=+x + end=+\n\n\@=\|\n\([A-Z]\)\@=\|\(^\s*- \)\@=\|\(^\s*\* \)\@=\|\(^\s*? \)\@=\|\(^\s*! \)\@=+ contains=outlineTodo

" Syntax: Escape sequences
"syn match   outlineEscape    "\\["\\/bfnrt]" contained
"syn match   outlineEscape    "\\u\x\{4}" contained

" Syntax: Numbers {{{1
"syn match   outlineNumber    "-\=\<\%(0\|[1-9]\d*\)\%(\.\d\+\)\=\%([eE][-+]\=\d\+\)\=\>"
"syn keyword outlineNumber    Infinity -Infinity

" Syntax: An integer part of 0 followed by other digits is not allowed.
"syn match   outlineNumError  "-\=\<0\d\.\d*\>"

" Syntax: Boolean {{{1
"syn keyword outlineBoolean   true false

" Syntax: Null {{{1
"syn keyword outlineNull      null

" Syntax: Braces {{{1
"syn match   outlineBraces	   "[{}\[\]]"
"syn match   outlineObjAssign /@\?\%(\I\|\$\)\%(\i\|\$\)*\s*\ze::\@!/

" Syntax: Comment {{{1
syn region  outlineLineComment    start=+##+ end=+$+ keepend contains=outlineTodo
"syn region  outlineLineComment    start=+^\s*\/\/+ skip=+\n\s*\/\/+ end=+$+ keepend fold
"syn region  outlineComment        start="/\*"  end="\*/" fold

" Define the default highlighting. {{{1
hi def link outlineString String
hi def link outlineObjAssign Identifier
hi def link outlineSection Underlined
hi def link outlineQuestion Exception
hi def link outlineImportant Repeat
hi def link outlineInvalid Comment
"hi def link outlineEscape Special
hi def link outlineTodo Todo
"hi def link outlineBraces Operator
"hi def link outlineNull Function
"hi def link outlineBoolean Boolean
hi def link outlineLineComment Comment
"hi def link outlineComment Comment
"hi def link outlineNumError Error

if !exists('b:current_syntax')
  let b:current_syntax = 'outline'
endif

" vim: fdm=marker
