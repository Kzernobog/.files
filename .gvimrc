set nocompatible		" required
filetype off			" required

" automatic reloading of vimrc
" autocmd VimEnter * NERDTree
autocmd! bufwritepost .gvimrc source %

" no error bells
set vb t_vb=

" better copy and paste
set pastetoggle=<F2>
set clipboard=unnamed

set backspace=indent,eol,start

let g:kite_auto_complete=1
let g:kite_tab_complete=1

" better use of mouse
" set mouse=a

" setting the mapleader to be a spacebar
map <space> <leader>

" quicksave
nnoremap <leader>s <esc>:update<CR>

" vim todo custom mapping
let g:VimTodoListsCustomKeyMapper = 'VimTodoListsCustomMappings'
function! VimTodoListsCustomMappings()
	nnoremap <buffer> t : VimTodoListsToggleItem<CR>
	nnoremap <buffer> O : VimTodoListsCreateNewItemBelow<CR>
	nnoremap <buffer> o : VimTodoListsCreateNewItemAbove<CR>
	inoremap <buffer> <CR> <Esc>: VimTodoListsCreateNewItemBelow<CR>
	nnoremap <buffer> <Tab> : VimTodoListsIncreaseIndent<CR>
	nnoremap <buffer> <S-Tab> : VimTodoListsDecreaseIndent<CR>
	inoremap <buffer> <Tab> <Esc>: VimTodoListsIncreaseIndent<CR>A
	inoremap <buffer> <S-Tab> <Esc> VimTodoListsDecreaseIndent<CR>A
endfunction
let g:VimTodoListsMoveItems = 0
let g:VimTodoListsDatesEnabled = 1


" working with tabs
nnoremap <leader>, <esc>:tabprevious<CR>
nnoremap <leader>. <esc>:tabnext<CR>
nnoremap <leader>nt <esc>:tabnew<space>
nnoremap <leader>x <esc>:tabclose<CR>

" working with buffers
" nnoremap <Tab> :bnext<CR>
" nnoremap <S-Tab> :bprevious<CR>

" working with splits and windows
map <leader>h <c-w>h
map <leader>j <c-w>j
map <leader>k <c-w>k
map <leader>l <c-w>l
nnoremap <leader>v <esc>:vs<space>
nnoremap <leader>sp <esc>:sp<space> 

inoremap { {}<Esc>ha
inoremap ( ()<Esc>ha
inoremap [ []<Esc>ha
inoremap " ""<Esc>ha
inoremap ' ''<Esc>ha
inoremap ` ``<Esc>ha

" specify how screens are supposed to be split
set splitbelow
set splitright

" code folding - folds a function/class - with a spacebar
set foldmethod=indent
set foldlevel=99
nnoremap <leader>f za

set guifont=Source\ Code\ Pro\ for\ Powerline:h13

" Enables line numbering
set relativenumber
set number

" Enable docstring view of folded code
let g:SimplyFold_docstring_preview=1

" Enables better handling of auto-indent
au BufNewFile,BufRead *.py,*.h,*.c,*.cpp
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

" semantic completion for c family languages
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:nerdtree_tabs_open_on_gui_startup=0
" set runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/vimproc.vim/autoload/
set rtp+=~/.vim/bundle/vimproc.vim/lib/
set rtp+=~/.vim/bundle/vimproc.vim/plugin/
set rtp+=~/.vim/bundle/vim-snippets
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'tpope/vim-fugitive'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'gmarik/Vundle.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'aserebryakov/vim-todo-lists'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'Shougo/vimshell'
Plugin 'Shougo/vimproc.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'flazz/vim-colorschemes' " colorscheme
" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Colorscheme
set background=dark
colors gruvbox 
"colors onedark
"colors anderson
"colors iceberg
"
" ultisnips related mappings
let g:UltiSnipsExpandTrigger="<c-a>"
let g:UltiSnipsListSnippets="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=["UltiSnips"]
let g:ultisnips_python_style = "google"


" Indentation coloring related variables
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size=1
let g:indent_guides_start_level=2

" powerline status
set laststatus=2

" airline
let g:airline_theme='deus'
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
set t_Co=256

" control p
let g:ctrlp_show_hidden = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" debuggin related shortcuts
" insert break point for ipdb
map <leader>b Opdb.set_trace() # BREAKPOINT<C-c> 
" insert debugging print statement
map <leader>print Oprint(colored("DEBUG/ {}".format(), 'cyan'))<C-c>

" YouCompleMe shortcuts
nnoremap <leader>def <esc>:YcmCompleter GoToDefinition<CR>
nnoremap <leader>dec <esc>:YcmCompleter GoToDeclaration<CR>
nnoremap <leader>d <esc>:YcmCompleter GoTo<CR> 

" NerdTree shortcuts
nnoremap <F6> <esc>:NERDTreeToggle<CR>

" terminal shortcuts
nnoremap <F5> <esc>:terminal++rows=10<CR> 
nnoremap <leader>gs <esc>:vertical terminal ++open git status<CR> 
nnoremap <leader>size <esc>:resize 10<CR>
tnoremap <F5> <C-W>N
