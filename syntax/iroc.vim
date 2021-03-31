" Vim syntax file
" Language: iroc

if exists("b:current_syntax")
    finish
endif

syn keyword irocKeyword obj inc as
hi link irocKeyword Keyword

syn keyword irocFun fun
hi link irocFun Function

syn region irocStr start=/\v"/ skip=/\v\\./ end=/\v"/ contains=irocInterStr
syn region irocStr start=/\v'/ skip=/\v\\./ end=/\v'/ contains=irocInterStr
syn region irocInterStr start=/\v\|/ end=/\v\|/
syn match irocInterStr "\v\%(d|i|o|x|X|u|c|s|f|e|E|g|G|p|n)"
syn match irocInterStr "\v\\."
hi link irocStr String
hi link irocInterStr Special

syn keyword irocBool true false
hi link irocBool Boolean

syn match irocNum "\v\d+"
hi link irocNum Number

syn match irocOp "\v(\=|\.|,|:\=)"
syn match irocOp "\v(\(|,)@<=:" nextgroup=irocId
hi link irocOp Operator

syn match irocId "\v[a-zA-Z][_a-zA-Z0-9]*"

syn match irocComment "\v(#|//).*$"
syn region irocComment start="/\*" end="\*/"
hi link irocComment Comment
"nextgroup=syntaxElement2

let b:current_syntax = "iroc"
