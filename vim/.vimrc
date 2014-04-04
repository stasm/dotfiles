set nocompatible
filetype off
set shell=bash
let mapleader=" "

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'Lokaltog/vim-powerline'
Bundle 'ap/vim-css-color'
Bundle 'scrooloose/nerdtree'
Bundle 'flazz/vim-colorschemes'
Bundle 'CSApprox'
Bundle 'christoomey/vim-tmux-navigator'
Bundle 'justinmk/vim-sneak'

" JavaScript-specific 
Bundle 'jelera/vim-javascript-syntax'
Bundle 'pangloss/vim-javascript'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'vim-scripts/JavaScript-Indent'
Bundle 'scrooloose/syntastic'
Bundle 'marijnh/tern_for_vim'
Bundle 'Valloric/YouCompleteMe'

set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_confirm_extra_conf = 0
let g:ycm_collect_identifiers_from_comments_and_strings = 1

" UI
set term=screen-256color
set t_Co=256 " 256 colors
"set t_AB=^[[48;5;%dm
"set t_AF=^[[38;5;%dm
syntax on
set background=dark
colorscheme fruidle256
set laststatus=2 " Always show the statusline
if has("gui_running")
    set guifont=Inconsolata\ 10
    set go-=T
    set go-=r
    set go-=rlRL
    "set fuoptions=background:Normal
    colorscheme wombat
endif

set hidden
set relativenumber
au BufEnter * :set relativenumber
au BufLeave * :set number
au WinEnter * :set relativenumber
au WinLeave * :set number
au InsertEnter * :set number
au InsertLeave * :set relativenumber
au FocusLost * :set number
au FocusGained * :set relativenumber
set splitbelow splitright
set cursorline
set showcmd
set ruler
set textwidth=79
set formatoptions=cqrnw1
set colorcolumn=+1
" Highlight text in 75th-79th columns and after 79th column in Python
au BufWinEnter *.py let w:m1=matchadd('Search', '\%<80v.\%>75v', -1)
au BufWinEnter *.py let w:m2=matchadd('ErrorMsg', '\%>79v.\+', -1)
"au BufWinEnter *.js let w:m2=matchadd('Search', '\%>79v.\+', -1)

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


" Invisible characters
if has("gui_running")
    set listchars=trail:⋅,tab:▸\ ,eol:¬
else
    set listchars=trail:.,tab:>-,eol:$
endif
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

" Mappings ********************************************************************

nnoremap <Leader>q :q<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>v :vsplit<CR>
nnoremap <Leader>s :split<CR>
nnoremap <Leader>p :CtrlP<CR>
nnoremap <Leader>g :vimgrep
nnoremap <Leader>c :copen<CR>
nnoremap <Leader>C :cclose<CR>
nnoremap <Leader>8 :set tw=80<CR>
nnoremap <Leader>0 :set tw=0<CR>
nnoremap <Leader>n :set invnumber<CR>
nnoremap <Leader>h :bp<CR>
nnoremap <Leader>l :bn<CR>

nnoremap <Leader>, 2<C-w><
nnoremap <Leader>. 2<C-w>>
nnoremap <Leader>- 2<C-w>-
nnoremap <Leader>= 2<C-w>+
 
" easier commands
nnoremap ; :

" moving around
" map <C-H> <C-w>h at al. are set by vim-tmux-navigator
nnoremap j gj
nnoremap k gk

" buffer management
map <F8> :bn<CR>
map <C-E> :CommandT<CR>
map <C-F> :CommandTBuffer<CR>
map <C-A> :NERDTreeToggle<CR>

" don't open help
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" autocomplete
"set omnifunc=youcompleteme#OmniComplete
inoremap <C-L> <Tab>
"imap <Tab> <C-P>

imap jj <Esc>
map <F6>  :w<CR>

" Highlight text after 79th column
nnoremap <F10> :match ErrorMsg '\%>79v.\+'<CR>

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
        if has("gui_running")
            colorscheme wombat
        else
            colorscheme wombat256
        endif
    else
        " turn on text editing
        let s:editing_text = 1
        setlocal formatoptions+=ta
        setlocal norelativenumber
        setlocal textwidth=71
        setlocal colorcolumn=72
        if has("gui_running")
            colorscheme fruidle
        else
            colorscheme fruidle256
        endif
    endif
    return
endfunction
nnoremap <leader>t :call Toggle_text_editing()<CR>

let s:dark_theme = 1
function! Toggle_theme()
    if s:dark_theme
        let s:dark_theme = 0
        colorscheme fruidle256
    else
        let s:dark_theme = 1
        colorscheme wombat
    endif
    return
endfunction
nnoremap <leader>] :call Toggle_theme()<CR>

" Crontab doesn't like the way Vim does backups *******************************
if $VIM_CRONTAB == "true"
    set nobackup
    set nowritebackup
endif

" Filetype-specific ***********************************************************
au BufRead alot.* set ft=mail
au BufRead alot.* call Toggle_text_editing()
au BufRead *.md set ft=markdown ai
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
