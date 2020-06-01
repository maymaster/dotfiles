" Author:
"     Sergio Quijano Rey
"     sergiquijano@gmail.com
" Description:
"     CONFIG FILE FOR NEOVIM
" Version:
"     v1.0 06/02/2019 - First functionally version of the configuration
"     v1.1 08/02/2019 - More pulished configuration, better organized
"     v1.2 02/05/2019 - Tabs changed by spaces and idention corrected
"     v2.0 22/03/2020 - New commands for navigating tabs and splits
"                       Deoplete removed, YouCompleteMe is used instead
"                       YouCompleteMe added
"                       NeoMake removed, I was not using it (ALE does all the work)
"     v2.1 15/05/2020 - Added Vim Fugitive
"                       Some keybindings added for changing vim working dir
"                       and for Vim Fugitive
"                       Lightline configured, now displaying git branch
"                       auto-pairs instead of bloated smart-input

" TODO:
"=============================================================================
"   [ ] Name the folds I made
"   [ ] Add code to a fold, without 1. Deleting old fold 2. Creating new fold (ask on reddit)
"   [ ] Mark trailing spaces
"   [ ] Autoremove trailing spaces
"   [ ] RipGrep ==> Like FZF but for text inside files
"   [ ] Snippet tool
"   [ ] Look Coc.nvim as an alternative to YouCompleteMe

" PLUGIN MANAGER
"==============================================================================
call plug#begin('~/.local/share/nvim/plugged')

    " General purpose
    "===========================================================================
    Plug 'scrooloose/nerdtree'          " File exploring
    Plug 'junegunn/fzf.vim'             " Fuzzy Finder
    Plug 'tpope/vim-fugitive'           " Git Integration

    " Editor
    "===========================================================================
    Plug 'jiangmiao/auto-pairs'         " Autoclose brackets, parenthesis...
    
    " Visual
    "===========================================================================
    Plug 'itchyny/lightline.vim'        " Status bar. Airline is to heavy for me
    Plug 'junegunn/goyo.vim'            " Focus Mode
    Plug 'ryanoasis/vim-devicons'       " Icons for NerdTree

    " Autocompleters
    "===========================================================================
    Plug 'ycm-core/YouCompleteMe'       " Code Autocompletion
    
    " Linters
    "===========================================================================
    Plug 'w0rp/ale'                     " Real time linting
                                        
    " Color schemes
    "===========================================================================
    Plug 'gruvbox-community/gruvbox'    " Gruvbox Theme updated 

call plug#end()

" LEADER KEY
"==============================================================================
let mapleader = ","

" EDITOR SETTINGS
"==============================================================================
set autoindent                          " Sets autoindent
set smartindent                         " Set smartindent
set incsearch                           " Shows results while searching
set backspace=indent,eol,start          " Normal backspace (for VI specially)
set mouse=n                             " Allow mouse control
set undofile                            " Persisten undos (I can undo even if I closed the file)
set encoding=utf-8                      " Type of encoding

" Four spaces instead of tab
filetype plugin indent on
set smarttab                            " Set smarttab
set tabstop=4
set shiftwidth=4
set expandtab

" Remember folds made on a file
augroup remember_folds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup END

" PERFORMANCE
"==============================================================================
set autoread                                " Auto reload changed files
autocmd! bufwritepost init.vim source %     " Auto compile when changing nvim config file
autocmd! bufwritepost .nvimrc source %      " Auto compile when changing nvim config file

" Get rid of swap/backup files
set nobackup
set nowritebackup
set noswapfile

" Clipboard
set clipboard+=unnamedplus 

" VISUAL SETTINGS
"==============================================================================
set number                          " Show numbers
syntax enable                       " Show syntax
syntax on                           " Show syntax 
filetype on                         " Checks automatically for filetype
filetype plugin on                  " Plugins dependent of filetype
set hlsearch                        " Higlights what we searched
set laststatus=2                    " For the lightline plugin
set nowrap                          " Don't wrap long lines
set listchars=extends:→             " Show arrow if line continues rightwards
set colorcolumn=80                  " Show 80 col line 
set splitbelow splitright           " Spliting on righ instead of below
set guicursor=                      " Block cursor
let loaded_matchparen= 1            " No matching parenthesis/brakets/... highlight
set background=dark                 " Dark background, does nothing with gruvbox colorscheme
colorscheme gruvbox                 " Default color scheme

" Keybindings
"===============================================================================
" Fast movement
map <C-Down> 3j            
map <C-Up> 3k

" Whole block identation
vnoremap < <gv
vnoremap > >gv

" Spell checking
map <F6> :setlocal spell! spelllang=es<CR>
map <F7> :setlocal spell! spelllang=en<CR>

" Open a terminal (horizontal or vertical)
map <leader>k :sp<CR>:terminal<CR>A
map <leader>K :vsp<CR>:terminal<CR>A
 
" Focus mode for writting
map <leader>f :Goyo 120x120<CR>:set wrap<CR>:set linebreak<CR>:set breakindent<CR>
map <leader><S-f> :Goyo<CR>:set nowrap<CR>:set number<CR>

" Fuzzy File Finder
map <leader>p :FZF<CR>

" Open Nerd Tree
map <leader>o :NERDTreeToggle<CR>

" For exiting the terminal mode
tnoremap <leader><Esc> <C-\><C-n>>

" For avoid shifting
map <S-Up> <C-Up> 
map <S-Down> <C-Down>

" Tab Navigation
map <leader>t :tabnew<CR>
map <leader>T :tabnew<CR>:terminal<CR>A
map <leader>1 1gt
map <leader>2 2gt
map <leader>3 3gt
map <leader>4 4gt
map <leader>5 5gt
map <leader>6 6gt
map <leader>7 7gt
map <leader>8 8gt
map <leader>9 9gt

" Split navigation
map <leader><Left> :wincmd h<CR>
map <leader><Right> :wincmd l<CR>
map <leader><Up> :wincmd k<CR>
map <leader><down> :wincmd j<CR>

" Go to Definition
map <leader>d :YcmCompleter GoToDefinition<CR>

" Git integration. Open Git Status in vertical split
map <leader>g :Git<CR>
map <leader>G :vertical Git<CR>

" Change NVIM Working Directory
" Usefull when using fzf to open a file and instantly change NVIM working dir
map <leader>cd :cd %:p:h<CR>:pwd<CR>

" PLUGINS CONFIGURATION
"=============================================================================

" You Autocomplete Me
" Autocompletions are automatically shown. Set to 0 to disable this (Control-Space to show suggestions)
"let g:ycm_auto_trigger = 1

" You Autocomplete Me autoclose documentation splits
let g:ycm_autoclose_preview_window_after_insertion = 1

" Lightline Configuration
" Added Git Branch in the status bar
let g:lightline = {
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'FugitiveHead'
    \ },
\ }
