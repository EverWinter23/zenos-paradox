"*****************************************************************************
"" Vim-PLug core
"*****************************************************************************
let vimplug_exists=expand('~/.vim/autoload/plug.vim')

if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent exec "!\curl -fLo " . vimplug_exists . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

" Required:
call plug#begin(expand('~/.vim/plugged'))


"*****************************************************************************
"" Plug install packages
"*****************************************************************************
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ryanoasis/vim-devicons'
""Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'davidhalter/jedi-vim'
Plug 'ycm-core/YouCompleteMe'
Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}
Plug 'rafi/awesome-vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'dylanaraps/wal.vim'

" React and Typescript
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'mattn/emmet-vim'
Plug 'alvan/vim-closetag'
Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json','graphql', 'markdown', 'vue', 'yaml', 'html'] }

" Haxe
Plug 'jdonaldson/vaxe'
"" Include user's extra bundle
if filereadable(expand("~/.vimrc.local.bundles"))
  source ~/.vimrc.local.bundles
endif

call plug#end()


"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
""Auto Reload vimrc on change
autocmd! bufwritepost .vimrc source %

"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set ttyfast

"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overridden by autocmd rules
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set mouse=a

"" Map leader to <SPACE>
nnoremap <SPACE> <Nop>
let mapleader=' '

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set nowrap

set fileformats=unix,dos,mac

if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh

  endif

" session management
let g:session_directory = "~/.vim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

" PAIRS
" inoremap " ""<left>
" inoremap ' ''<left>
" inoremap ( ()<left>
" inoremap [ []<left>
" inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
inoremap jj <ESC>
inoremap hh <esc>ha
inoremap ll <esc>la

" SYSTEM CLIPBOARD
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax on
set ruler
set number

" To resize vim splits inside tmux
if &term =~ '^screen'
      " tmux knows the extended mouse mode
      set ttymouse=xterm2
endif

let no_buffers_menu=1
silent! colorscheme molokai

set mousemodel=popup
set t_Co=256
set guioptions=egmrti
set gfn=Monospace\ 10

let g:indentLine_enabled = 1
let g:indentLine_concealcursor = 0
let g:indentLine_char = '┆'
let g:indentLine_faster = 1


if &term =~ '256color'
  set t_ut=
endif

"" Disable the blinking cursor.
set gcr=a:blinkon0
set scrolloff=3

"" Status bar
set laststatus=2

"" Use modeline overrides
set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" Popupmenu color
highlight Pmenu ctermbg=0 ctermfg=6
highlight VertSplit cterm=NONE

" Lightline theme
" let g:lightline = {'colorscheme': 'wombat'}

" NERD TREE
map <C-b> :NERDTreeToggle<CR>
au VimEnter * NERDTree | wincmd p
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let NERDTreeMinimalUI = 1
let NERDTreeShowHidden=1
let g:NERDTreeWinPos = "left"
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 25
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite

" CTRLP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = 'node_modules\|target\|git\|htmlcov\|migrations\|pyvenv'
let g:ctrlp_show_hidden = 1

"*****************************************************************************
"" Python
"*****************************************************************************
let g:jedi#popup_on_dot = 0
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "0"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#smart_auto_mappings = 0

"*****************************************************************************
"" Golang
"*****************************************************************************
let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_structs = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_space_tab_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_extra_types = 1
let g:syntastic_go_checkers = ['go', 'golint', 'errcheck']

"*****************************************************************************
" Rust
"*****************************************************************************
nnoremap <leader>g :YcmCompleter GoToDeclaration<CR>

"*****************************************************************************
" React and Typescript
"*****************************************************************************
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
let g:user_emmet_leader_key=','

let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml,js'
let g:closetag_xhtml_filetypes = 'xhtml,jsx,js'

let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }
let g:closetag_shortcut = '>'
"let g:closetag_close_shortcut = '<leader>>'

" AIRLINE THEMES "
colo wal
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='wal'
set ambiwidth=double
let NERDTreeDirArrowExpandable = "\u00a0"
let NERDTreeDirArrowCollapsible = "\u00a0"
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:DevIconsEnableFolderExtensionPatternMatching = 1

let g:DevIconsDefaultFolderOpenSymbol=''
let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol=''

" Custom icons for file extensions
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['py'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['sh'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['js'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['ts'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['json'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['yml'] = '侮'
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['html'] = ''


let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols = {} " needed
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['.test.ts'] = 'ﭧ'

" Custom icons for specific filenames
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols = {} " needed
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['Dockerfile'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['.env'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesPatternSymbols['docker'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['ormconfig.js'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['.editorconfig'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExactSymbols['.npmrc'] = ''

