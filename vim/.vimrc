set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'nanotech/jellybeans.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Plugin settings "
"let g:airline_powerline_fonts = 1
let g:airline_theme='angr'
let g:airline#extensions#tabline#enabled = 1
let g:airline_highlighting_cache = 0
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline_powerline_fonts = 1 
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9


" Vim settings "
" ============ "

set background=dark
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Enable 256 colors
set t_Co=256

" Snappier Normal mode
set ttimeoutlen=10

" Enable syntax highlighting
syntax on
colorscheme jellybeans
set number

" Tabs
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" Always show the status line
set laststatus=2

" Format the status line
" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set completeopt=menu

" Key mappings

" Normal mode
" nnoremap © :YcmCompleter GoTo<CR>
" nnoremap ƒ :YcmCompleter FixIt<CR>
nnoremap <C-b> :!make
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc><C-s>

if filereadable(expand("~/Library/Developer/llvm/share/clang/clang-format.py"))
    map <C-K> :pyf ~/Library/Developer/llvm/share/clang/clang-format.py<cr>
    imap <C-K> <c-o>:pyf ~/Library/Developer/llvm/share/clang/clang-format.py<cr>

    " Clang format
    function! Formatonsave()
        let l:formatdiff = 1
        pyf ~/Library/Developer/llvm/share/clang/clang-format.py
    endfunction
    autocmd BufWritePre *.h,*.cc,*.cpp call Formatonsave()
endif
