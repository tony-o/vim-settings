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
filetype plugin on
filetype plugin indent on
call pathogen#infect()
au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
autocmd BufNewFile,BufRead *.vb set ft=vbnet
au BufRead,BufNewFile *.pl6 setfiletype perl6
let g:go_fmt_command = 'gofmt'

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

"autocmd VimEnter * NERDTree | wincmd p
let g:rustfmt_autosave = 1
map <ESC>[1;3D :tabp<CR>
map <ESC>[1;3C :tabn<CR>
