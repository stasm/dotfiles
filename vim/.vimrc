set nocompatible
filetype off
let mapleader=" "

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

"ui
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-vinegar'
Plugin 'christoomey/vim-tmux-navigator'

"motions
Plugin 'rking/ag.vim'
Plugin 'rhysd/clever-f.vim'
Plugin 'vasconcelloslf/vim-interestingwords'
Plugin 'wellle/targets.vim'

Plugin 'kana/vim-textobj-user'
Plugin 'whatyouhide/vim-textobj-xmlattr'

Plugin 'ap/vim-css-color'
Plugin 'tpope/vim-obsession'
Plugin 'tomtom/tcomment_vim'

" JavaScript-specific 
Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'mxw/vim-jsx'
Plugin 'vim-scripts/JavaScript-Indent'
Plugin 'scrooloose/syntastic'
Plugin 'moll/vim-node'
Plugin 'marijnh/tern_for_vim'
Plugin 'Valloric/YouCompleteMe'

call vundle#end()

set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_confirm_extra_conf = 0
let g:ycm_collect_identifiers_from_comments_and_strings = 1

" netrw
let g:netrw_preview = 1

"interesting words
nnoremap <silent> <leader>k :call InterestingWords('n')<cr>
nnoremap <silent> <leader>K :call UncolorAllWords()<cr>

nnoremap <silent> n :call WordNavigation('forward')<cr>
nnoremap <silent> N :call WordNavigation('backward')<cr>

let g:interestingWordsGUIColors = ['#8CCBEA', '#A4E57E', '#FFDB72', '#FF7272', '#FFB3FF', '#9999FF']
let g:interestingWordsTermColors = ['219', '81', '121', '154', '211', '214']
let g:interestingWordsRandomiseColors = 1

" UI
set shell=bash
set term=screen-256color
set t_Co=256 " 256 colors
"set t_AB=^[[48;5;%dm
"set t_AF=^[[38;5;%dm
syntax on
set background=light
colorscheme soda
highlight clear SignColumn

if has("gui_running")
    set guifont=Inconsolata\ 10
    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar
    "set fuoptions=background:Normal
endif

set numberwidth=3
set hidden
set splitbelow splitright
set cursorline
set showcmd
set laststatus=2
set ruler
set textwidth=79
set autoindent
set formatoptions=crnwq1
set colorcolumn=0
set fdm=marker

" Searching
set incsearch
set hlsearch
set showmatch
set ignorecase " Ignore case when searching
set smartcase " Ignore case when searching lowercase
nnoremap / /\v
vnoremap / /\v
set gdefault
nnoremap <leader>l :nohlsearch<cr>
nnoremap <tab> %
vnoremap <tab> %
nmap & :Ag <c-r>=expand("<cword>")<cr><cr>


" Invisible characters
set listchars=trail:⋅,tab:▸\ ,eol:¬
set nolist
noremap <leader>i :set list!<CR>
" Toggle invisible chars

" Coding style
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set nosmartindent
set breakindent
set showbreak=↪\ 
set cpoptions+=n
set breakindentopt=min:20,sbr,shift:0
set autoread

" Mappings ********************************************************************

nnoremap <Leader>8 :set colorcolumn=+1<CR>
nnoremap <Leader>0 :set colorcolumn=0<CR>
nnoremap <Leader>n :set invnumber<CR>
nnoremap <Leader>p :set invpaste<CR>
nnoremap <leader><space> za

" moving around
" map <C-H> <C-w>h at al. are set by vim-tmux-navigator
nnoremap j gj
nnoremap k gk

" buffer management
map <C-P> :CtrlP<CR>
map <C-E> :CtrlPBuffer<CR>

nnoremap <S-H> :bp<CR>
nnoremap <S-L> :bn<CR>

" don't open help
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" autocomplete
"set omnifunc=youcompleteme#OmniComplete
"imap <Tab> <C-P>

imap jj <Esc>

" select lines that were just pasted
nnoremap <leader><TAB> V`]

" replace selected text with buffer
vmap r "_dP


" Directories *****************************************************************
" Setup backup location and enable
set backupdir=~/.vim/runtime/bkp
set backup
set undodir=~/.vim/runtime/undo
set undofile

" Set Swap directory
set directory=~/.vim/runtime/swap

" Set view directory
set viewdir=~/.vim/runtime/views

" Misc ************************************************************************
set backspace=indent,eol,start
set matchpairs+=<:>
set clipboard+=unnamed

" Crontab doesn't like the way Vim does backups *******************************
if $VIM_CRONTAB == "true"
    set nobackup
    set nowritebackup
endif

" Filetype-specific ***********************************************************
au BufRead *.md set ft=markdown ai
au BufRead *.wisp set ft=clojure
au FileType javascript setl ts=2 et sts=2 sw=2 commentstring=\/\/\ %s
au BufWinLeave *.js mkview
au BufWinEnter *.js silent loadview
au FileType html setl ts=2 et sts=2 sw=2
