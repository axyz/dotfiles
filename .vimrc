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
let mapleader = ","
set hidden
set wildmode=list:longest,list:full " completion menu behaves more like cli

set number
set colorcolumn=80

set hlsearch " highlight search things

set smartindent
" tab settings
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set shiftround

" Hide the default mode text (e.g. -- INSERT -- below the statusline)
set noshowmode

set undodir=$HOME/.vim/.undo
set undofile
set undolevels=1000
set undoreload=10000

" do not create swap files!
set nobackup
set writebackup
set backupcopy=no
set noswapfile

set modeline
set modelines=5
set scrolloff=3 " scroll 3 lines before bottom/top
set autowrite

set cursorline " highlights the cursor line
set nowrap
set linebreak " this will not break whole words while wrap is enabled
set showbreak=…

set lazyredraw
set ttyfast " improves redrawing for newer computers

" folding
set foldenable " enable folding
set foldmethod=manual " detect triple-{ style fold markers
set foldlevel=99

" search
set ignorecase " ignore case when searching
set smartcase " but case-sensitive if expression contains a capital letter.
set gdefault " assume global when searching or substituting

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" When editing a file, always jump to the last known cursor position.
" Don't do it for commit messages, when the position is invalid, or when
" inside an event handler (happens when dropping a file on gvim).
autocmd BufReadPost *
\ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "normal g`\"" |
\ endif

" TOOLS
" -----
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-fugitive'
  autocmd BufNewFile,BufRead fugitive://* set bufhidden=delete
Plugin 'scrooloose/nerdtree'
  map <C-e> :NERDTreeToggle<CR>
  let NERDTreeQuitOnOpen = 1
Plugin 'terryma/vim-multiple-cursors'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Raimondi/delimitMate'
  " insert new line after {,[,( and indent
  inoremap {<CR> {<CR>}<Esc><S-o>
  inoremap [<CR> [<CR>]<Esc><S-o>
  inoremap (<CR> (<CR>)<Esc><S-o>
Plugin 'scrooloose/syntastic'
  let g:syntastic_check_on_open=1
Plugin 'bling/vim-airline'
  let g:airline_powerline_fonts = 1
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
Plugin 'rking/ag.vim'
  let g:agprg="ag --column --vimgrep --depth -1"
Plugin 'henrik/vim-qargs'
Plugin 'majutsushi/tagbar'
  nmap <F8> :TagbarToggle<CR>
Plugin 'airblade/vim-gitgutter'
Plugin 'mbbill/undotree'
  nnoremap <F5> :UndotreeToggle<cr>
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'SirVer/ultisnips'
  let g:UltiSnipsExpandTrigger="<c-j>"
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/nerdcommenter'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'vim-scripts/matchit.zip'
Plugin 'christoomey/vim-run-interactive'
  " Run commands that require an interactive shell
  nnoremap <Leader>r :RunInInteractiveShell<space>
Plugin 'tpope/vim-eunuch'
Plugin 'shougo/vimproc.vim'

"""""""
" FZF "
"""""""
set rtp+=~/.fzf
nnoremap <silent> <C-p> :FZF -m<CR>
" List of buffers
function! BufList()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! BufOpen(e)
  execute 'buffer '. matchstr(a:e, '^[ 0-9]*')
endfunction

nnoremap <silent> <Leader><space> :call fzf#run({
\   'source':  reverse(BufList()),
\   'sink':    function('BufOpen'),
\   'options': '+m',
\   'down':    '40%'
\ })<CR>


" Open files in horizontal split
nnoremap <silent> <Leader>s :call fzf#run({
\   'down': '40%',
\   'sink': 'botright split' })<CR>

" Open files in vertical horizontal split
nnoremap <silent> <Leader>v :call fzf#run({
\   'right': winwidth('.') / 2,
\   'sink':  'vertical botright split' })<CR>


cnoremap <silent> <c-l> <c-\>eGetCompletions()<cr>
"add an extra <cr> at the end of this line to automatically accept the fzf-selected completions.

function! Lister()
    call extend(g:FZF_Cmd_Completion_Pre_List,split(getcmdline(),'\(\\\zs\)\@<!\& '))
endfunction

function! CmdLineDirComplete(prefix, options, rawdir)
    let l:dirprefix = matchstr(a:rawdir,"^.*/")
    if isdirectory(expand(l:dirprefix))
        return join(a:prefix + map(fzf#run({
                    \'options': a:options . ' --select-1  --query=' .
                    \ a:rawdir[matchend(a:rawdir,"^.*/"):len(a:rawdir)],
                    \'dir': expand(l:dirprefix)
                    \}),
                    \'"' . escape(l:dirprefix, " ") . '" . escape(v:val, " ")'))
    else
        return join(a:prefix + map(fzf#run({
                    \'options': a:options . ' --query='. a:rawdir }),
                    \'escape(v:val, " ")'))
        "dropped --select-1 to speed things up on a long query
endfunction

function! GetCompletions()
    let g:FZF_Cmd_Completion_Pre_List = []
    let l:cmdline_list = split(getcmdline(), '\(\\\zs\)\@<!\& ', 1)
    let l:Prefix = l:cmdline_list[0:-2]
    execute "silent normal! :" . getcmdline() . "\<c-a>\<c-\>eLister()\<cr>\<c-c>"
    let l:FZF_Cmd_Completion_List = g:FZF_Cmd_Completion_Pre_List[len(l:Prefix):-1]
    unlet g:FZF_Cmd_Completion_Pre_List
    if len(l:Prefix) > 0 && l:Prefix[0] =~
                \ '^ed\=i\=t\=$\|^spl\=i\=t\=$\|^tabed\=i\=t\=$\|^arged\=i\=t\=$\|^vsp\=l\=i\=t\=$'
                "single-argument file commands
        return CmdLineDirComplete(l:Prefix, "",l:cmdline_list[-1])
    elseif len(l:Prefix) > 0 && l:Prefix[0] =~
                \ '^arg\=s\=$\|^ne\=x\=t\=$\|^sne\=x\=t\=$\|^argad\=d\=$'
                "multi-argument file commands
        return CmdLineDirComplete(l:Prefix, '--multi', l:cmdline_list[-1])
    else
        return join(l:Prefix + fzf#run({
                    \'source':l:FZF_Cmd_Completion_List,
                    \'options': '--select-1 --query='.shellescape(l:cmdline_list[-1])
                    \}))
    endif
endfunction
"""""""""""
" END FZF "
"""""""""""


" HTML
" ----
Plugin 'rstacruz/sparkup'
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

" HASKELL
" -------
Plugin 'raichoo/haskell-vim'
Plugin 'Twinside/vim-hoogle'
Plugin 'eagletmt/ghcmod-vim'
  autocmd BufWritePost *.hs GhcModCheckAndLintAsync
Plugin 'eagletmt/neco-ghc'
  autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
  autocmd FileType haskell let g:ycm_semantic_triggers = {'haskell' : ['.']}

" GO
" --
Plugin 'fatih/vim-go'

" MARKDOWN
" --------
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
  autocmd BufNewFile,BufRead *.txt,*.mkd,*.md set tw=80
  " Enable spellchecking for Markdown
  autocmd FileType markdown setlocal spell


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" TWIG
" ----
Plugin 'evidens/vim-twig'

" ==============================================================================
" END PLUGINS
" ==============================================================================


" ==============================================================================
" THEME
" ==============================================================================
set background=dark
colorscheme solarized


" ==============================================================================
" KEYS
" ==============================================================================
imap kj <ESC>

nmap tn :tabnew<CR>
nmap tj :tabnext<CR>
nmap tk :tabprevious<CR>
nmap tc :tabclose<CR>
" Open file prompt with current path
nmap <leader>e :e <C-R>=expand("%:p:h") . '/'<CR>


" ==============================================================================
" LOCAL CUSTOMIZATION
" ==============================================================================
if filereadable(glob("~/.vimrc.local"))
    source ~/.vimrc.local
endif

