" ==============================================================================
" VUNDLE SETUP
" ==============================================================================
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'


" ==============================================================================
" PLUGINS
" ==============================================================================

" SANE DEFAULTS
" -------------
Plugin 'tpope/vim-sensible'

" TOOLS
" -----
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
  map <C-e> :NERDTreeToggle<CR>
Plugin 'kien/ctrlp.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Raimondi/delimitMate'
  " insert new line after {,[,( and indent
  inoremap {<CR> {<CR>}<Esc><S-o>
  inoremap [<CR> [<CR>]<Esc><S-o>
  inoremap (<CR> (<CR>)<Esc><S-o>
Plugin 'scrooloose/syntastic'
  let g:syntastic_check_on_open=1
Plugin 'Valloric/YouCompleteMe'
  " These are the tweaks I apply to YCM's config, you don't need them but they
  " might help.
  " YCM gives you popups and splits by default that some people might not like,
  " so these should tidy it up a bit for you.
  let g:ycm_add_preview_to_completeopt=0
  let g:ycm_confirm_extra_conf=0
  set completeopt-=preview
Plugin 'lokaltog/vim-easymotion'
Plugin 'tpope/vim-surround'
Plugin 'mileszs/ack.vim'
Plugin 'majutsushi/tagbar'
  nmap <F8> :TagbarToggle<CR>
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'airblade/vim-gitgutter'
Plugin 'mbbill/undotree'
  nnoremap <F5> :UndotreeToggle<cr>
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'SirVer/ultisnips'
  let g:UltiSnipsExpandTrigger="<c-j>"
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/nerdcommenter'
Plugin 'christoomey/vim-tmux-navigator'


" HTML
" ----
Plugin 'mattn/emmet-vim'
Plugin 'othree/html5.vim'

" CSS
" ---
Plugin 'ap/vim-css-color'

" JAVASCRIPT
" ----------
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'marijnh/tern_for_vim'
Plugin 'moll/vim-node'

" COFFEE
" ------
Plugin 'kchmck/vim-coffee-script'

" HASKELL
" -------
Plugin 'eagletmt/ghcmod-vim'

" PYTHON
" ------
Plugin 'klen/python-mode'

" GO
" --
Plugin 'fatih/vim-go'

" MARKDOWN
" --------
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
  autocmd BufNewFile,BufRead *.txt,*.mkd,*.md set tw=80

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" ==============================================================================
" END PLUGINS
" ==============================================================================


" ==============================================================================
" OPTIONS
" ==============================================================================
let mapleader = ","
set lazyredraw
set number
set colorcolumn=80
set expandtab
set shiftwidth=2
set softtabstop=2

set background=dark
colorscheme solarized

" Powerline
" Always display the statusline in all windows
set laststatus=2
" Always display the tabline, even if there is only one tab
set showtabline=2
" Hide the default mode text (e.g. -- INSERT -- below the statusline)
set noshowmode


" ==============================================================================
" KEYS
" ==============================================================================
imap jj <ESC>

nmap tn :tabnew<CR>
nmap tj :tabnext<CR>
nmap tk :tabprevious<CR>
nmap tc :tabclose<CR>

