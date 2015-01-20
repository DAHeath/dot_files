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
Bundle 'honza/vim-snippets'
Bundle 'derekwyatt/vim-scala'
Bundle 'kchmck/vim-coffee-script'
Bundle 'plasticboy/vim-markdown'
Bundle 'idris-hackers/idris-vim'
Bundle 'digitaltoad/vim-jade'
Bundle 'christoomey/vim-tmux-navigator'

if vundleLoaded
  echo "Installing Bundles, ingore key-map error messages"
  echo ""
  :BundleInstall
endif
"" end set up Vundle and plugins

command E Explore

let mapleader = ","                     " leader keys
let maplocalleader = "="                "

filetype plugin indent on               " indentation based on the filetype
set autoindent                          " indents copy previous line
set showcmd                             " display incomplete commands
set incsearch                           " do incremental searching
set number                              " list numbers
set omnifunc=syntaxcomplete#Complete    " enable syntax completion
set backspace=start,eol,indent          " regular backspace behavior
set mouse=a
set wildmenu                            " command line completion
set history=20                          " number of history entries

set tabstop=2                           " tab formatting
set shiftwidth=2
set softtabstop=2
set expandtab

syntax on                               " coloring
set t_Co=256
set term=screen-256color
colorscheme solarized
set background=dark

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

nnoremap <F3> :set relativenumber! <CR>
nnoremap <F7> :NERDTreeToggle<CR>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

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

nnoremap <silent> ,L :vertical resize +5<cr>
nnoremap <silent> ,H :vertical resize -5<cr>
nnoremap <silent> ,J :resize +5<cr>
nnoremap <silent> ,K :resize -5<cr>

"previous search result
nnoremap <leader>; ,
"end previous search result

"toggle invisibles
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
