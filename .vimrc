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
"let g:rustfmt_autosave = 1
let os=substitute(system('uname'), '\n', '', '')
if os == 'Darwin' || os == 'Mac'
  map <ESC>b :tabp<CR>
  map <ESC>f :tabn<CR>
else
  map <ESC>[1;3D :tabp<CR>
  map <ESC>[1;3C :tabn<CR>
endif

" ale config
let g:ale_sign_column_always = 1
let g:ale_sign_error = '!!'
let g:ale_sign_warning = '--'
let g:ale_set_highlights = 0
let g:airline#extensions#ale#enabled = 1
let g:ale_pattern_options = {
\ '\.py$': {'ale_linters': ['flake8'], 'ale_fixers': ['autopep8', 'black']},
\ '\.go$': {'ale_linters': ['gofmt'], 'ale_fixers': []},
\}
let g:ale_pattern_options_enabled = 1
let g:ale_fix_on_save = 1


function! DoPrettyXML()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --format -
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
  silent %<
  " back to home
  1
  " restore the filetype
  exe "set ft=" . l:origft
endfunction
command! PrettyXML call DoPrettyXML()
