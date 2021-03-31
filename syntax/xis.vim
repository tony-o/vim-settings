" Vim syntax file
" Language: xis

if exists("b:current_syntax")
    finish
endif

"syn keyword xisKeyword obj inc as
"hi link xisKeyword Keyword

syn region xisStr start=/\v"/ skip=/\v\\./ end=/\v"/ contains=xisInterStr
syn region xisStr start=/\v'/ skip=/\v\\./ end=/\v'/ contains=xisInterStr
syn region xisInterStr start=/\v\|/ end=/\v\|/
syn match xisInterStr "\v\%(d|i|o|x|X|u|c|s|f|e|E|g|G|p|n)"
syn match xisInterStr "\v\\."
hi link xisStr String
hi link xisInterStr Special

" syn keyword xisBool true false
" hi link xisBool Boolean

syn match xisNum "\v\d+"
hi link xisNum Number

syn match xisOp "\v(\=|\+|\-|\>|>=|<|<=|\/|\*|!|\@|\|):"
hi link xisOp Operator

syn match xisId "\v!?[a-zA-Z][_a-zA-Z0-9:\?\-]*:"
hi link xisId Statement 

syn match xisComment "\v(#|//).*$"
syn region xisComment start="/\*" end="\*/"
hi link xisComment Comment
"nextgroup=syntaxElement2

syn match xisFun "\v(fun|macro|def)\s*\:\v"
hi link xisFun Function 

let b:current_syntax = "xis"
