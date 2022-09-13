set nocompatible        " choose no compatibility with legacy vi

filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" plugin management
Plugin 'gmarik/Vundle.vim'
"Plugin 'MarcWeber/vim-addon-manager'

" Utilities
Plugin 'mileszs/ack.vim'
Plugin 'kien/ctrlp.vim' " ctrlp 
Plugin 'tacahiroy/ctrlp-funky' " support for ctrlp 
Plugin 'tpope/vim-surround' " surround everything
Plugin 'tomtom/tcomment_vim' " comments
Plugin 'taglist.vim' " list tags
Plugin 'tpope/vim-fugitive' " for git status
Plugin 'tmhedberg/matchit' " go to closing brackets
Plugin 'rking/ag.vim' " ag for faster search
Plugin 'scrooloose/nerdtree' " Tree browse files and folders
Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'garbas/vim-snipmate' " new version snipmate
Plugin 'honza/vim-snippets' " Optional snippets support for snipMate
" Plugin 'jarijokinen/snipmate.vim' " Optional for snipmate uppercase
" Plugin 'msanders/snipmate.vim' " Optional for snipmate uppercase
" Plugin 'yegappan/mru' " file recent
" Plugin 'scrooloose/syntastic' " syntax checker
" Plugin 'StanAngeloff/php.vim' " php syntax checker
" Plugin 'tomtom/checksyntax_vim' " syntax checeker
Plugin 'Raimondi/delimitMate' " auto closing bracket, parenthis ,etc
Plugin 'rstacruz/sparkup' " sparkup
Plugin 'Shougo/neocomplcache.vim' " auto complete
Plugin 'Shougo/neocomplete.vim.git' " autocompete
Plugin 'Shougo/neosnippet-snippets' "snippets neocomplete
Plugin 'Shougo/neosnippet.vim' " neocomplete support

" Appearances
Plugin 'bling/vim-airline' " for statusline
Plugin 'altercation/vim-colors-solarized' " for solarized theme
Plugin 'drmikehenry/vim-fontsize' " for fontsize in gvim
Plugin 'Wombat' " Wombat theme
Plugin 'itchyny/landscape.vim'
Plugin 'xolox/vim-colorscheme-switcher' "colorscheme switcher
Plugin 'xolox/vim-misc' "support vim-colorscheme-switcher
Plugin 'jakobwesthoff/whitespacetrail'
Plugin 'edkolev/tmuxline.vim' "tmuxline color

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on " load filetype plugins + indentation

syntax enable
set encoding=utf-8
set showcmd     " display incomplete commands
set wildmenu
set noswapfile
set mouse=a
let mapleader="," " change the mapleader from \ to ,


" Whitespaces
set nowrap      " don't wrap lines
set tabstop=4 softtabstop=0 noexpandtab shiftwidth=4  " a tab is x spaces
set expandtab     " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode


" Searching
set hlsearch      " highlight matches
set incsearch     " incremental searching
set ignorecase      " searches are case sensitive...
set smartcase     " ...unless they contain at least one capital letter
highlight Search cterm=underline
command! H let @/=""


" Abbreviations
abbrev pft PHPUnit_Framework_TestCase

abbrev gm !php artisan generate:model
abbrev gc !php artisan generate:controller
abbrev gmig !php artisan generate:migration

" snipmate
let g:snipMate = {}
let g:snipMate.scope_aliases = {}
let g:snipMate.scope_aliases.php = 'php,laravel'

" neocomplete 
let g:neocomplete#enable_at_startup = 1
"let g:neocomplcache_enable_at_startup = 1

" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" neocomplete key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
" inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-w>  neocomplete#cancel_popup()
" Close popup by <Space>.
" inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags


" neosnippet configuration
let g:neosnippet#disable_runtime_snippets = {
    \   '_' : 1,
    \ }

" neosnippet key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'


" Tags & Navigations
set tags=./tags,./gems.tags;
let g:ctrlp_extensions = ['tag']
let Tlist_Show_One_File = 1 " Taglist to show only 1 file tags
let Tlist_Use_Right_Window = 1 " Taglist to show on the right sidebar
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
let g:ctrlp_working_path_mode = ''

"set ignore folders while calling ctrlP
set wildignore+=*/vendor/**
set wildignore+=*/node_modules/**
set wildignore+=*/bower_components/**
" funky ctrlp
let g:ctrlp_funky_sort_by_mru = 1
let g:ctrlp_use_caching = 0


" Appearances
set t_Co=256 " force vim to use 256 color
let g:solarized_termcolors=256      " use solarized 256 fallback
" set background=dark " use dark as default
set laststatus=2
set noshowmode
set number
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='badwolf'
let g:Powerline_symbols = 'fancy'
colorscheme xoria256
" set cursorline
set t_ut=

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']


" Autocommands
if has('autocmd')
  autocmd bufwritepost .vimrc source $MYVIMRC " source .vimrc file after saving it
  " Open markdown files with Chrome.
  autocmd BufEnter *.md exe 'nnoremap <leader>p :!chromium %:p<CR>'
endif

autocmd CursorHold * set nohlsearch
autocmd CursorMoved * set hlsearch


" gvim setup
if has('gui_running')
  set guifont=Inconsolata\ for\ Powerline\ Medium\ 12 " set default font to Inconsolate 12
  set guioptions-=T  " remove toolbar
  set guioptions-=r  " remove right-hand scroll bar
  set guioptions-=L  " remove right-hand scroll bar
  set guioptions-=m  " remove menu
  set t_Co=256
  set term=screen-256color
endif


" mapping

map <F2> :NERDTreeToggle <CR>
map tt gt<CR>
map <C-f> :MRU<Enter>
map! jj <Esc>
map <Space> :
map <C-d> gcc
map <leader>d gcip<CR>

" mapping paste
nnoremap <F3> :set invpaste paste?<CR>
set pastetoggle=<F3>
" set showmode

" Laravel framework commons
nmap <leader>lr :e app/routes.php<CR>
nmap <leader>lca :e app/config/app.php<CR>
nmap <leader>lcd :e app/config/database.php<CR>
nmap <leader>lc :e composer.json<CR>

" toggle taglist
nnoremap <leader>t :TlistToggle<CR>

" prepare a new php class
function! Class()
    let name = input('Class name? ')
    let namespace = input('Any Namespace? ')


    if strlen(namespace)
        exec 'normal I<?php namespace ' . namespace . ';'
    else
        exec 'normal I<?php'
    endif

    " Open class
    exec 'normal Iclass ' . name

    exec 'normal Ipublic function __construct() {}'
endfunction    
