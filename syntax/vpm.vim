if exists('b:current_syntax')
  finish
endif

syn match bullet '▰'
syn match bullet "\v(github|twitter|patreon|blog):"
hi def link bullet Type 

syn match pros "\v(Pros|Cons):"
hi def link pros Keyword
