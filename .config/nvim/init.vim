""""""""""""""""""""
" Start of Plugins "
"                  "
""""""""""""""""""""

" Directory for plugins
call plug#begin(stdpath('data') . '/plugged')

  " # Dracula Theme
  Plug 'dracula/vim', { 'as': 'dracula' } 

  " # Better indent lines
  Plug 'yggdroot/indentline'

  " # Commentary Code Commenter
  Plug 'tpope/vim-commentary'

  " # NERDTree File manager
  " Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }
  " Plug 'xuyuanp/nerdtree-git-plugin', { 'on':  'NERDTreeToggle' }
  " Plug 'tpope/vim-vinegar'

  " # PolyGlot Syntax Support
  Plug 'sheerun/vim-polyglot'

  " # Fzf support for fast fuzzy finding
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() }}
  Plug 'junegunn/fzf.vim'
  " # Changes Vim working directory to project root. 
  Plug 'airblade/vim-rooter'


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
  " Plug 'vim-test/vim-test'

  " # Suround Plugin
  Plug 'tpope/vim-surround'

  " # Airline Statusline for better or worse 
  Plug 'vim-airline/vim-airline'

  " # Codi live repl for prototyping
  Plug 'metakirby5/codi.vim', {'on': 'Codi' }

  " # Devicons For better Icons
  Plug 'ryanoasis/vim-devicons'

  " # Smooth Scrolling
  Plug 'psliwka/vim-smoothie' 

  " # Goyo And Limelight for Hyperfocused no distraction wrting
  Plug 'junegunn/goyo.vim', {'on': 'Goyo'}
  Plug 'junegunn/limelight.vim', {'on': 'Goyo'}

  " # Jump to any definition and references
  " Plug 'pechorin/any-jump.vim'

  " Solve leetcode problems inside of vim
  Plug 'ianding1/leetcode.vim', {'on':'LeetCodeSignIn'}


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

set noshowmode             " Don't show current mode in command-line since we have airline
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
set foldcolumn    =1
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
set modeline
set modelines     =1
set nostartofline
set ruler
set number
set numberwidth=3
set shortmess     =aoOTIc
set showmatch
let &fcs='eob: '           " Remove ~ at end of buffer
"set list listchars=tab:\|,trail:·,extends:❯,precedes:❮,nbsp:±
set list listchars=tab:\|\ ,trail:·,extends:❯,precedes:❮,nbsp:×
set so=7                   " Set 7 lines to the cursor - when moving vertically using j/k
set cmdheight=1            " Height of the command bar

" No backup or swap, we have git for that
set nobackup
set nowb
set noswapfile


" Colors Settings
set termguicolors
set fillchars+=vert:\  
colorscheme dracula
set background=dark

" Split Navingation Mapping
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Changing the leader to Space
let mapleader = ","

" map <ScrollWheelUp> <C-U>
" map <ScrollWheelDown> <C-D>



""""""""""""""""""""
" Plugins settings "
"                  "
""""""""""""""""""""

" * Indent Line settings
let g:indentLine_enabled = 1
let g:indentLine_setColors = 1
let g:indentLine_char = '┊'
"let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indent_blankline_extra_indent_level = -1
let g:indentLine_bufNameExclude = ['_.*', 'NERD_tree_*', 'coc-explorer']
let g:indentLine_fileTypeExclude = ['coc-explorer']


" * Completion and Coc Settings
set updatetime=300

" <TAB>: completion.
" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Coc Explorer configuration
nmap <leader>x :CocCommand explorer --preset simplify<CR>
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

let g:coc_explorer_global_presets = {
\   '.vim': {
\     'root-uri': '~/.vim',
\   },
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   }
\ }

" Don't let vim open file in Explorer buffer.
autocmd BufEnter * if bufname('#') =~# "coc-explorer" && winnr('$') > 1 | b# | endif

" Coc-yank settings 
nnoremap <silent> <leader>y  :<C-u>CocList -A --normal yank<cr>


" * Leetcode plugin settings
let g:leetcode_browser = 'firefox'
let g:leetcode_solution_filetype = 'javascript'
let g:leetcode_hide_paid_only = 1
let g:leetcode_hide_topics = 1
let g:leetcode_hide_companies = 1


" * Emmet plugin settings
let g:user_emmet_leader_key='<leader>'




" * Airline Settings
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_powerline_fonts = 1
let g:airline_theme = 'dracula'
let g:bufferline_echo = 0
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'



" * Fzf Settings
nnoremap <C-p> :FZF<CR>
nnoremap <leader>p :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

map <C-f> :Files<CR>
map <leader>f :Files<CR>
map <leader>b :Buffers<CR>
nnoremap <leader>g :Rg<CR>
nnoremap <leader>t :Tags<CR>
nnoremap <leader>m :Marks<CR>

let g:fzf_tags_command = 'ctags -R'
" Border color
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.7, 'border': 'sharp' } }
" let g:fzf_layout = { 'down': '40%' }
"
"

let $FZF_DEFAULT_OPTS = '--info=inline'
let $FZF_DEFAULT_COMMAND="rg --files --hidden"

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }




" * Goyo and Limelight settings
function! s:goyo_enter()
  " if executable('tmux') && strlen($TMUX)
  "   silent !tmux set status off
  "   silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  "endif
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
  set scrolloff=999
endfunction

function! s:codi_leave()
  set showmode
  set scrolloff=4
endfunction

autocmd! User CodiEnterPre nested call<SID>codi_enter() 
autocmd! User CodiLeavePre nested call<SID>codi_leave()


" * vim-rooter settings
" stop Rooter echoing the project directory:
let g:rooter_silent_chdir = 1

" * NERDTree Config 
" open NERDTree automatically when vim starts up on opening a directory
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" " close vim if the only window left open is a NERDTree
" autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" " Dont let vim open files in the NerdTree window
" autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" && winnr('$') > 1 | b# | endif

" " Remove the sign column on the left to get some space
" autocmd BufEnter NERD_tree_* set signcolumn=no

" nnoremap <silent> <C-x> :NERDTreeToggle <CR>
" let g:NERDTreeMinimalMenu = 1
" let g:NERDTreeMinimalUI = 1
" let g:NERDTreeWinSize = 28
" let g:NERDTreeDirArrows=0
" let g:NERDTreeDirArrowExpandable = ''
" let g:NERDTreeDirArrowCollapsible = ''
" let g:NERDTreeNodeDelimiter = "\u00a0"
" let g:NERDTreeChDirMode = 2
" let NERDTreeAutoDeleteBuffer = 1 


" * Vim-plug settings
" always open vim-plug in a vertical split on the right
let g:plug_window = 'noautocmd vertical botright new'

