set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
filetype on
filetype plugin on
filetype indent on
syntax on

Bundle 'TaskList.vim'
Bundle 'Command-T'
Bundle 'vim-powerline'
Bundle 'tagbar'
Bundle 'vim-puppet'
Bundle 'vim-fugitive'
Bundle 'ack.vim'
Bundle 'supertab'
Bundle 'vim-git'
Bundle 'JSON.vim'
Bundle 'python-mode'
Bundle 'local-packages'
Bundle 'molokai'
Bundle 'webapi-vim'
Bundle 'gist-vim'
Bundle 'vim-colors-solarized'
Bundle 'nerdcommenter'
Bundle 'nerdtree'

set modelines=0
set encoding=utf-8
set ttyfast
set list
set listchars=tab:⇥\ ,trail:☠
set t_Co=256
set noswapfile
set modeline
set laststatus=2 " scroll the screen before I rech the bottom
"set statusline=%f%m%r%h%w\ [%{&ff}]\ %y\ [POS=%03l/%L,%03v][%p%%]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]
"set number
set mousehide "hide mouse curson while typing
set termencoding=utf-8
set novisualbell "don't blink
set foldcolumn=1
set wrap
set linebreak
" scroll when reach 3rd line from the bottom
set scrolloff=3
set ai
set history=500         " keep 500 lines of command history
set bs=2                " Allow backspacing over everything in insert mode
set shiftwidth=4
set tabstop=8
set softtabstop=4
set smarttab
set showcmd            " Show (partial) command in status line.
set showmatch          " Show matching brackets.
set ignorecase         " Do case insensitive matching
set smartcase
set incsearch          " Incremental search
set hlsearch
set ruler
set viminfo='1000,f1,<500,/50,:50
set cursorline
set wildignore+=*.o,*.obj,.git,.hg,*.pyc
set background=dark
"
" Undo
if has('persistent_undo')
    set undofile            " enable persistent undo
    set undodir=/tmp/       " store undofiles in a tmp dir
endif

" X-clipboard support
if has('unnamedplus')
    set clipboard+=unnamed     " enable x-clipboard
endif

let mapleader=","

au BufEnter *.inc set filetype=php
au FileType make set noexpandtab
au BufEnter master*.cfg set filetype=python
au! BufRead,BufNewFile *.json set filetype=json foldmethod=syntax
au BufRead,BufnewFile *.C,*.c,*.h,*.cpp,*.cc,*.js,*.ps,*.sh,*.bash match BadFormat /\(\%81v.\+\)\|\(^\t\+\)\|\(\s\+$\)/
au BufRead,BufnewFile *.py match BadFormat /\(\%80v.\+\)\|\(^\t\+\)\|\(\s\+$\)/

"restore-position
autocmd BufReadPost *
      \ if line("'\"") > 0 && line ("'\"") <= line("$") |
      \   exe "normal g'\"" |
      \ endif

autocmd BufNewFile,BufRead COMMIT_EDITMSG set filetype=gitcommit
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

let g:solarized_termcolors = 256
colorscheme solarized
"highlight CursorLine ctermbg=black
highlight BadFormat ctermbg=red ctermfg=white guibg=#592929

let g:pymode_paths = ["lib/python", "lib/python/vendor"]
let g:pymode_lint_checker = "pylint,pep8"
let g:pymode_run = 0
let g:pymode_lint_maxheight = 5
let g:pymode_rope_extended_complete=1
let g:lint_message=1

let g:Powerline_symbols = 'fancy'
let g:CommandTMaxHeight = 15
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

" Wildmenu
set wildmenu                " use wildmenu ...
set wildcharm=<TAB>
set wildignore=*.pyc        " ignore file pattern


noremap <F9> :emenu G.<TAB>
menu G.Status :Gstatus<CR>
menu G.Diff :Gdiff<CR>
menu G.Commit :Gcommit %<CR>
menu G.Checkout :Gread<CR>
menu G.Remove :Gremove<CR>
menu G.Move :Gmove<CR>
menu G.Log :Glog<CR>
menu G.Blame :Gblame<CR>


" Don't indent coments in Python
inoremap # X<C-H>#
cmap w!! %!sudo tee > /dev/null %

" remap TaskList mapping to prevent conflicts with Command-T
map <unique> <Leader>T <Plug>TaskList
nmap <F6> :TagbarToggle<CR>
nmap <F8> :Gist<CR>
vmap <F8> :Gist<CR>
inoremap <F1> <ESC>:NERDTreeToggle<CR>
nnoremap <F1> :NERDTreeToggle<CR>
vnoremap <F1> :NERDTreeToggle<CR>
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>
nnoremap <F3> :set list!<CR>
" Manage vimrc
map <Leader>s :source ~/.vimrc<CR>
map <Leader>e :sp ~/.vimrc<CR>
nnoremap <silent> <F10> :q<CR>
" spelhecker
map <silent> <F7> :set invspell<CR>
let NERDTreeIgnore=[
    \'\.pyc$',
    \'\.pyo$',
    \'\..*.rej$',
    \'\.rej$']
