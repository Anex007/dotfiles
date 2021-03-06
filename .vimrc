set nocompatible  
"filetype off
filetype plugin on
syntax on
set exrc
set showcmd
set shell=/bin/zsh
set nowrap

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o " Annoying ass comment added after new line.
set splitbelow splitright

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

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
Plugin 'octol/vim-cpp-enhanced-highlight'
"Plugin 'ap/vim-css-co300 CSS stuff
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'sheerun/vim-polyglot'

" ==== moving / searching
Plugin 'easymotion/vim-easymotion'
Plugin 'kien/ctrlp.vim'

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
"Plugin 'Badacadabra/vim-archery' i find them boring for now.

" Sessions
Plugin 'xolox/vim-session'
Plugin 'xolox/vim-misc'

" LATEX
Plugin 'xuhdev/vim-latex-live-preview'

call vundle#end()
filetype plugin indent on

" ==== Colors and other basic settings
colorscheme gruvbox
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
set st=4 sw=4 et
set shiftwidth=4
set tabstop=4
let &colorcolumn="80"
set t_Co=256
":set guioptions-=m  "remove menu bar
":set guioptions-=T  "remove toolbar
":set guioptions-=r  "remove right-hand scroll bar
":set guioptions-=L  "remove left-hand scroll bar
":set lines=99 columns=300
set relativenumber

" ==== NERDTREE
let NERDTreeIgnore = ['__pycache__', '\.pyc$', '\.o$', '\.so$', '\.a$', '\.swp', '*\.swp', '\.swo', '\.swn', '\.swh', '\.swm', '\.swl', '\.swk', '\.sw*$', '[a-zA-Z]*egg[a-zA-Z]*', '.DS_Store']

let NERDTreeShowHidden=1
let g:NERDTreeWinPos="left"
let g:NERDTreeDirArrows=0
let NERDTreeQuitOnOpen=0 
map <C-t> :NERDTreeToggle<CR>

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
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_detect_modified=1

" === UltiSnips
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']

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

" ==== moving around
nmap <silent> <leader>k :wincmd k<CR>
nmap <silent> <leader>j :wincmd j<CR>
nmap <silent> <leader>h :wincmd h<CR>
nmap <silent> <leader>l :wincmd l<CR>

"My mappings
nnoremap <leader>ev <esc>:vsplit $MYVIMRC<cr>
nnoremap <leader>qv <esc>:w<cr>:source $MYVIMRC<cr>
nnoremap <C-s> :w<CR>
nnoremap > <esc><C-w>>
nnoremap < <esc><C-w><
nnoremap <leader>> >>
nnoremap <leader>< <<
nnoremap <leader>o o<ESC>k
nnoremap <leader>O O<ESC>j
" autocomplete with shift+tab
" Check out :help ins-completion
inoremap <S-Tab> <C-n>
nnoremap <C-f> :!ctags -R .<CR>

" Open Man with word under cursor in horizontal split
map <leader>z <Plug>(Man)
" Open Man with word under cursor in vertival split
map <leader>v <Plug>(Vman)

inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" ==== disable swap file warning
set shortmess+=A

set secure
