syntax on
colorscheme grb256
set si
set nu
set nowrap
set backspace=2
set tabstop=2
set expandtab
set shiftwidth=2
map <C-s> :w<CR>
imap <C-s> <Esc>:w<CR>i
set ruler
set hlsearch
set lazyredraw
set magic
set showmatch
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
set statusline=\ %F%m%r%h\ %w\ \ %r%{getcwd()}%h%=%c,%l/%L\ %P 
set ls=2
let g:gofmt_exe = 'goimports -local "github.com/alphaflow/institutional-api"'
filetype plugin on
call pathogen#infect()
au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
autocmd BufNewFile,BufRead *.vb set ft=vbnet
au BufRead,BufNewFile *.pl6 setfiletype perl6
"au BufWritePost *.go silent! !gofmt -w -s -e  %
au BufWritePost *.go call FormatGo()
function FormatGo()
  silent! !goimports -w -local "$(if [[ -f go.mod ]]; then head -n 1 go.mod | perl -pe '$_ =~ s/^module\s*(.+)$/$1/g'; else echo 'xyz'; fi)" -e %
  edit
  redraw!
endfunction

autocmd BufNewFile,BufRead *.vpm call SetVimPresentation()
function SetVimPresentation()
  nnoremap <buffer> <f1> :N<CR> :redraw!<CR>
  nnoremap <buffer> <f2> :n<CR> :redraw!<CR>
  set nostartofline
  set noshowmode
  set noruler
  set shortmess=F
  set laststatus=0
  set noshowcmd
  set nonumber
  set syntax=vpm
  au BufLeave * if !&diff | let b:winview = winsaveview() | endif
  au BufEnter * if exists('b:winview') && !&diff | call winrestview(b:winview) | unlet! b:winview | endif
endfunction
