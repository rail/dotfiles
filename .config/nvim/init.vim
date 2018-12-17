" based on https://github.com/dylanaraps/dotfiles/blob/master/nvim/.config/nvim/init.vim
" Top level config {{{

scriptencoding utf-8
set encoding=utf-8

" Leader
let g:mapleader = "\<space>"

" }}}

" Plugins {{{

" Auto install plug if not found
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config//nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    augroup PLUG
        au!
        autocmd VimEnter * PlugInstall
    augroup END
endif

call plug#begin('~/.config/nvim/plugged')

" Writing plugins
Plug 'junegunn/goyo.vim'
    " augroup Writing
    "     au!
    "     autocmd FileType markdown,text setlocal spell
    " augroup END

" Fuzzy finder
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'junegunn/fzf.vim'
"     nmap <C-x> :FZF<CR>

Plug 'ctrlpvim/ctrlp.vim'

" Async Linting
Plug 'w0rp/ale'
    let g:ale_lint_on_save = 1
    let g:ale_lint_on_text_changed = 1
    let g:ale_lint_on_enter = 1
    " let g:ale_sign_error = '>>'
    " let g:ale_sign_warning = '--'
    let g:ale_sign_error = '●'
    let g:ale_sign_warning = '.'
    let g:ale_python_flake8_options = "--max-line-length=110"
    " airline thingy
    let g:airline#extensions#ale#enabled = 1
    nmap <silent> <C-n> <Plug>(ale_next_wrap)
    nmap <silent> <C-N> <Plug>(ale_previous_wrap)

" Async Completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neoinclude.vim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'Shougo/neco-vim'
Plug 'Shougo/neco-syntax'
    let g:deoplete#enable_at_startup = 1
    let g:deoplete#auto_complete_delay = 0
    inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

Plug 'davidhalter/jedi-vim'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
    let g:UltiSnipsExpandTrigger='<c-e>'
    let g:UltiSnipsJumpForwardTrigger='<c-b>'
    let g:UltiSnipsJumpBackwardTrigger='<c-z>'

" Clicking v expands region
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'
Plug 'terryma/vim-expand-region'
    vmap v <Plug>(expand_region_expand)
    vmap <C-v> <Plug>(expand_region_shrink)

" Shows search results as you're typing
Plug 'junegunn/vim-pseudocl'
Plug 'junegunn/vim-oblique'
    let g:oblique#incsearch_highlight_all = 1
    let g:oblique#clear_highlight = 1
    let g:oblique#prefix = "\\v" " Very Magic

" Insert brackets on enter.
Plug 'rstacruz/vim-closer'

" Tpope
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
    " Maps ss to surround word
    nmap ss ysiw

    " Maps sl to surround line
    nmap sl yss

    " Surround Visual selection
    vmap s S

" Filetype Plugins
Plug 'cakebaker/scss-syntax.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'othree/html5.vim'

" Show yanked region
Plug 'machakann/vim-highlightedyank'
    let g:highlightedyank_highlight_duration = 200

" look and feel
Plug 'junegunn/limelight.vim'
"     autocmd! User GoyoEnter Limelight
"     autocmd! User GoyoLeave Limelight!
Plug 'junegunn/rainbow_parentheses.vim'

" Plug 'jnurmine/Zenburn'
Plug 'junegunn/seoul256.vim'

" Misc
Plug 'mhinz/vim-signify'
" Remove extraneous whitespace when edit mode is exited
Plug 'thirtythreeforty/lessspace.vim'
    let g:lessspace_blacklist = ['python']

Plug 'vim-airline/vim-airline'
    let g:airline#extensions#tabline#enabled = 1
    let g:airline_powerline_fonts = 1

Plug 'vim-airline/vim-airline-themes'
    let g:airline_theme = 'base16_hopscotch'

Plug 'majutsushi/tagbar'
    nmap <F8> :TagbarToggle<CR>

Plug 'mhinz/vim-startify'
    let g:startify_bookmarks = [ {'c': '~/.config/nvim/init.vim'}, '~/.zshrc' ]
    let g:startify_change_to_dir = 0
    let g:startify_relative_path = 1

Plug 'ryanoasis/vim-devicons'

Plug 'mxw/vim-jsx'
    let g:jsx_ext_required = 0

Plug 'pangloss/vim-javascript'

Plug 'LnL7/vim-nix'

Plug 'ambv/black', { 'rtp': 'vim'}

Plug 'mileszs/ack.vim'
    let g:ackprg = 'ag --vimgrep --smart-case'

Plug 'tpope/vim-fugitive'

Plug 'scrooloose/nerdtree'
    " Start both startify and nerdtree
    autocmd VimEnter *
                \   if !argc()
                \ |   Startify
                \ |   NERDTree
                \ |   wincmd w
                \ | endif

Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'michaeljsmith/vim-indent-object'

Plug 'rodjek/vim-puppet'

Plug 'neovimhaskell/haskell-vim'

call plug#end()

" }}}

" Filetypes {{{

filetype plugin indent on

augroup Filetypes
    au!

    " Prevent saving files starting with ':' or ';'.
    autocmd BufWritePre [:;]* throw 'Forbidden file name: ' . expand('<afile>')

    " Syntax folding for bash
    autocmd Filetype sh let g:sh_fold_enabled=3
    autocmd Filetype sh let g:is_bash=1
    autocmd Filetype sh setlocal foldmethod=syntax

    " All Filetypes
    " Disable comment on newline
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

    " Remove Whitespace on save
    autocmd BufWritePre * :%s/\s\+$//e

    " Html
    " Map </ to auto close tags
    autocmd FileType html inoremap <buffer> </ </<C-X><C-O>

    " Markdown
    " set .md files to filetype markdown
    autocmd BufNewFile,BufRead *.md set filetype=markdown

    " Equalize splits on resize, mainly used with Goyo to fix it's padding on resize.
    " autocmd VimResized * execute "normal \<C-W>="

    " Always use goyo
    " autocmd BufReadPost * Goyo 80%x90%

    " Plugins
    autocmd FileType xdefaults setlocal commentstring=!\ %s
    autocmd FileType scss,css,json,yaml,javascript.jsx,javascript setlocal shiftwidth=2 softtabstop=2
augroup END

syntax enable
let python_highlight_all=1

" highlight all tabs and trailing whitespace characters
"highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
highlight ExtraWhitespace ctermbg=red ctermfg=white guibg=#592929
match ExtraWhitespace /\s\+$\|\t/


" }}}

" Spaces and Tabs {{{

" Set indent to 4 spaces wide
set tabstop=4
set shiftwidth=4

" A combination of spaces and tabs are used to simulate tab stops at a width
set softtabstop=4
set expandtab

" Show “invisible” characters
" set listchars=tab:▸\ ,trail:·,eol:¬,nbsp:_
set listchars=tab:⇥\ ,trail:☠
set list

" }}}

" Line Wrap {{{

" Soft wraps lines without editing file
set wrap

" Stops words from being cut off during linebreak
set linebreak

" Set textwidth to 80 characters
set textwidth=0
set wrapmargin=0

" Copy indent from previous line on linebreak
set autoindent

" Linebreaks keep indent level
set breakindent

" }}}

" Look and Feel {{{

" Enable true color for neovim
let $NVIM_TUI_ENABLE_TRUE_COLOR = 0

" Enables cursor similar to gui programs
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1

" Change window title to filename
set title

" Turn off linenumbers
set nonumber

" Hide ruler
set noruler

" Don't redraw screen as often
set lazyredraw

set nocursorcolumn
set nocursorline

" syntax sync minlines=256
" set synmaxcol=300
" set re=1

" Don’t show the intro message when starting Vim
set shortmess=atIc

" Hide mode indicator
set noshowmode

" scroll when reach 3rd line from the bottom
set scrolloff=3

set background=dark
colorscheme seoul256

" Goyo on/off
nmap <Leader>g :Goyo<Return>

" Limelight on/off
nmap <silent> <Leader>l :Limelight!!<Return>
xmap <silent> <Leader>l :Limelight!!<Return>

" }}}

" Searching {{{

" Highlight search matches
set hlsearch

" Show search results as you type
set incsearch

" Ignore case in searches if query doesn't include capitals
set ignorecase
set smartcase

" }}}

" Mapping {{{

" Unmap space in normal and visual modes
nnoremap <SPACE> <nop>
vnoremap <SPACE> <nop>

" Map ctrl c to escape to fix multiple cursors issue
noremap <C-c> <Esc>

" Map the capital equivalent for easier save/exit
cabbrev Wq wq
cabbrev W w
cabbrev Q q

" Map q to qa to quickly exit when using goyo
" cnoreabbrev q qa

" unmap capital K
nnoremap K <nop>

" Copies what was just pasted
" Allows you to paste the same thing over and over and over and over and over and over
xnoremap p pgvy

" Cylces through splits using a double press of enter in normal mode
nnoremap <CR><CR> <C-w><C-w>

" Unmaps the arrow keys
map <Up> <nop>
map <Down> <nop>
map <Left> <nop>
map <Right> <nop>

" Map ; to :
noremap ; :

" Maps Tab to indent blocks of text in visual mode
vmap <TAB> >gv
vmap <BS> <gv

" use hjkl-movement between rows when soft wrapping:
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" include the default behaviour by doing reverse mappings so you can move linewise with gj and gk:
nnoremap gj j
nnoremap gk k

" Jumps to the bottom of Fold
nmap <Leader>b zo]z
" and up
nmap <Leader>u zo[z

" Easily move to start/end of line
nnoremap H 0
nnoremap L $
vnoremap H 0
vnoremap L $

" za/az toggle folds
" ezpz to spam open/close folds now
nmap az za

nmap <F2> :set number!<CR>

" }}}

" Temp Files {{{

" Fuck swapfiles
set noswapfile

" Set backup/undo dirs
set backupdir=~/.config/nvim/tmp/backups//
set undodir=~/.config/nvim/tmp/undo//

" Make the folders automatically if they don't already exist.
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), 'p')
endif

if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), 'p')
endif

" Persistent Undo, Vim remembers everything even after the file is closed.
set undofile
set undolevels=500
set undoreload=500

" }}}

" Misc {{{

" Disable python 2
" let g:loaded_python_provider = 1
" let g:python_host_skip_check = 1
" let g:python3_host_skip_check = 1

" Use the OS clipboard by default
set clipboard+=unnamedplus

" Enhance command-line completion
set wildmenu
set wildmode=longest,full
set wildignore+=*/.hg/*,*/.git/*,*/.svn/*
set wildignore+=*.gif,*.png,*.jp*
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=*/.sass-cache/*,*.map

" Saner backspacing
set backspace=indent,eol,start

" set esckeys
set showcmd
set autoread
set hidden
set noerrorbells

" Don’t reset cursor to start of line when moving around.
set nostartofline

" scroll the screen before I rech the bottom
set laststatus=2

" Better auto complete
set complete=.,w,b,u,t,i
set completeopt=longest,menu,preview

set nrformats-=octal
set notimeout
set nottimeout

" More natural split opening
set splitbelow
set splitright

" }}}

" Folding {{{

set foldmethod=marker
set foldlevel=99
set foldlevelstart=0
set foldnestmax=10
set nofoldenable

" Only saves folds/cursor pos in mkview
set viewoptions=folds,cursor

set fillchars=fold:-

" }}}

" {{{ Tabs

nnoremap <S-Left> :tabprevious<CR>
nnoremap <S-Right> :tabnext<CR>
nnoremap <silent> <S-A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <S-A-Right> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>

" }}}

" Functions {{{

" Better Buffer Navigation {{{
" Maps <Tab> to cycle though buffers but only if they're modifiable.

function! BetterBufferNav(bcmd)
    if &modifiable == 1 || &filetype ==? 'help'
        execute a:bcmd
    endif
endfunction

" Maps Tab and Shift Tab to cycle through buffers
nmap <silent> <Tab> :call BetterBufferNav("bn") <Cr>
nmap <silent> <S-Tab> :call BetterBufferNav("bp") <Cr>

" }}}

" Fullscreen Help {{{
" Opens Help files as if any other file was opened with "e file"
" also works with completion like regular :help

" This works by opening a blank buffer and setting it's buffer type to 'help'. Now when you run 'help ...' the blank buffer will show the helpfile in fullscreen. The function then adds the buffer to the bufferlist so you can use :bn, :bp, etc.
function FullScreenHelp(helpfile)
    enew
    set buftype=help
    execute 'help ' . a:helpfile
    set buflisted
endfunction

" Open help files the same as you usually do with "help example" and they'll open in a new buffer similar to "e file"
command -nargs=1 -complete=help Help call FullScreenHelp(<f-args>)
cabbrev help Help
cabbrev h Help

" }}}

" Line Return {{{
" Returns you to your position on file reopen and closes all folds.
" On fold open your cursor is on the line you were at on the fold.
augroup line_return
    au!
    autocmd BufReadPost * :call LineReturn()
augroup END

function! LineReturn()
    if line("'\"") > 0 && line("'\"") <= line('$')
        execute 'normal! g`"zvzzzm'
    endif
endfunction

" }}}
