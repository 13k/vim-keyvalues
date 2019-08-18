" Vim syntax file
" Language: Valve's	KeyValues (version 1)
" Specification: https://developer.valvesoftware.com/wiki/KeyValues
" Maintainer:	Kiyoshi Murata <kbmurata@gmail.com> https://github.com/13k/vim-keyvalues
"
" Syntax file based on JSON syntax by @elzr:
"   https://github.com/elzr/vim-json/blob/master/syntax/json.vim

if exists('b:current_syntax')
  finish
endif

" Syntax: Keywords
syn keyword kvKeywords #base #include

" Syntax: Escape sequences
" Allowed escape sequences are \n, \t, \\, and \"
syn match kvEscape /\\["\\nt]/ contained

" Syntax: Strings
syn region kvString start=/"/ skip=/\\"|\\\\/ end=/"/

syn region kvStringSQError start=/'/ skip=/\\\\\|\\"\|\\'/  end=/'/

" Syntax: Numbers
syn match kvNumber /-\=\<\%([0-9]\d*\)\%(\.\d\+\)\=\%([eE][-+]\=\d\+\)\=\>/

" Syntax: Comments
syn region kvComment start="//" end="\n"

" Syntax: Braces
syn region kvFold matchgroup=kvBraces start="{" end=/}\(\_s\+\ze\("\|{\)\)\@!/ transparent fold
syn region kvFold matchgroup=kvBraces start="\[" end=/]\(\_s\+\ze"\)\@!/ transparent fold

" Syntax: Object definition names
syn match kvObjectNameMatch /"\?\([^"]\|\\\"\)\+"\?[[:blank:]\r\n]*{/ contains=kvObjectName
syn region kvObjectName start=/"\?/ end=/"\?\ze[[:blank:]\r\n]*{/ contains=kvEscape contained

" Highlighting
hi link kvKeywords   Keyword
hi link kvString     String
hi link kvNumber     Number
hi link kvComment    Comment
hi link kvObjectName Identifier
hi link kvBraces     Delimiter
