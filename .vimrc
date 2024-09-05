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
"let &l:statusline='%1*%#Identifier#«%t»%#ModeMsg# %M%R%f%=%c,%l/%L'
set statusline=%1*%#Identifier#«%t»%#ModeMsg#\ %M%R%f%=%c,%l/%L
set ls=2
set re=0
filetype plugin on
filetype plugin indent on
call pathogen#infect()
au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
autocmd BufNewFile,BufRead *.vb set ft=vbnet
au BufRead,BufNewFile *.pl6 setfiletype perl6
set wildmode=longest,list,full
set wildmenu
cabbrev vb vert sb

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
map <ESC>[1;3D :tabp<CR>
map <ESC>[1;3C :tabn<CR>
if os == 'Darwin' || os == 'Mac'
  map <ESC>b :tabp<CR>
  map <ESC>f :tabn<CR>
endif

" ale config
let g:ale_sign_column_always = 1
let g:ale_sign_error = '!!'
let g:ale_sign_warning = '##'
let g:ale_set_highlights = 0
let g:airline#extensions#ale#enabled = 1
let g:ale_pattern_options = {
\ '\.py$':         {'ale_linters':      ['flake8'],       'ale_fixers': ['autopep8', 'black']},
\ '\.go$':         {'ale_linters':      ['gofmt'],        'ale_fixers': ['gofmt', 'goimports', 'remove_trailing_lines', 'trim_whitespace']},
\ '\.tsx$':        {'ale_linters':      ['tslint'],       'ale_fixers': ['prettier', 'tslint', 'remove_trailing_lines', 'trim_whitespace']},
\ '\.ts$':         {'ale_linters':      ['tslint'],       'ale_fixers': ['prettier', 'tslint', 'remove_trailing_lines', 'trim_whitespace']},
\ '\.jsx$':        {'ale_linters':      ['eslint'],       'ale_fixers': ['prettier', 'eslint', 'remove_trailing_lines', 'trim_whitespace']},
\ '\.js$':         {'ale_linters':      ['eslint'],       'ale_fixers': ['prettier', 'eslint', 'remove_trailing_lines', 'trim_whitespace']},
\ '\.svelte$':     {'ale_linters':      ['svelteserver'], 'ale_fixers': ['prettier', 'remove_trailing_lines', 'trim_whitespace']},
\ '\.scad$':       {'ale_linters':      [],               'ale_fixers': ['scadformat']},
\ '\.html$':       {'ale_linters':      [],               'ale_fixers': ['prettier']},
\ '\.raku(mod|test)?$': {'ale_linters': [],               'ale_fixers': ['remove_trailing_lines', 'trim_whitespace']},
\}
let g:ale_pattern_options_enabled = 1
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
