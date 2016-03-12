set nocompatible
"source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

" set the runtime path to include Vundle and initialize
set rtp+=$Home/vimfiles/bundle/Vundle.vim/
call vundle#begin('$Home/vimfiles/bundle/')


" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'

"Color
Plugin 'jnurmine/Zenburn'

" File System
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs' 
" Super Search
Plugin 'kien/ctrlp.vim'

let python_highlight_all=1
syntax on

autocmd FileType python set omnifunc=pythoncomplete#Complet

" PEP 8 
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

" File System Setting
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" Line Number
set nu

" Tepmalte
set background=dark
colorscheme zenburn
let base16colorspace=256

" UTF8
let $LANG="zh_TW.UTF-8"
set langmenu=zh_tw.utf-8
set encoding=utf8

"reload menu with UTF-8 encoding
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

call vundle#end()           
filetype plugin indent on   
"######################

"set font
set guifont=Consolas:h18

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
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
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

