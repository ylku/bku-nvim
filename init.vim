" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Multiple Plug commands can be written in a single line using | separators
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'easymotion/vim-easymotion'
" Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jiangmiao/auto-pairs'
" Browse tags of current file
Plug 'majutsushi/tagbar'

Plug 'plasticboy/vim-markdown'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Colorscheme
Plug 'tomasr/molokai'

" Initialize plugin system
call plug#end()

" Start from vim ...
"set runtimepath^=~/.vim runtimepath+=~/.vim/after
"let &packpath = &runtimepath
"source ~/.vimrc

"----------------------------------------------------------------------------
"               Format automatically
"----------------------------------------------------------------------------
set autoindent
"set cindent
"set comments=sl:/*,mb:**,elx:*
set copyindent      " copy the previous indentation on autoindenting
"set smartindent

"----------------------------------------------------------------------------
"           TAB setting
"----------------------------------------------------------------------------
" Replace <TAB> with space.
" Hitting Tab in insert mode will produce the appropriate number of spaces
"----------------------------------------------------------------------------
set expandtab       " replace <TAB> with spaces
set softtabstop=4

" Set shiftwidth to control how many columns text is indented with the reindent
" operations (<< and >>) and automatic C-style indentation.
set shiftwidth=4    " Vim incident <n> space
set tabstop=4       " tell vim how many columns a tab counts for
"set smarttab           " insert tabs on the start of a line according to context

au FileType Makefile set noexpandtab " Do not expandtab while type is Makefile

" Visualizing tabs
syntax match Tab /\t/
hi Tab gui=underline guifg=blue ctermbg=blue

"----------------------------------------------------------------------------
"               Searching
"----------------------------------------------------------------------------
set hlsearch            " highlight search
set incsearch           " incremental search
set ignorecase          " ignore case when searching
set smartcase           " ignore case if search pattern is all lowercase,case-sensitive otherwise

filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

"----------------------------------------------------------------------------
"               Mapping (map, nmap, ...)
"----------------------------------------------------------------------------
" Replace leader with , (default is \)
let mapleader=","
let g:mapleader=","

nmap <F8> :TagbarToggle<CR>

" +--------------------------------+
" |         Indentation            |
" +--------------------------------+
" Multiline indent/un-indent (V mode)
vmap > >gv
vmap < <gv
" Current line indent/un-indent (N mode)
nmap > v><ESC>
nmap < v<<ESC>

autocmd! bufwritepost .config/nvim/init.vim source ~/.config/nvim/init.vim

" +--------------------------------+
" |         EasyMotion             |
" +--------------------------------+
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade  Comment
