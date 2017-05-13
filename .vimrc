" Don't try to be vi compatible
set nocompatible

" Everything should be English.
language messages en_US.UTF-8
set langmenu=en_US.UTF-8

" Helps force plugins to load correctly when it is turned back on below
filetype off

" Load bundles from the "bundle" sub directories instead of one large plugin dir.
set runtimepath^=~/.vim
silent! call pathogen#runtime_append_all_bundles()
silent! call pathogen#helptags()

" Turn on syntax highlighting
syntax on

let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1

" Yank into and put from the Windows clipboard.
set clipboard=unnamed

" File-type highlighting and configuration.
" Run :filetype (without args) to see what you may have
" to turn on yourself, or just set them all to be sure.
filetype on
filetype plugin on
filetype indent on

set autoindent smartindent

" TODO: Pick a leader key
" let mapleader = ","

" Security
set modelines=0

" Show line numbers
set number

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
" #set wrap
" #set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Always show status line.
set laststatus=2

function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    highlight StatusLine guibg=green
  elseif a:mode == 'r'
    highlight StatusLine guibg=yellow
  else
    highlight StatusLine guibg=red
  endif
endfunction

autocmd InsertEnter * call InsertStatuslineColor(v:insertmode)
autocmd InsertLeave * highlight StatusLine guibg=#c2bfa5

set statusline=%<%f\ %h%y\ [%{&ff}]%m%r\ %#warningmsg#%{SyntasticStatuslineFlag()}%*%=%-14.(%l,%c%V%)\ %P

" Last line
set showmode
set showcmd

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" Mouse in all modes
set mouse=a

set history=1000
set matchtime=0
" The “Press ENTER or type command to continue” prompt is jarring and usually unnecessary. You can shorten command-line text and other info tokens with.
set shortmess=atI

" Textmate holdouts

" Formatting
map <leader>q gqip

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

" Color scheme (terminal)
" set t_Co=256
" set background=dark
" let g:solarized_termcolors=256
" let g:solarized_termtrans=1
" put https://raw.github.com/altercation/vim-colors-solarized/master/colors/solarized.vim
" in ~/.vim/colors/ and uncomment:
" colorscheme solarized
