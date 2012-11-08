set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'python-mode'
Bundle 'Command-T'
Bundle 'vim-powerline'
Bundle 'tagbar'
Bundle 'vim-puppet'
Bundle 'vim-fugitive'
Bundle 'ack.vim'
" remap TaskList mapping to prevent conflicts with Command-T
map <unique> <Leader>T <Plug>TaskList
Bundle 'TaskList.vim'
Bundle 'supertab'
Bundle 'vim-git'
Bundle 'JSON.vim'
Bundle 'local-packages'


set modelines=0
set encoding=utf-8
set scrolloff=3
set ttyfast
set list
set listchars=tab:▸\ ,trail:☠
set t_Co=256
" disable  F1 help!
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

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

nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>
nnoremap <F3> :set list!<CR>
filetype on
filetype plugin on
filetype indent on
"let python_highlight_all=1
au BufEnter *.inc set filetype=php
au FileType make set noexpandtab
au BufEnter master*.cfg set filetype=python
"set expandtab "Python!
"set sw=4
"let pythonhighlightall=1   "для максимально полной подсветки файла
"nmap <F6> :TlistOpen<CR>        "F8 -вызов taglist
nmap <F6> :TagbarToggle<CR>
"let g:pydiction_location = '~/.vim/complete-dict'
" scroll when reach 3rd line from the bottom
set scrolloff=3

" Manage vimrc
map ,s :source ~/.vimrc<CR>
map ,e :sp ~/.vimrc<CR>

set ai
set history=500         " keep 500 lines of command history
set bs=2                " Allow backspacing over everything in insert mode
set shiftwidth=4
set tabstop=8
set softtabstop=4
set smarttab
colorscheme wombat256mod
nnoremap <silent> <F10> :q<CR>
syntax on
set showcmd            " Show (partial) command in status line.
set showmatch          " Show matching brackets.
set ignorecase         " Do case insensitive matching
set smartcase
set incsearch          " Incremental search
set hlsearch
set ruler
set viminfo='1000,f1,<500,/50,:50
"restore-position
autocmd BufReadPost *
      \ if line("'\"") > 0 && line ("'\"") <= line("$") |
      \   exe "normal g'\"" |
      \ endif

"menu Spellcheck.Russian :set spelllang=ru<CR>
"menu Spellcheck.English :set spelllang=en<CR>
"map <F9> :emenu Spellcheck.<TAB>


" spell checker
map <silent> <F7> :set invspell<CR>

autocmd BufNewFile,BufRead COMMIT_EDITMSG set filetype=gitcommit

set cursorline
highlight CursorLine ctermbg=black
"hi CursorLine term=none cterm=none ctermbg=4

"autocmd FileType python set omnifunc=pythoncomplete#Complete textwidth=79
au! BufRead,BufNewFile *.json set filetype=json foldmethod=syntax

let mapleader=","

map T :TaskList<CR>
" Don't indent coments in Python
inoremap # X<C-H>#


highlight BadFormat ctermbg=red ctermfg=white guibg=#592929
au BufRead,BufnewFile *.C,*.c,*.h,*.cpp,*.cc,*.js,*.ps,*.sh,*.bash match BadFormat /\(\%81v.\+\)\|\(^\t\+\)\|\(\s\+$\)/
au BufRead,BufnewFile *.py match BadFormat /\(\%80v.\+\)\|\(^\t\+\)\|\(\s\+$\)/
cmap w!! %!sudo tee > /dev/null %

autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class


" Python mode

" Switch pylint, pyflakes, pep8, mccabe code-checkers
" Can have multiply values "pep8,pyflakes,mccabe"
"let g:pymode_lint_checker = "pylint,pep8,pyflakes,mccabe"
let g:pymode_lint_checker = "pylint,pep8"

let g:pymode_rope_extended_complete=1
let g:lint_message=1

let g:Powerline_symbols = 'fancy'
let g:CommandTMaxHeight = 15
set wildignore+=*.o,*.obj,.git,.hg,*.pyc
