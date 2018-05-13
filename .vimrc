set nocompatible		" required
filetype off			" required

" automatic reloading of vimrc
autocmd! bufwritepost .vimrc source %

" better copy and paste
set pastetoggle=<F2>
set clipboard=unnamed

" better use of mouse
set mouse=a

" setting the mapleader to be a spacebar
map <space> <leader>

" working with tabs
nnoremap <leader>, <esc>:tabprevious<CR>
nnoremap <leader>. <esc>:tabnext<CR>
nnoremap <leader>n <esc>:tabnew<space>
nnoremap <leader>x <esc>:tabclose<CR>

" working with splits and windows


" specify how screens are supposed to be split
set splitbelow
set splitright

" code folding - folds a function/class - with a spacebar
set foldmethod=indent
set foldlevel=99
nnoremap <leader>f za

" Enables line numbering
set nu

" Enable docstring view of folded code
let g:SimplyFold_docstring_preview=1

" Enables better handling of auto-indent
au BufNewFile,BufRead *.py,*.h,*.c
	\ set tabstop=4 |
	\ set softtabstop=4 |
	\ set shiftwidth=4 |
	\ set textwidth=79 |
	\ set expandtab |
	\ set autoindent |
	\ set fileformat=unix |

" defining the Badwhitespace group
highlight BadWhitespace ctermbg=red guibg=red

" Informs us about unnecessary whitespace
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" UTF-8 encoding
set encoding=utf-8

" syntax highlighting - makes it look pretty
let python_highlight_all=1
syntax on


" set runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/home/aditya/.vim/bundle/vimproc.vim/autoload/
set rtp+=/home/aditya/.vim/bundle/vimproc.vim/lib/
set rtp+=/home/aditya/.vim/bundle/vimproc.vim/plugin/
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Shougo/vimshell'
Plugin 'Shougo/vimproc.vim'
" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Colorscheme
set background=dark
colors zenburn



