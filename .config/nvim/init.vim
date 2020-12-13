" ======================== Vim-Plug ============================= " {{{

" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif


" Plugins directory
call plug#begin(stdpath('data') . '/plugged')

"}}}

" ======================== Plugins ============================== " {{{


" ================= looks and GUI stuff ================== "{{{


  " # Dracula Theme
  Plug 'dracula/vim', { 'as': 'dracula' }

  " # Devicons For better Icons
  Plug 'ryanoasis/vim-devicons'

  " # Airline Statusline for better or worse
  Plug 'vim-airline/vim-airline'


" }}}


" ================= Functionalities ================= " {{{

  " # Better indent lines
  Plug 'yggdroot/indentline'

  " # Commentary Code Commenter
  Plug 'tpope/vim-commentary'

  " # Conjure for that sweet clojure IDE
  Plug 'guns/vim-sexp',    {'for': 'clojure'}
  Plug 'tpope/vim-sexp-mappings-for-regular-people', {'for': 'clojure'}
  Plug 'olical/conjure', {'for': 'clojure', 'tag': 'v4.9.0'}
  Plug 'eraserhd/parinfer-rust', {'for': 'clojure', 'do': 'cargo build --release'}

  " # PolyGlot for Syntax Support
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

  " # Suround Plugin
  Plug 'tpope/vim-surround'

  " # Smooth Scrolling
  Plug 'psliwka/vim-smoothie'

  " # Goyo And Limelight for Hyperfocused no distraction wrting
  Plug 'junegunn/goyo.vim', {'on': 'Goyo'}
  Plug 'junegunn/limelight.vim', {'on': 'Goyo'}

  " # Jump to any definition and references
  " Plug 'pechorin/any-jump.vim'

  " Initialize plugin system
  call plug#end()

" }}}
" }}}

" ======================== General Config ======================= " {{{

set nocompatible                                    " You want Vim, not vi.

filetype plugin indent on                           " Load plugins according to detected filetype.
syntax on                                           " Enable syntax highlighting.

set mouse=a                                         " enable mouse scrolling
set autoindent                                      " Indent according to previous line.
set expandtab smarttab                              " Use spaces instead of tabs.
set tabstop=2 softtabstop=2 shiftwidth=2            " How many columns of whitespace
set shiftround                                      " >> indents to next multiple of 'shiftwidth'.
set incsearch ignorecase smartcase hlsearch         " highlight text while searching
set list listchars=tab:\|\ ,trail:·,extends:❯,precedes:❮,nbsp:× " use tab to navigate in list mode
set fillchars+=vert:\
set title                                           " tab title as file name

set backspace   =indent,eol,start                   " Make backspace work as you would expect.
set hidden                                          " Switch between buffers without having to save first.
set laststatus  =2                                  " Always show statusline.
set display     =lastline                           " Show as much as possible of the last line.
set inccommand=nosplit                              " visual feedback while substituting

set noshowmode                                      " Don't show current mode in command-line since we have airline
set noshowcmd                                       " Dont' Show already typed keys when more are expected.
set conceallevel=2                                  " set this so we wont break indentation plugin
set undofile                                        " enable persistent undo
set undodir=/tmp                                    " undo temp file directory

set ttyfast                                         " Faster redrawing.
set lazyredraw                                      " Only redraw when necessary.
set redrawtime=10000
set re=1
set scrolljump=5

set splitbelow                                      " Open new windows below the current window.
set splitright                                      " Open new windows right of the current window.
set emoji                                           " enable emojis

set cursorline                                      " Find the current line quickly.
set wrapscan                                        " Searches wrap around end-of-file.
set report      =0                                  " Always report changed lines.
set synmaxcol   =200                                " Only highlight the first 200 columns.

set grepprg=rg\ --vimgrep                           " use rg as default grepper

set foldlevel=0                                     " open all folds by default
set foldmethod    =marker
set foldcolumn    =1
set foldopen     -=hor
set foldopen     +=jump
set foldtext=MyFoldText()
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
let &fcs='eob: '                                    " Remove ~ at end of buffer
set so=7                                            " Set 7 lines to the cursor  vertically - when moving using j/k
set ss=5                                            " Set 5 lines to the cursor horizontally
set cmdheight=1                                     " Height of the command bar

" No backup or swap, we have git for that
set nobackup
set nowb
set noswapfile

set updatetime=300

" Colors Settings
set termguicolors
colorscheme dracula
set background=dark

" }}}

" ======================== Plugins settings ===================== " {{{

"" built in plugins
let loaded_netrw = 0                                    " diable netew
let g:omni_sql_no_default_maps = 1                      " disable sql omni completion
let g:loaded_perl_provider = 0
let g:loaded_ruby_provider = 0
let g:python3_host_prog = '/usr/bin/python3'
let g:python_host_prog = '/usr/bin/python2'
" let g:ruby_host_prog = '/usr/local/bin/neovim-ruby-host'
let g:node_host_prog = '/usr/local/bin/neovim-node-host'

" * vim-rooter settings
" stop Rooter echoing the project directory:
let g:rooter_silent_chdir = 1

" * Vim-plug settings
" always open vim-plug in a vertical split on the right
let g:plug_window = 'noautocmd vertical botright new'

" * Indent Line settings
let g:indentLine_enabled = 1
let g:indentLine_setColors = 1
let g:indentLine_char = '┊'
"let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indent_blankline_extra_indent_level = -1
let g:indentLine_bufNameExclude = ['_.*', 'NERD_tree_*', 'coc-explorer']
let g:indentLine_fileTypeExclude = ['coc-explorer']


" * Completion and Coc Settings
" Navigate snippet placeholders using tab
let g:coc_snippet_next = '<Tab>'
let g:coc_snippet_prev = '<S-Tab>'



" Coc Explorer configuration

let g:coc_explorer_global_presets = {
\   '.vim': {
\     'root-uri': '~/.vim',
\   },
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   }
\ }


" * Emmet plugin settings
let g:user_emmet_leader_key='<leader>'


" * Airline Settings
let g:airline_theme = 'dracula'
let g:airline_skip_empty_sections = 1
let g:airline_left_sep = ''
" let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline_right_sep = ''
let g:airline_powerline_fonts = 1
let g:bufferline_echo = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let airline#extensions#coc#error_symbol = '●:'
let airline#extensions#coc#warning_symbol = '▲:'
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'



" * Fzf Settings
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


let g:fzf_tags_command = 'ctags -R'
" Border color
"
" let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.7, 'border': 'sharp' } }
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'border': 'sharp' } }
" let g:fzf_layout = { 'down': '40%' }

let $FZF_DEFAULT_OPTS = '--info=inline'
let $FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git/**' "

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

" }}}

" ======================== Functions ============================ " {{{

" * Completion and Coc Settings
" check if last inserted char is a backspace (used by coc pmenu)"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" show docs on things with K
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" check if last inserted char is a backspace (used by coc pmenu)"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction



" * Codi Settings
function! s:codi_enter()
  set noshowmode
  set scrolloff=999
endfunction

function! s:codi_leave()
  set showmode
  set scrolloff=4
endfunction

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

" Fold function
function MyFoldText()
  let line = getline(v:foldstart)
  let sub = substitute(line, '/\*\|\*/\|{{{\d\=', '', 'g')
  return v:folddashes . sub
endfunction

" }}}

" ======================== Commands ============================= "
" {{{

" * Goyo Commands
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" * Codi Cammands
autocmd! User CodiEnterPre nested call<SID>codi_enter()
autocmd! User CodiLeavePre nested call<SID>codi_leave()

" * Coc Explorer
" Don't let vim open files in Coc-Explorer buffer.
autocmd BufEnter * if bufname('#') =~# "coc-explorer" && winnr('$') > 1 | b# | endif

"Close vim if that last window is the Coc-Explorer
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

" * Coc Completion
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
" coc completion popup
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" remove trailing whitespaces before saving
au BufWritePre * :%s/\s\+$//e

" }}}

" ======================== Custom Mappings ====================== "
" {{{

" Close buffer
nmap <leader>q :bd<CR>

" Reload config
nmap <leader>r :so ~/.config/nvim/init.vim<CR>

" disable hl with 2 esc
noremap <silent><esc> <esc>:noh<CR><esc>

" Split Navingation Mapping
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Changing the leader to Space
let mapleader = ","
let maplocalleader = ","

" Fzf Mapping
map <C-f> :Files<CR>
map <leader>f :Files<CR>
map <leader>b :Buffers<CR>
nnoremap <leader>g :Rg<CR>
nnoremap <leader>t :Tags<CR>
nnoremap <leader>m :Marks<CR>

nnoremap <C-p> :FZF<CR>
nnoremap <leader>p :FZF<CR>

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

" <TAB>: completion.
" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Coc Explorer configuration
nmap <leader>x :CocCommand explorer --preset simplify<CR>

" Coc-yank settings
nnoremap <silent> <leader>y  :<C-u>CocList -A --normal yank<cr>

" }}}
