set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin() " required

Plugin 'vim-scripts/TaskList.vim.git'
Plugin 'bling/vim-airline'
Plugin 'majutsushi/tagbar'
Plugin 'rodjek/vim-puppet'
Plugin 'tpope/vim-fugitive'
Plugin 'mileszs/ack.vim'
Plugin 'ervandew/supertab'
Plugin 'vim-scripts/JSON.vim'
Plugin 'klen/python-mode'
Plugin 'local-packages'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
"Plugin 'altercation/vim-colors-solarized'
Plugin 'jnurmine/Zenburn'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/vimwiki'
Plugin 'nelstrom/vim-visual-star-search'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'alfredodeza/coveragepy.vim'
Plugin 'mhinz/vim-signify'
Plugin 'gmarik/Vundle.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'mhinz/vim-startify'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'python_match.vim'
Plugin 'bling/vim-bufferline'
" JS
"Plugin 'elzr/vim-json'
Plugin 'groenewege/vim-less'
Plugin 'briancollins/vim-jst'
Plugin 'kchmck/vim-coffee-script'
Plugin 'marijnh/tern_for_vim'
Plugin 'Lokaltog/vim-distinguished'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/syntastic'

Plugin 'rust-lang/rust.vim'
Plugin 'ryanoasis/vim-devicons'

call vundle#end() " required

filetype on
filetype plugin on
filetype indent on
syntax on
"set modelines=0
set encoding=utf-8
set ttyfast
set list
set listchars=tab:⇥\ ,trail:☠
set t_Co=256
set noswapfile
set modeline
set laststatus=2 " scroll the screen before I rech the bottom
"set statusline=%f%m%r%h%w\ [%{&ff}]\ %y\ [POS=%03l/%L,%03v][%p%%]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]
set nonumber
set mousehide "hide mouse curson while typing
set termencoding=utf-8
set novisualbell "don't blink
set foldcolumn=1
set wrap
set linebreak
" scroll when reach 3rd line from the bottom
set scrolloff=3
set autoindent
set history=500
set backspace=2                " Allow backspacing over everything in insert mode
set shiftwidth=4
set tabstop=8
set softtabstop=4
set smarttab
set showcmd
set showmatch
set ignorecase
set smartcase
set incsearch
set hlsearch
set ruler
set viminfo='1000,f1,<500,/50,:50
set cursorline
set wildignore+=*.o,*.obj,.git,.hg,*.pyc,*.db,*.sqlite
set background=dark
set expandtab

" X-clipboard support
if has('unnamedplus')
    set clipboard+=unnamed     " enable x-clipboard
endif

let mapleader=","

autocmd FileType make set noexpandtab
autocmd BufEnter master*.cfg set filetype=python
autocmd BufRead,BufnewFile *.C,*.c,*.h,*.cpp,*.cc,*.js,*.ps,*.sh,*.bash match BadFormat /\(\%81v.\+\)\|\(^\t\+\)\|\(\s\+$\)/
autocmd BufRead,BufnewFile *.py match BadFormat /\(\%80v.\+\)\|\(^\t\+\)\|\(\s\+$\)/
autocmd BufNewFile,BufRead COMMIT_EDITMSG set filetype=gitcommit
autocmd! BufRead,BufNewFile *.json set filetype=json foldmethod=syntax
autocmd! BufRead,BufNewFile *.pp set syntax=puppet filetype=puppet
autocmd! BufRead,BufNewFile *.rst set tw=72 et spell formatoptions=tcqw

"restore-position
autocmd BufReadPost *
      \ if line("'\"") > 0 && line ("'\"") <= line("$") |
      \   exe "normal g'\"" |
      \ endif

autocmd BufNewFile,BufRead *.py
    \ set tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
    \ textwidth=79
    \ expandtab
    \ autoindent
    \ fileformat=unix

autocmd BufNewFile,BufRead *.yml.tmpl set filetype=yaml
autocmd BufNewFile,BufRead *.js, *.html, *.css, *.yml, *.yaml, *.yml.tmpl
    \ set tabstop=2
    \ softtabstop=2
    \ shiftwidth=2


set background=dark
"let g:solarized_termtrans=1
"let g:solarized_termcolors=256
"let g:solarized_contrast="high"
"let g:solarized_visibility="high"
colorscheme zenburn
highlight BadFormat ctermbg=red ctermfg=white guibg=#592929

let g:pymode_paths = ["lib/python", "lib/python/vendor"]
let g:pymode_lint_checker = ['pyflakes', 'pep8', 'mccabe', 'pylint']
let g:pymode_run = 0
let g:pymode_folding = 0
"let g:pymode_rope_regenerate_on_write = 0
let g:pymode_rope = 0

"let g:pymode_lint_ignore = "C0103,C0111,E1002,E1101,R0901,R0902,R0904,W0141,W0142,W0212,W0232,W0621,R0913"
let g:pymode_lint_ignore = "C901"
let g:pymode_options_max_line_length = 79

let g:CommandTMaxHeight = 15
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

" Wildmenu
set wildmenu                " use wildmenu ...
set wildcharm=<TAB>


" Don't indent coments in Python
inoremap # X<C-H>#
cmap w!! %!sudo tee > /dev/null %

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
    \'\..*.db$',
    \'\..*.sqlite$',
    \'\.rej$']

let g:vimwiki_folding = 1
let g:vimwiki_fold_lists = 1
let g:vimwiki_list = [
    \ {"path" : "~/Dropbox/wiki"}
\ ]
nmap <Leader>wv <Plug>VimwikiIndex


noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" do dot show docs!!!
set completeopt=menu

" airline
let g:airline#extensions#tabline#enabled = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_right_sep = '«'
let g:airline_symbols.branch = '⎇'
" do not show changes in the status line
let g:airline#extensions#hunks#enabled = 0
" don't show buffers/tabs
"let g:airline#extensions#tabline#enabled = 0



" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" g:signify_disable_by_default = 1
nmap <F4> :SignifyToggle<CR>

let g:startify_change_to_vcs_root = 1
let g:startify_bookmarks = [ '~/work/mozilla/git/cloud-tools/', '~/work/mozilla/git/puppet/' ]

let g:UltiSnipsUsePythonVersion = 2

let g:indent_guides_guide_size=1
let g:indent_guides_start_level=2

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" Not for python
let g:syntastic_python_checkers = []
let g:syntastic_javascript_checkers = []
