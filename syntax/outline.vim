" Syntax setup
if exists('b:current_syntax') && b:current_syntax == 'outline'
  finish
endif

" quoted strings
syn region outlineString start=+"+ end=+\v"|\n\n+

" section header
syn match outlineSection "^[A-Z].*$"

" TODO, BUG, etc. tags
syn keyword outlineTodo BUG DEPRECATED FIXME IMPORTANT NOTE TODO

" bullet points
syn region outlineQuestion start=+\v^\s*\? + end=+\v\n\n@=|\n([A-Z])@=|(^\s*[-x!\*] )@=+ contains=outlineTodo
syn region outlineImportant start=+\v^\s*\! + end=+\v\n\n@=|\n([A-Z])@=|(^\s*[-\*\?x] )@=+ contains=outlineTodo
syn region outlineInvalid start=+\v^\s*x + end=+\v\n\n@=|\n([A-Z])@=|(^\s*[-\*\?!] )@=+ contains=outlineTodo

" comment
syn region outlineLineComment start=+##+ end=+$+ keepend contains=outlineTodo

" URI (see: https://gist.github.com/tobym/584909)
syn match outlineURI "\([A-Za-z][A-Za-z0-9\+\.\-]*\)\?:\/\/\(\w\+\(:\w\+\)\?@\)\?\([A-Za-z][-_0-9A-Za-z]*\.\)\{1,}\(\w\{2,}\.\?\)\{1,}\(:[0-9]\{1,5}\)\?\S*"
syn match outlineURI "\v//[A-za-z0-9\-_/\.#]*"
syn match outlineURI "\v/[A-za-z0-9\-_/\.#]+"
syn match outlineURI "\v[A-za-z0-9_\.#]+/[A-za-z0-9\-_/\.#]+"

" email
syn match outlineEmail "\v[A-za-z0-9_]+[A-za-z0-9\.\-_\+]*\@[A-za-z0-9\.\-_]*"

" URN
syn match outlineURN "\v[a|u]rn:[A-Za-z0-9\-_:]+"

" Hashtag
syn match outlineHashtag "\v(\@|#)[A-Za-z0-9\-_]+"

hi def link outlineString String
hi def link outlineObjAssign Identifier
hi def link outlineSection Underlined
hi def link outlineQuestion Exception
hi def link outlineImportant Repeat
hi def link outlineInvalid Comment
hi def link outlineTodo Todo
hi def link outlineLineComment Comment
hi def link outlineURI Underlined
hi def link outlineURN Underlined
hi def link outlineEmail Underlined
hi def link outlineHashtag Underlined

if !exists('b:current_syntax')
  let b:current_syntax = 'outline'
endif

" vim: fdm=marker
