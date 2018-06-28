"Installed plugins:
" Ag: search string in all file projects
" CtrlP: fuzzy finder
" vim-commentary
" NERDTree: show tree structure
" Install ctags for searching tags in projects


set nocompatible

set encoding=utf-8
set fileencoding=utf-8
set number
syntax on
set path+=**
set hidden              " allows you to re-use the same window and switch from an unsaved buffer without saving it first
set diffopt+=vertical    " Always use vertical diffs

"set colorcolumn=80      " Marker at 80 char

"""""""STYLING"""""""
colorscheme codedark
set guifont=Consolas:h16

" Set tabs to 2 spaces
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=4

set showcmd             " Show command 
set cursorline          " highlight cursorline
filetype indent on      " load filetype-specific indent files
filetype plugin on      " load filetype-specific plugin files
set mouse=a             " Use mouse
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]

let mapleader=","       " leader is comma
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set ignorecase          " Use case insensitive search, except when using capital letters
set smartcase
"use ,h to toggle searched result:
map <leader>h :set hlsearch!<cr>    

"relative numbers map
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

map <leader>r :call NumberToggle()<cr>

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" escape:
" jk is escape
inoremap jk <esc>

" toggle gundo: ,u diverso da undo
"nnoremap <leader>u :GundoToggle<CR>


" Start full screen:
if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window (for an alternative on Windows, see simalt below).
  set lines=999 columns=999
else
  " This is console Vim.
  if exists("+lines")
    set lines=50
  endif
  if exists("+columns")
    set columns=100
  endif
endif

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



" FILE BROWSING:

" Tweaks for browsing
"nmap <C-n> :VExplore <CR>
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_winsize=25      " size of the tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END

nmap <C-n> :NERDTreeToggle %<CR>

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>


"CtrlP Settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_max_files = 0
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|\.hg$\|\.svn$\|bower_components$\|dist$\|node_modules$\|project_files$\|test$',
    \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }
"let g:ctrlp_custom_ignore = {
"  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
"  \ 'file': '\v\.(exe|so|dll)$',
"  \ 'link': 'some_bad_symbolic_links',
"  \ }

"Ag
let g:ag_prg="ag --vimgrep"
let g:ag_working_path_mode="r"


"!ctags
command! MakeTags !C:\Users\giovanni.fontana\gVimPortable\App\vim\ctags58\ctags -R .

"SNIPPETS
source $VIM/../../Data/settings/snippets/yii.vim
