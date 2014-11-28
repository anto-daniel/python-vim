autocmd! bufwritepost .vimrc source %
set pastetoggle=<F2>
set clipboard=unnamed
set mouse=a
set bs=2

let mapleader = ","

noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

 " quicksave command
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>

" quick quit command
noremap <Leader>e :quit<CR>
noremap <Leader>E :qa!<CR>

" bind Ctrl+ <movements> keys to move around the windows, instead of using Ctrl+w + <movement>
map  <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

"easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" map sort function to a key
vnoremap <Leader>s :sort<CR>

"easier moving of code blocks
vnoremap < <gv " better indentation
vnoremap > >gv " better indentation

" show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red 
au InsertLeave * match ExtraWhitespace /\s\+$/

" Color scheme

set t_Co=256
color wombat256mod

"Enable syntax highlighting
" You need to reload this file for the change to apply
filetype off
filetype plugin indent on
syntax on

" Showing line numbers and length
set number
set tw=79
set nowrap
set fo-=t

" if exists("&colorcolumn")
"   set colorcolumn=80
" endif
"highlight ColorColumn ctermbg=233

" easier formatting of paragraphs
vmap Q gq
nmap Q gqap

" Useful settings
set history=700
set undolevels=700

" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Make search case sensitive
set hlsearch 
set incsearch 
set ignorecase
set smartcase

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

" Setup Pathogen to manage your  plugins
 call pathogen#infect()


set laststatus=2

" Settings for ctrlp
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=_build/*
set wildignore+=*/coverage/*

" Settings for python-mode

map <Leader>g :call RopeGotoDefinition()<CR>
let repovim_enable_shortcuts = 1
let g:pymode_rope_goto_def_newwin = "vnew"
let g:pymode_rope_extended_complete = 1
let g:pymode_breakpoint = 0
let g:pymode_syntax = 1
let g:pymode_syntax_builtin_objs = 0
let g:pymode_syntax_builtin_funcs = 0
map <Leader>b Oimport ipdb; ipdb.set_trace()

" Better navigating through omnicomplete option list
set completeopt=longest,menuone
function! OmniPopup(action)
	if pumvisible()
		if a:action == 'j'
			return "\<C-N>"
		elseif a:action = 'k'
			return "\<C-P>"
		endif
	endif
	return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

" Python folding
set nofoldenable

set laststatus=2
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
set t_Co=256
let g:Powerline_symbols = "fancy"
let g:Powerline_symbols = "compatible"
let g:Powerline_cache_enabled = 1
set guifont=Meslo\ LG\ M\ DZ\ Regular\ for\ Powerline
