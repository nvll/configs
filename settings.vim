" text config. 100 col lines, 4 spaces instead of tabs
set encoding=utf-8
set ts=4
set sts=4
set sw=4
set tw=100
set expandtab
set nocompatible
set backspace=2
set textwidth=100
set autoindent
set number
set linebreak
set ruler
set hlsearch " highlight searches
set hidden " allow buffer switching without saving
set mouse=a
set splitright
set splitbelow
set laststatus=2
set ttymouse=sgr
set wig+=build-*
set wig+=.git
set wig+=*.o
set wig+=*.d
set wig+=*~
set wig+=cscope.out
set wig+=tags

let $backupdir=$HOME . "/.vim/cache/backup/"
let $swapdir=$HOME . "/.vim/cache/swap/"
" Some systems may not have the directories ready so create them
func! MkVimDirs()
    if !isdirectory($backupdir)
        call mkdir($backupdir, "p", 0700)
    endif
    if !isdirectory($swapdir)
        call mkdir($swapdir, "p", 0700)
    endif
endfunction

au VimEnter * call MkVimDirs()

" Keep backup files, but store them in ~/.vim/cache
set backupdir=$backupdir
set directory=$swapdir
set backupcopy=auto
set writebackup
set backup

" Gui config
set guifont=DejaVu\ Sans\ Mono\ 8
set guioptions-=m " remove menubar
set guioptions-=T " remove toolbar
set guioptions-=r " remove right scrollbar
set guioptions-=R " remove right scrollbar
set guioptions-=l " remove left scrollbar
set guioptions-=L " remove left scrollbar
set guioptions+=c " console dialog options

" Colors / syntax
"let g:seoul256_background = 234
colo nord
set background=dark
filetype plugin indent on
syntax on

" Change the background color after 100 columns
let &colorcolumn=join(range(101,256),",")

if $FUCHSIA_DIR != ""
  source $FUCHSIA_DIR/scripts/vim/fuchsia.vim
endif
filetype plugin indent on
