" -------------------- vim-mapleader-settings-start ---------------------

" map mapleader
let mapleader=','

" -------------------- vim-mapleader-settings-end -----------------------



" -------------------- vim-plug-settings-start --------------------------

" automatic install vim-plug if it dose not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" end of automatic installation


" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" register vim-startify
Plug 'mhinz/vim-startify'

" register typescript-vim
Plug 'leafgarland/typescript-vim'

" register vim-javascript
Plug 'pangloss/vim-javascript'

" register html5.vim
Plug 'othree/html5.vim'

" register vim-pug
Plug 'digitaltoad/vim-pug'

" register vim-vue
Plug 'posva/vim-vue'

" register vim-gitgutter
Plug 'airblade/vim-gitgutter'

" register ctrlp.vim
Plug 'ctrlpvim/ctrlp.vim'

" register nerdtree
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" register nerdtree-git-plugin
Plug 'Xuyuanp/nerdtree-git-plugin'

" register YouCompleteMe
Plug 'Valloric/YouCompleteMe'

" register vim-airline
Plug 'vim-airline/vim-airline'

" register vim-fugitive
Plug 'tpope/vim-fugitive'

call plug#end()

" -------------------- vim-plug-settings-end --------------------------



" -------------------- vim-settings-of-MacOS-start --------------------

" Configuration file for vim
set modelines=0		" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

" -------------------- vim-settings-of-MacOS-end ----------------------



" -------------------- vim-javascript-setting-start -------------------

" enable JSDoc syntax
let g:javascript_plugin_jsdoc = 1

" enable flow syntax highlighting
" let g:javascript_plugin_flow = 1

" enable NGDocs syntax
" let g:javascript_plugin_ngdoc = 1

" enable conceal characters
set conceallevel=1

" toggle concealing
map <leader>c :exec &conceallevel ? "set conceallevel=0" : "set conceallevel=1"<CR>

" set concealings
let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
let g:javascript_conceal_noarg_arrow_function = "🞅"
let g:javascript_conceal_underscore_arrow_function = "🞅"

" -------------------- vim-javascript-setting-end ---------------------



" -------------------- vim-NERDTree-setting-start ---------------------

map <leader>g :NERDTreeToggle<CR>
map <leader>f :NERDTreeFind<CR>

" let nerdtree show hidden file
let NERDTreeShowHidden=1

" -------------------- vim-NERDTree-setting-end -----------------------



" -------------------- vim-YouCompleteMe-setting-end ------------------

nnoremap <leader>df :YcmCompleter GoToDefinition<CR>

" -------------------- vim-YouCompleteMe-setting-end ------------------



" -------------------- vim-gitgutter-setting-start --------------------

" this is a vim's option, but we set it here because the diff signs's update
" is uppon this option. The default value of this option is 4000ms, it's so
" slow, so we set it to 100ms.
set updatetime=300

" key maps
" map <leader>gge :GitGutterEnable
" map <leader>ggd :GitGutterDisalbe
map <leader>ggt :GitGutterToggle

" map <leader>gse :GitGutterSignsEnalbe
" map <leader>gsd :GitGutterSignsDisable
map <leader>gst :GitGutterSignsToggle

" -------------------- vim-gitgutter-setting-end --------------------



" -------------------- vim-airline-setting-start --------------------

" customize the section
function! AirlineInit()
  " section a: mode & VCS info; VCS info is provided by vim-fugitive
  let g:airline_section_a = airline#section#create(['mode', ' ', 'branch'])
  " section b: hunks info, provided by vim-gitgutter
  let g:airline_section_b = airline#section#create(['hunks'])
endfunction

autocmd VimEnter * call AirlineInit()

" enable tabline
let g:airline#extensions#tabline#enabled = 1

" customize the tabline separators
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '>'

" cache :hi calls for optimization
:let g:airline_highlighting_cache = 1

" enable none extensions for opimization
:let g:airline_extensions = ['tabline', 'hunks', 'branch']

" -------------------- vim-airline-settings-end ----------------------



" -------------------- self-settings-start ----------------------------

" code fold
set foldmethod=indent

" syntax
syntax on

" set line num
set nu

" set cursor
set cursorcolumn
set cursorline

" set autoindent
set autoindent

" set tab size
set expandtab
set softtabstop=2

" set shiftwidth 设置每层锁进的空格数目，建议跟 tabstop 相同
" 如果跟 tabstop 不同，则会出现比较奇怪的现象
set shiftwidth=2
set shiftround

" highlight the search result
set hlsearch

" ignore case when searching
set ignorecase

" Show line number on the current line and relative numbers on all other lines.
"set relativenumber

" Set the window’s title, reflecting the file currently being edited
"set title

" -------------------- self-settings-end ------------------------------
