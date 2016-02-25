set nocompatible
filetype off
let mapleader=" "

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

"ui
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-vinegar'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'flazz/vim-colorschemes'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'nathanaelkane/vim-indent-guides'

"motions
Plugin 'rking/ag.vim'
Plugin 'unblevable/quick-scope'
Plugin 'vasconcelloslf/vim-interestingwords'
Plugin 'wellle/targets.vim'

Plugin 'ap/vim-css-color'
"Plugin 'ludovicchabant/vim-gutentags'
Plugin 'tpope/vim-obsession'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-jdaddy'

Plugin 'tpope/vim-markdown'
Plugin 'junegunn/goyo.vim'
Plugin 'lambdatoast/elm.vim'

" JavaScript-specific 
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'vim-scripts/JavaScript-Indent'
Plugin 'scrooloose/syntastic'
Plugin 'marijnh/tern_for_vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'bigfish/vim-js-context-coloring'

call vundle#end()

set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_confirm_extra_conf = 0
let g:ycm_collect_identifiers_from_comments_and_strings = 1

" airline
set laststatus=2 " Always show the statusline
let g:airline_theme             = 'powerlineish'
let g:airline_left_sep          = ''
let g:airline_left_alt_sep      = ''
let g:airline_right_sep         = ''
let g:airline_right_alt_sep     = ''

let g:airline_detect_paste=1

let g:airline_section_b = ''    " (hunks, branch)
let g:airline_section_x = ''    " (tagbar, filetype, virtualenv)
let g:airline_section_y = ''    " (fileencoding, fileformat)

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_symbols.branch = 'BR'
let g:airline_symbols.readonly = 'RO'
let g:airline_symbols.linenr = ''

let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1

" netrw
let g:netrw_preview = 1

"goyo
nnoremap <Leader>g :Goyo 72<CR>  

"interesting words
nnoremap <silent> <leader>k :call InterestingWords('n')<cr>
nnoremap <silent> <leader>K :call UncolorAllWords()<cr>

nnoremap <silent> n :call WordNavigation('forward')<cr>
nnoremap <silent> N :call WordNavigation('backward')<cr>

let g:interestingWordsGUIColors = ['#8CCBEA', '#A4E57E', '#FFDB72', '#FF7272', '#FFB3FF', '#9999FF']
let g:interestingWordsTermColors = ['154', '121', '211', '137', '214', '222']
let g:interestingWordsRandomiseColors = 1

" UI
set shell=bash
set term=screen-256color
set t_Co=256 " 256 colors
"set t_AB=^[[48;5;%dm
"set t_AF=^[[38;5;%dm
syntax on
set background=dark
colorscheme fruidle256
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
set ruler
set textwidth=79
set formatoptions=cqrnw1
set colorcolumn=+1

" Searching
set incsearch
set hlsearch
set showmatch
set ignorecase " Ignore case when searching
set smartcase " Ignore case when searching lowercase
nnoremap / /\v
vnoremap / /\v
set gdefault
nnoremap <leader><space> :nohlsearch<cr>
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
set breakindentopt=sbr,shift:2

" Mappings ********************************************************************

nnoremap <Leader>v :vsplit<CR>
nnoremap <Leader>s :split<CR>
nnoremap <Leader>c :copen<CR>
nnoremap <Leader>C :cclose<CR>
nnoremap <Leader>8 :set tw=80<CR>
nnoremap <Leader>0 :set tw=0<CR>
nnoremap <Leader>n :set invnumber<CR>
nnoremap <Leader>z :set invpaste<CR>

nnoremap <Leader>, 2<C-w><
nnoremap <Leader>. 2<C-w>>
nnoremap <Leader>- 2<C-w>-
nnoremap <Leader>= 2<C-w>+

" apply macros with Q
nnoremap Q @q
vnoremap Q :norm @q<cr>

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
inoremap <C-L> <Tab>
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

" Functions *******************************************************************
"
let s:editing_text = 0
function! Toggle_text_editing()
    if s:editing_text
        " turn off text editing
        let s:editing_text = 0
        setlocal formatoptions-=ta
        setlocal relativenumber
        setlocal autoindent
        setlocal textwidth=79
        setlocal colorcolumn=80
    else
        " turn on text editing
        let s:editing_text = 1
        setlocal formatoptions+=ta
        setlocal norelativenumber
        setlocal autoindent
        setlocal textwidth=71
        setlocal colorcolumn=72
    endif
    return
endfunction
nnoremap <leader>t :call Toggle_text_editing()<CR>

" Crontab doesn't like the way Vim does backups *******************************
if $VIM_CRONTAB == "true"
    set nobackup
    set nowritebackup
endif

" Filetype-specific ***********************************************************
au BufRead alot.* set ft=mail
au BufRead alot.* call Toggle_text_editing()
au BufRead *.md set ft=markdown ai
au BufRead *.wisp set ft=clojure
au FileType javascript setl ts=2 et sts=2 sw=2
au BufWinLeave *.js mkview
au BufWinEnter *.js silent loadview
au FileType html setl ts=2 et sts=2 sw=2

let g:task_paper_date_format = "%b %d"

" Now process all of the configuration files that I have stored in my 'config'
" directory, which significantly cleans up this file.
" for filename in sort(split(glob('~/.vim/config/*.vim'), '\n'))
"     execute 'source '.filename
" endfor
