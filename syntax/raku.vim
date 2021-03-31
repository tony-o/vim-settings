" vim syntax file
" language: raku
" maintainer: tony-o
" version: 1

if exists("b:current_syntax")
  finish
endif

syn match OP "\v(\{|\}|\(|\))"
hi link OP Operator

syn keyword KW sub method class unit module if elsif else grammar is export my int str our use Str Int Num Str() Int() Num()
hi link KW Keyword

syn match VAR "\v(\$|\@|\%)[^ \)\}\(\{\;]+"
hi link VAR Special
