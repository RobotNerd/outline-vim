" Syntax setup
if exists('b:current_syntax') && b:current_syntax == 'outline'
  finish
endif

" quoted strings
syn region outlineString start=+"+ end=+\v"|\n+

" section header
syn match outlineSection "^[A-Z].*$"

" TODO, BUG, etc. tags
syn keyword outlineTodo BUG DEPRECATED FIXME IMPORTANT TODO

" bullet points
syn region outlineQuestion start=+? + end=+\v\n\n@=|\n([A-Z])@=|(^\s*[-x!\*] )@=+ contains=outlineTodo
syn region outlineImportant start=+! + end=+\v\n\n@=|\n([A-Z])@=|(^\s*[-\*\?x] )@=+ contains=outlineTodo
syn region outlineInvalid start=+x + end=+\v\n\n@=|\n([A-Z])@=|(^\s*[-\*\?!] )@=+ contains=outlineTodo

" comment
syn region outlineLineComment start=+##+ end=+$+ keepend contains=outlineTodo

hi def link outlineString String
hi def link outlineObjAssign Identifier
hi def link outlineSection Underlined
hi def link outlineQuestion Exception
hi def link outlineImportant Repeat
hi def link outlineInvalid Comment
hi def link outlineTodo Todo
hi def link outlineLineComment Comment

if !exists('b:current_syntax')
  let b:current_syntax = 'outline'
endif

" vim: fdm=marker
