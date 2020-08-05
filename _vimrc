set nocompatible

" Vim with all enhancements
source $VIMRUNTIME/vimrc_example.vim

" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction
set guifont=Fixedsys:h11
set number
set nocompatible
syntax enable
filetype plugin indent on
set path+=**
set wildmenu
set relativenumber
set smartindent
set tabstop=4
set shiftwidth=4
"set expandwidth
set belloff=all
colo koehler
au GUIEnter * simalt ~x

imap jj <Esc>
set noswapfile

set hidden
set ignorecase
set smartcase
set incsearch
set hlsearch
set nobackup
set pastetoggle=<F2>
"map <up> <nop>
"map <down> <nop>
"map <left> <nop>
"map <right> <nop>
set encoding=utf-8
set linebreak
set scrolloff=1
set wrap
set title
set nofoldenable
set history=1000
set noundofile
set bg=dark
set ttyfast
set lazyredraw
inoremap {<CR> {<CR>}<Esc>ko
inoremap [<CR> [<CR>]<Esc>ko<tab>
inoremap (<CR> (<CR>)<Esc>ko<tab>

colo moria

call plug#begin('C:\Program Files (x86)\Vim\vimfiles\plugged')

Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'preservim/nerdcommenter'


call plug#end()
