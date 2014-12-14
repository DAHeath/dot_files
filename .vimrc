command E Explore

function! HoogleInfo()
  let word = expand("<cword>")
  let command = "/home/david/.cabal/bin/hoogle --info " . string(word)
  echo system(command)
endfunction

command! HoogleInfo call HoogleInfo()
nmap <leader>i :call HoogleInfo()<CR>

function! Hoogle(search)
  let command = "/home/david/.cabal/bin/hoogle --count=10 \"" . a:search . "\""
  echo command
  echo system(command)
endfunction

command! -nargs=* Hoogle call Hoogle(<args>)


set nocompatible
set ruler        "show the cursor position all the time
set laststatus=2 "display status bar
set colorcolumn=80

nmap <Space> i_<Esc>r

"v set up Vundle and plugins
"ensure Vundle is loaded
let vundleLoaded = 0
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
  echo "Installing Vundle"
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
  let vundleLoaded = 1
endif
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
"end ensure Vundle is loaded

Bundle 'gmarik/vundle'
Bundle 'wellle/targets.vim'
Bundle 'scrooloose/syntastic'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-dispatch'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-vinegar'
Bundle 'Raimondi/delimitMate'
Bundle 'altercation/vim-colors-solarized'
Bundle 'vim-scripts/HTML-AutoCloseTag'
Bundle 'chreekat/vim-paren-crosshairs'
Bundle 'airblade/vim-gitgutter'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
Bundle 'derekwyatt/vim-scala'
Bundle 'kchmck/vim-coffee-script'
Bundle 'plasticboy/vim-markdown'
Bundle 'idris-hackers/idris-vim'
Bundle 'digitaltoad/vim-jade'

if vundleLoaded
  echo "Installing Bundles, ingore key-map error messages"
  echo ""
  :BundleInstall
endif
"" end set up Vundle and plugins

"UltiSnips config"
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
let g:UltiSnipsEditSplit = "vertical"
set runtimepath+=~/.vim/UltiSnips
"end UltiSnips config"
"
filetype plugin indent on

set showcmd                             " display incomplete commands
set incsearch                           " do incremental searching
set number                              " list numbers
set omnifunc=syntaxcomplete#Complete    " enable syntax completion
set backspace=start,eol,indent          " regular backspace behavior
set autoindent
set mouse=a
set wildmenu
set history=20

"tab formatting
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
"end tab formatting

"coloring
set term=screen-256color
set t_Co=16
syntax on
colorscheme solarized
"end coloring

"CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
"end CtrlP

"leaders
let mapleader = ","
let maplocalleader = "="
"end leaders

"F-keys
nnoremap <F3> :set relativenumber! <CR>
nnoremap <F7> :NERDTreeToggle<CR>
"end F-keys

"navigate windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
"end navigate windows

"quick access/save vimrc
nnoremap <leader>ev :vsp $MYVIMRC<cr> 
nnoremap <leader>sv :source $MYVIMRC<cr>
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif
"end quick access/save vimrc

"unmap arrow keys
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
"end unmap arrow keys

"fast tab switching
nnoremap <leader>h :tabp<cr>
nnoremap <leader>l :tabn<cr>
"end fast tab switching

"previous search result
nnoremap <leader>; ,
"end previous search result

"toggle invisibles
"set list listchars=tab:»·,trail:·,eol:¬
set list listchars=tab:»·,trail:·
highlight SpecialKey ctermbg=NONE ctermfg=14 term=NONE cterm=NONE
highlight NonText ctermfg=14 term=NONE cterm=NONE
"end toggle invisibles

"Allow <C-p>,<C-n> to filter history
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
"end Allow <C-p>,<C-n> to filter history

"buffer navigation
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>
"end buffer navigation

nnoremap <leader>f :set hlsearch!<CR>

if has("autocmd")
  autocmd BufRead,BufNewFile *.coffee set ft=coffee
  autocmd FileType litcoffee runtime ftplugin/coffee.vim
  autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
  autocmd FileType scala UltiSnipsAddFiletypes scala
endif
