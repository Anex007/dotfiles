"  _   _         __     ___
" | \ | | ___  __\ \   / (_)_ __ ___
" |  \| |/ _ \/ _ \ \ / /| | '_ ` _ \
" | |\  |  __/ (_) \ V / | | | | | | |
" |_| \_|\___|\___/ \_/  |_|_| |_| |_|
" My Neovim config
" Look up: https://github.com/xolox/vim-notes

set nocompatible
filetype off
"filetype plugin on
syntax on
set exrc
set nopaste
set showcmd
set shell=/bin/zsh
set nowrap
set wildmode=longest,list

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o " Annoying ass comment added after new line.
set splitbelow splitright

"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
" For neovim
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')

" ==== plugin manager
Plugin 'VundleVim/Vundle.vim'

" ==== File tree
Plugin 'scrooloose/nerdtree'

" ==== Git
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

" ==== syntax helpers
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
"Plugin 'cakebaker/scss-syntax.vim' CSS stuff
"Plugin 'othree/yajs.vim' yet another javascript syntax
"Plugin 'mitsuhiko/vim-jinja' HTML stuff

" Language Support
Plugin 'rust-lang/rust.vim'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'sheerun/vim-polyglot'
" Tags for c++ and others
Plugin 'majutsushi/tagbar'

" ==== moving / searching
Plugin 'easymotion/vim-easymotion'
Plugin 'ctrlpvim/ctrlp.vim'

" ==== snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" Status bar on bottom
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" ==== PLUGIN THEMES
"Plugin 'morhetz/gruvbox'
Plugin 'flazz/vim-colorschemes'
Plugin 'luochen1990/rainbow'
Plugin 'dylanaraps/wal.vim'
"Plugin 'Badacadabra/vim-archery' i find them boring for now.

" Sessions
Plugin 'xolox/vim-session'
Plugin 'xolox/vim-misc'

" Utils
Plugin 'vim-utils/vim-man'
" Devicons
Plugin 'ryanoasis/vim-devicons'

" LATEX
" Plugin 'xuhdev/vim-latex-live-preview'

" Cool stuff to drag visual block accross the screeen
Plugin 'shinokada/dragvisuals.vim'
Plugin 'godlygeek/tabular'	" Tabs certain stuff based on patterns `Tabular \=`

call vundle#end()
filetype plugin indent on
filetype on

" ==== Colors and other basic settings
colorscheme monokain	" Perfect with AirlineTheme jellybeans
" colorscheme codedark	" Perfect with AirlineTheme violet
" colorscheme PaperColor	" Perfect with AirlineTheme badwolf
"set guifont=Ubuntu\ Mono\ 11
"set guifont=Space\ Mono\ for\ Powerline\ 10
set fillchars+=vert:\|
syntax enable
set background=dark
set ruler
set hidden
set number
set laststatus=2
set smartindent
"set st=4 sw=4 et
set shiftwidth=4
set tabstop=4
let &colorcolumn="80"
set t_Co=256
":set guioptions-=m  "remove menu bar
":set guioptions-=T  "remove toolbar
":set guioptions-=r  "remove right-hand scroll bar
":set guioptions-=L  "remove left-hand scroll bar
":set lines=99 columns=300
set cursorline
set relativenumber
set tags+=~/.config/nvim/systags

" ==== NERDTREE
let NERDTreeIgnore = ['__pycache__', '\.pyc$', '\.o$', '\.so$', '\.a$', '\.swp', '*\.swp', '\.swo', '\.swn', '\.swh', '\.swm', '\.swl', '\.swk', '\.sw*$', '[a-zA-Z]*egg[a-zA-Z]*', '.DS_Store']

let NERDTreeShowHidden=1
let g:NERDTreeWinPos="left"
let g:NERDTreeDirArrows=0
let NERDTreeQuitOnOpen=0
map <C-t> :NERDTreeToggle<CR>

" ==== Tagbar
nnoremap <C-c> :TagbarToggle<CR>

" ==== Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_mri_args = "--config=$HOME/.jshintrc"
let g:syntastic_python_checkers = [ 'pylint', 'flake8', 'pep8', 'pyflakes', 'python']
let g:syntastic_yaml_checkers = ['jsyaml']
let g:syntastic_html_tidy_exec = 'tidy5'
" This check was becoming more annoying so i added these 2 lines :P
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>

" === flake8
let g:flake8_show_in_file=1

" === Airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_detect_modified=1
" Set the theme for airline
let g:airline_theme='jellybeans'

" === UltiSnips
" let g:UltiSnipsSnippetDirectories=['/home/ezio/.config/nvim/UltiSnips/']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" === Session
let g:session_autosave = 'no'
let g:session_autoload = 'yes'
nnoremap <leader>S :SaveSession<CR>

" === Rainbow
let g:rainbow_active = 1

" ==== Easymotion
let g:EasyMotion_do_mapping = 1
let g:EasyMotion_smartcase = 1
nmap <Leader>w <Plug>(easymotion-w)
nmap <Leader>W <Plug>(easymotion-W)
nmap <Leader>b <Plug>(easymotion-b)
nmap <Leader>B <Plug>(easymotion-B)
nmap <Leader>e <Plug>(easymotion-e)
nmap <Leader>E <Plug>(easymotion-E)
"nmap <Leader>j <Plug>(easymotion-j)
"nmap <Leader>k <Plug>(easymotion-k)
nmap <Leader>s <Plug>(easymotion-sn)

" dragvisuals.vim
vmap  <expr>  <LEFT>   DVB_Drag('left')
vmap  <expr>  <RIGHT>  DVB_Drag('right')
vmap  <expr>  <DOWN>   DVB_Drag('down')
vmap  <expr>  <UP>     DVB_Drag('up')
vmap  <expr>  D        DVB_Duplicate()

"My mappings
nnoremap <leader>ev <esc>:tabe $MYVIMRC<cr>
nnoremap <leader>qv <esc>:w<cr>:source $MYVIMRC<cr>
inoremap <C-s> <esc>:w<CR>
nnoremap <C-s> :w<CR>
nnoremap + <C-w>+
nnoremap - <C-w>-
nnoremap > <C-w>>
nnoremap < <C-w><
nnoremap <leader>> >>
nnoremap <leader>< <<
nnoremap <Right> <C-w>l
nnoremap <Left> <C-w>h
nnoremap <Up> <C-w>k
nnoremap <Down> <C-w>j
inoremap <Right> <esc><C-w>li
inoremap <Left> <esc><C-w>hi
inoremap <Up> <esc><C-w>ki
inoremap <Down> <esc><C-w>ji
nnoremap <leader>o o<ESC>k
nnoremap <leader>O O<ESC>j
nnoremap ; :
" autocomplete with shift+tab
" Check out :help ins-completion
" TODO: Add C-] for jumping to definition of ctags and C-o for jumping back
" Jump to definition
nnoremap <C-d>	<C-]>
inoremap <S-Tab> <C-n>
nnoremap <S-Tab> <C-o>
inoremap <C-t> <C-x><C-]>
nnoremap <C-f> <C-x><C-f>
nnoremap <C-f> :!ctags -R .<CR><CR>
tnoremap <Esc> <C-\><C-n>


" Open Man with word under cursor in horizontal split
map <leader>z <Plug>(Man)
" Open Man with word under cursor in vertival split
map <leader>v <Plug>(Vman)

autocmd BufWrite * call RemoveTrailigWhitespace()

function! RemoveTrailigWhitespace()
	normal! mm
	%s/\s\+$//eg
	normal! 'm
endfunction

" ==== disable swap file warning
set shortmess+=A

set secure
