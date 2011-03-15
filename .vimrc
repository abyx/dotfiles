" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Allow backgrounding buffers without writing them, and remember marks/undo
" for backgrounded buffers
set hidden

" Remember more commands and search history
set history=1000

" Make tab completion for files/buffers act like bash
set wildmenu

" Make searches case-sensitive only if they contain upper-case characters
set ignorecase
set smartcase

" Keep more context when scrolling off the end of a buffer
set scrolloff=3

" Store temporary files in a central spot
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set backup		" keep a backup file
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
  " set guifont=Monaco:h14
  set guifont=Inconsolata-dz:h14
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")


set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set laststatus=2
set showmatch
set incsearch

set textwidth=78

set hls

if has("gui_running")
  " GRB: set font"
  ":set nomacatsui anti enc=utf-8 gfn=Monaco:h12

  " GRB: set window size"
  :set lines=100
  :set columns=171
endif

" GRB: set the color scheme
:set t_Co=256 " 256 colors
:colorscheme grb256

" GRB: hide the toolbar in GUI mode
if has("gui_running")
    set go-=T
end

" GRB: Always source python.vim for Python files
au FileType python source ~/.vim/scripts/python.vim

" GRB: Use custom python.vim syntax file
au! Syntax python source ~/.vim/syntax/python.vim
let python_highlight_all = 1
let python_slow_sync = 1

" GRB: use emacs-style tab completion when selecting files, etc
set wildmode=longest,list

" GRB: Put useful info in status line
:set statusline=%<%f%=\ [%1*%M%*%n%R%H]\ %-19(%3l,%02c%03V%)%O'%02b'
:hi User1 term=inverse,bold cterm=inverse,bold ctermfg=red

" GRB: clear the search buffer when hitting return
:nnoremap <CR> :nohlsearch<CR>/<BS>

let mapleader=","

nnoremap <leader><leader> <c-^>

" highlight current line
set cursorline

set cmdheight=2

" Don't show scroll bars in the GUI
set guioptions-=L
set guioptions-=r

" Use <c-h> for snippets
let g:NERDSnippets_key = '<c-h>'

augroup myfiletypes
  "clear old autocmds in group
  autocmd!
  "for ruby, autoindent with two spaces, always expand tabs
  autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass set ai sw=2 sts=2 et
  autocmd FileType python set sw=4 sts=4 et
augroup END

set switchbuf=useopen

autocmd BufRead,BufNewFile *.feature set sw=4 sts=4 et

set number
set numberwidth=5

" Always show tab bar
set showtabline=2

" Disable arrow keys
:map <Left> <Nop>
:map <Right> <Nop>
:map <Up> <Nop>
:map <Down> <Nop>
:map <PageUp> <Nop>
:map <PageDown> <Nop>
:map <Home> <Nop>
:map <End> <Nop>

:map! <Left> <Nop>
:map! <Right> <Nop>
:map! <Up> <Nop>
:map! <Down> <Nop>
:map! <PageUp> <Nop>
:map! <PageDown> <Nop>
:map! <Home> <Nop>
:map! <End> <Nop>

" Add Vundle for vim plugins
set rtp+=~/.vim/vundle.git/
call vundle#rc()

Bundle "rails.vim"
Bundle "endwise.vim"
Bundle "surround.vim"
Bundle "matchit.zip"
