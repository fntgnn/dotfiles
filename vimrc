colorscheme candyman 
"Vundle setup:
set nocompatible              " be iMproved, required
filetype off                  " required

set hid     "optimize switching between buffers

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" === insert your plugins here ===
Plugin 'flazz/vim-colorschemes'
Plugin 'sjl/gundo.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'
Plugin 'plasticboy/vim-markdown'
Plugin 'quramy/tsuquyomi'

Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'leafgarland/typescript-vim'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-fugitive'
" ================================


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


syntax enable		"enable syntax processing
set tabstop=4
set expandtab		"tabs into spaces
set number
set showcmd
set cursorline      "highlight cursor line
filetype indent on  "load filetype specific indent files
set wildmenu
set lazyredraw      "redraw only when we need to
set showmatch

" SEARCH:
set incsearch       "search as character are entered
set hlsearch        "highlight matches
"leader space remove the highlited search items:
nnoremap <leader><space> :nohlsearch<CR>    

" FOLDING:
set foldenable      "enable folding
set foldlevelstart=10   "open most folds by default
set foldnestmax=10      " 10 nested fold max
" space open/closes folds:
nnoremap <space> za     
set foldmethod=indent   " fold based on indent level

" MOVING:
" move vertically by visual line
nnoremap j gj
nnoremap k gk

" highlight last inserted text
nnoremap gV `[v`]

" LEADER:
let mapleader=","       " leader is comma
" escape:
" jk is escape
"inoremap jk <esc>

" toggle gundo: ,u diverso da undo
nnoremap <leader>u :GundoToggle<CR>

"vim-airline
let g:airline#extensions#tabline#enabled = 1 "enable the tabline
let g:airline#extensions#tabline#fnamemod = ':t' " show just the filename of buffers in the tab line
let g:airline_detect_modified=1
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1


" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0

"Nerdtree
map <C-n> :NERDTreeToggle %<CR>
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'


" Quick Buffer switch mappings {{{
" The idea is to press <leader> and then the number from normal mode to switch
" e.g. `,2` would switch to the second buffer (listed at the top of the
" airline strip

":nnoremap <silent> <Leader> :<C-u>try \| execute "b" . v:count \| catch \| endtry<CR>
for i in range(1, 99)
    execute printf('nnoremap <Leader>%d :%db<CR>', i, i)
endfor
for i in range(1, 99)
    execute printf('nnoremap <Leader>d%d :Bdelete %d<CR>', i, i)
endfor
" }}}
map <leader>q :bp<cr>
map <leader>w :bn<cr>

" Allow mouse scrolling in iTerm2 {{{
set mouse=a
" }}}

"relative numbers map
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

map <leader>r :call NumberToggle()<cr>
" TsuImport
map <leader>i :TsuImport<cr>

" Emmet
"let g:user_emmet_leader_key=','
"map <leader>e :call emmet#expandAbbr(0,"")

"search:
map <leader>h :set hlsearch!<cr>

"set guifont=Hack-Regular
let g:airline_powerline_fonts = 1
