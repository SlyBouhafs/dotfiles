""""""""""""""""""""
" Start of Plugins "
"                  "
""""""""""""""""""""

" Directory for plugins
call plug#begin(stdpath('data') . '/plugged')

  " # Dracula Theme
  Plug 'dracula/vim'

  " # Better indent lines
  Plug 'yggdroot/indentline'

  " # Tcomment easy Code Commenter
  Plug 'tomtom/tcomment_vim'

  " # NERDTree File manager
  Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }
  Plug 'xuyuanp/nerdtree-git-plugin', { 'on':  'NERDTreeToggle' }

  " # PolyGlot Syntax Support
  Plug 'sheerun/vim-polyglot'

  " # Fzf support for fast fuzzy finding
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() }}
  Plug 'junegunn/fzf.vim', {'on': 'FZF'}

  " # Emmet Abbriviations support
  Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'javascript', 'typescript']}

  " # COC Fast Completion and LSP support 
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " # Denite Interface plugin
  Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }

  " # Git Gutter
  Plug 'airblade/vim-gitgutter'

  " # Better Git Commands
  Plug 'tpope/vim-fugitive'

  " # Bettr tests Inside of vim
  Plug 'vim-test/vim-test'

  " # Suround Plugin
  Plug 'tpope/vim-surround'

  " # Airline Statusline for better or worse 
  Plug 'vim-airline/vim-airline'

  " * Codi live repl for prototyping
  Plug 'metakirby5/codi.vim', {'on': 'Codi' }

  " # Devicons For better Icons
  Plug 'ryanoasis/vim-devicons'

  " # Smooth Scrolling
  Plug 'psliwka/vim-smoothie' 

  " # Goyo And Limelight for Hyperfocused no distraction wrting
  Plug 'junegunn/goyo.vim', {'on': 'Goyo'}
  Plug 'junegunn/limelight.vim', {'on': 'Goyo'}
 

" Initialize plugin system
call plug#end()

"""""""""""""""""""""""""""""""
"     End of Plugins List     "
"                             "
"""""""""""""""""""""""""""""""



"""""""""""""""""""""""""""""""
"     Personnal Settings      "
"                             "
"""""""""""""""""""""""""""""""

" * Genral Nvim setup

" You want Vim, not vi. When Vim finds a vimrc, 'nocompatible' is set anyway.
set nocompatible

filetype plugin indent on  " Load plugins according to detected filetype.
syntax on                  " Enable syntax highlighting.

set autoindent             " Indent according to previous line.
set smartindent            " Smart indent
set expandtab              " Use spaces instead of tabs.
set softtabstop =2         " Tab key indents by 4 spaces.
set shiftwidth  =2         " >> indents by 4 spaces.
set shiftround             " >> indents to next multiple of 'shiftwidth'.

set backspace   =indent,eol,start  " Make backspace work as you would expect.
set hidden                 " Switch between buffers without having to save first.
set laststatus  =2         " Always show statusline.
set display     =lastline  " Show as much as possible of the last line.

set showmode               " Show current mode in command-line.
set showcmd                " Show already typed keys when more are expected.

set incsearch              " Highlight while searching with / or ?.
set hlsearch               " Keep matches highlighted.

set ttyfast                " Faster redrawing.
set lazyredraw             " Only redraw when necessary.

set splitbelow             " Open new windows below the current window.
set splitright             " Open new windows right of the current window.

set cursorline             " Find the current line quickly.
set wrapscan               " Searches wrap around end-of-file.
set report      =0         " Always report changed lines.
set synmaxcol   =200       " Only highlight the first 200 columns.

set foldmethod    =marker
set foldcolumn    =2
set foldopen     -=hor
set foldopen     +=jump
set foldtext      =mhi#foldy()
set mouse         =a
set scrolloff     =4
set sidescroll    =5
set ignorecase
set smartcase
set tagcase       =match

set signcolumn=yes
set list
set modeline
set modelines     =1
set nostartofline
set ruler
set number
set shortmess     =aoOTI
set showcmd
set showmatch
set showmode
set list                   " Show non-printable characters.
let &fcs='eob: '           " Remove ~ at end of buffer

set nobackup
set nowb
set noswapfile

set so=7                   " Set 7 lines to the cursor - when moving vertically using j/k

set cmdheight=1            " Height of the command bar

if has('multi_byte') && &encoding ==# 'utf-8'
  let &listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:±'
else
  let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.'
endif

" Colors Settings
set termguicolors
colorscheme dracula

" Split Navingation Mapping
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


""""""""""""""""""""
" Plugins settings "
"                  "
""""""""""""""""""""

" * Indent Line settings
let g:indentLine_setColors = 1
let g:indentLine_char = '|'
"let g:indentLine_char_list = ['|', '¦', '┆', '┊']


" * Completion and Coc Settings
set updatetime=300
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
autocmd CursorHold * silent call CocActionAsync('highlight')


" * Airline Settings
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_powerline_fonts = 1
let g:airline_theme = 'dracula'


" * Fzf Settings
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
let $FZF_DEFAULT_COMMAND = 'ag -g ""'


" * NERDTree Setup
let g:NERDTreeShowHidden = 0
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeMinimalMenu = 1
nnoremap <silent> <C-b> :NERDTreeToggle<CR>
" Close NERDTree if the only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }



" * Goyo and Limelight settings
function! s:goyo_enter()
  " if executable('tmux') && strlen($TMUX)
  "   silent !tmux set status off
  "   silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  "endif
  set noshowmode
  set noshowcmd
  set scrolloff=999
  set nonumber
  set nocursorline
  set signcolumn=no
  Limelight
endfunction

function! s:goyo_leave()
  " if executable('tmux') && strlen($TMUX) silent !tmux set status on
  "   silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  " endif
  set showmode
  set showcmd
  set scrolloff=4
  set number
  set cursorline
  set signcolumn=yes
  Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" * Codi Settings
function! s:codi_enter()
  set noshowmode
  set noshowcmd
  set scrolloff=999
endfunction

function! s:codi_leave()
  set showmode
  set showcmd
  set scrolloff=4
endfunction

autocmd! User CodiEnterPre nested call<SID>codi_enter() 
autocmd! User CodiLeavePre nested call<SID>codi_leave()
