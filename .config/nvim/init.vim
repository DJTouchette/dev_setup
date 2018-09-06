" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'christoomey/vim-tmux-navigator'

" Visual markings
Plug 'kshenoy/vim-signature'

Plug 'w0rp/ale'
Plug 'ludovicchabant/vim-gutentags'

" Org
Plug 'vimwiki/vimwiki'

" Better folds
Plug 'pseewald/vim-anyfold'

" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" Flashy
Plug 'kana/vim-operator-user'
Plug 'haya14busa/vim-operator-flashy'

" Snippets
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'

" Pretty Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Auto paren
Plug 'jiangmiao/auto-pairs'

" Start screen
Plug 'mhinz/vim-startify'

" Vim leader ( Leader Info )
Plug 'hecal3/vim-leader-guide'

"Theme
Plug 'Yggdroot/duoduo'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Tile manager
Plug 'zhamlin/tiler.vim'

" Auto-Complete
Plug 'Valloric/YouCompleteMe'

" JS Auto Import
Plug 'Galooshi/vim-import-js'

" Comment shit out
Plug 'tpope/vim-commentary'

" Indent Guides
Plug 'Yggdroot/indentLine'

" Lang
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-endwise'
Plug 'elixir-editors/vim-elixir'
Plug 'hashivim/vim-terraform'
Plug 'JamshedVesuna/vim-markdown-preview'

" Initialize plugin system
call plug#end()

" enable line numbers
let NERDTreeShowLineNumbers=1

" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber

" Indent charector
let g:indentLine_char = '|'
" let g:indentLine_setColors = 0
let g:indentLine_bgcolor_term = 202

" Use GitHub markdown parser
let vim_markdown_preview_github=1

let g:UltiSnipsSnippetDirectories = ['UltiSnips', $HOME.'/.vim/UltiSnips']
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Mr.Selk magic
set undofile                " Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo
set visualbell
set scrolloff=4

" Set line numbers
set number
set ruler
syntax on
set expandtab
let NERDTreeShowHidden=1 " Show dot files
let NERDTreeQuitOnOpen = 1 " Closes nerdtree on file selection
let NERDTreeAutoDeleteBuffer = 1 " Delete buffer
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Configuer ALE do use proper fixers based on lang
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'ruby': ['rubocop'],
\}

" show existing tab with 4 spaces width
set tabstop=2
" when indenting with '>', use 4 spaces width
set shiftwidth=2

" On pressing tab, insert 4 spaces
set expandtab
set relativenumber

" Really? pretty self explanitory
set background=dark

" Fold settings, Always fold
let anyfold_activate=1
let anyfold_fold_comments=1
set foldlevel=0

" Search Configs
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

" Vim Wiki
let g:vimwiki_ext2syntax = {'.md': 'markdown'}

" Theme
colorscheme duoduo

" Splt more natural
set splitbelow
set splitright

" Gimme them term colors
let g:hybrid_custom_term_colors = 1

" I want FZF search to be at the top
let g:fzf_layout = { 'up': '~20%' }

" This command now supports CTRL-T, CTRL-V, and CTRL-X key bindings
" and opens fzf according to g:fzf_layout setting.
command! Buffers call fzf#run(fzf#wrap(
    \ {'source': map(range(1, bufnr('$')), 'bufname(v:val)')}))

" This extends the above example to open fzf in fullscreen
" when the command is run with ! suffix (Buffers!)
command! -bang Buffers call fzf#run(fzf#wrap(
    \ {'source': map(range(1, bufnr('$')), 'bufname(v:val)')}, <bang>0))

" Magic, relative searching
function! s:fzf_neighbouring_files()
  let current_file =expand("%")
  let cwd = fnamemodify(current_file, ':p:h')
  let command = 'ag -g "" -f ' . cwd . ' --depth 0'

  call fzf#run({
        \ 'source': command,
        \ 'sink':   'e',
        \ 'options': '-m -x +s',
        \ 'window':  'enew' })
endfunction

command! FZFNeigh call s:fzf_neighbouring_files()

" Make the term pretty
set t_co=256
set termguicolors

" Pops up a menu when leader is pressed, bad memory.
" Position of leader menu
" let g:leaderGuide_vertical = 1
" let g:leaderGuide_position = 'middle'
let g:leaderGuide_hspace = 8

" Status bar config
let g:airline#extensions#tabline#enabled = 1

" Make flashy work
map y <Plug>(operator-flashy)
nmap Y <Plug>(operator-flashy)$

" KEY REMAPS
let mapleader = "\<Space>"

" This is all the guide config
"
" Guide Config
" Define prefix dictionary
let g:lmap =  {}

" Second level dictionaries:
let g:lmap.f = { 'name' : 'File Menu' }
let g:lmap.o = { 'name' : 'Open Stuff' }
" 'name' is a special field. It will define the name of the group.
" leader-f is the "File Menu" group.
" Unnamed groups will show a default string

" Provide commands and descriptions for existing mappings
nmap <silent> <leader>fd :e $MYVIMRC<CR>
let g:lmap.f.d = ['e ~/.config/nvim/init.vim', 'Open vimrc']

nmap <silent> <leader>fs :so %<CR>
let g:lmap.f.s = ['so %', 'Source file']

nmap <silent> <leader>oo  :copen<CR>
" let g:lmap.o.o = ['copen', 'Open quickfix']

nmap <silent> <leader>ol  :lopen<CR>
" let g:lmap.o.l = ['lopen', 'Open locationlist']

nmap <silent> <leader>fw :w<CR>
" let g:lmap.f.w = ['w', 'Write file']

" Create new menus not based on existing mappings:
let g:lmap.g = {
      \'name' : 'Git Menu',
      \'s' : ['Gstatus', 'Git Status'],
      \'p' : ['Gpull',   'Git Pull'],
      \'u' : ['Gpush',   'Git Push'],
      \'c' : ['Gcommit', 'Git Commit'],
      \'w' : ['Gwrite',  'Git Write'],
      \'b' : ['Gblame',  'Git Blame'],
      \'r' : ['Gread',  'Git Read (Checkout)'],
      \'B' : ['Gbrowse',  'Open in browser']
      \}


" NerdTree
let g:NERDTreeWinPos = "right"
map <leader>ft :NERDTreeToggle<CR>
let g:NERDTreeWinSize=60

" FzF
let g:lmap.p = { 'name': 'Project'}
let g:lmap.p.f = ['FZF', 'Search Project with FZF']
let g:lmap.p.b = ['Buffers', 'Search Buffers with FZF']

" Sessions
let g:lmap.s = { 'name': 'Sessions'}
let g:lmap.s.l = ['SLoad', 'Load Session']
let g:lmap.s.s = ['SSave', 'Save Session']
let g:lmap.s.d = ['SDelete', 'Delete Session']
let g:lmap.s.c = ['SClose', 'Close Session']

" Buffers

let g:lmap.b = { 'name': 'Buffers'}
let g:lmap.b.n = ['bnext', 'Next Buffer']
let g:lmap.b.p = ['bprev', 'Previous Buffer']
let g:lmap.b.s = ['buffer', 'Search Buffer']


" ALE
let g:lmap.a = { 'name': 'ALE'}
let g:lmap.a.f = ['ALEFix', 'Fix']

" Tiler: Not really used anymore, think of getting rid of it
let g:lmap.t = { 'name': 'Tile Manager'}
let g:lmap.t.f = ['TilerFocus', 'Focus Main']
let g:lmap.t.n = ['TilerNew', 'New Tile']
let g:lmap.t.c = ['TilerClose', 'Close Tile']
let g:lmap.t.r = ['TilerReorder', 'Reorder Tiles']

" Lang Javascript
let g:lmap.l = { 'name': 'Lang'}
let g:lmap.l.j = { 'name': 'Javascript'}
let g:lmap.l.j.j = ['ImportJSWord', 'Import file under cursor']
let g:lmap.l.j.i = ['ImportJSFix', 'Imports All files']

" Window Moves
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

call leaderGuide#register_prefix_descriptions("<Space>", "g:lmap")
nnoremap <silent> <leader> :<c-u>LeaderGuide '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>LeaderGuideVisual '<Space>'<CR>

" Removes trailing spaces
function TrimWhiteSpace()
  %s/\s*$//
  ''
endfunction

" Remove white space
set list listchars=trail:.,extends:>
autocmd FileWritePre * call TrimWhiteSpace()
autocmd FileAppendPre * call TrimWhiteSpace()
autocmd FilterWritePre * call TrimWhiteSpace()
autocmd BufWritePre * call TrimWhiteSpace()

