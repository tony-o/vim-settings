" Vim syntax file
" Language: mao 

if exists("b:current_syntax")
    finish
endif

syn keyword maoKeyword obj inc as if else undef return for while cp lib
highlight link maoKeyword Keyword

syn keyword maoFun fun
highlight link maoFun Function

syn region maoStr start=/\v"/ skip=/\v\\./ end=/\v"/ contains=maoInterStr
syn region maoStr start=/\v'/ skip=/\v\\./ end=/\v'/ contains=maoInterStr
syn region maoInterStr start=/\v\|/ end=/\v\|/
syn match maoInterStr "\v\%(d|i|o|x|X|u|c|s|f|e|E|g|G|p|n)"
hi link maoStr String
hi link maoInterStr Special

syn keyword maoBool true false
hi link maoBool Boolean

syn match maoNum "\v\d+"
syn match maoNum "\v\d+e\d+"
hi link maoNum Number

syn match maoOp "\v(\=|\.|,|:\=)"
syn match maoOp "\v(\(|,)@<=:" nextgroup=maoId
hi link maoOp Operator

syn match maoId "\v[a-zA-Z][_a-zA-Z0-9]*"

syn match maoComment "\v(#|//).*$"
syn region maoComment start="/\*" end="\*/"
hi link maoComment Comment
"nextgroup=syntaxElement2

let b:current_syntax = "mao"
