syntax on
colorscheme grb256
set si
set nu
set nowrap
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
call pathogen#infect()
au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
autocmd BufNewFile,BufRead *.vb set ft=vbnet
au BufRead,BufNewFile *.pl6 setfiletype perl6
