"" General settings
"" ----------------
set guicursor=
set nocompatible
filetype plugin indent on
syntax enable
set number
let mapleader=","
"" Always yank to X11 clipboard buffer
set clipboard=unnamedplus
" Undo history
set history=1000
" Nice filename completion
set wildmenu
set wildmode=list:longest,full
set title
set scrolloff=2
" Turn off any annoying beeping, bells, or flashes
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=
" Remember some state after quitting vim
set viminfo='20,<50,s10,h,%
" Put all vim swap files in ~/.vim-swp
" I find it annoying to have vim swap files scattered all over
" You must mkdir ~/.vim-swp
set backupdir=~/.vim-swp,~/.swp,~/swp,/var/swp,/swp
set directory=~/.vim-swp,~/.swp,~/swp,/var/swp,/swp
set backupcopy=yes
set incsearch
set hlsearch
" case-insensitive searching by default
" if you search with a cap, then it's automatically case-sensitive
set ignorecase
set smartcase
"" Status line
set laststatus=2 " show statusline by default
set statusline=%F[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
" Avoid double spaces with J or gq
set nojoinspaces

"" Whitespace tabs
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab autoindent
"" Wrap at 99 instead of 79
" set textwidth=99


"" Installations with vim-plug
"" ---------------------------
call plug#begin('~/.local/share/nvim/plugged')
Plug 'Shougo/deoplete.nvim'
Plug '~/.fzf'  " Autocompletion
Plug 'majutsushi/tagbar'
Plug 'rustushki/JavaImp.vim'
Plug 'neomake/neomake'
Plug 'vim-scripts/SearchComplete'
Plug 'chrisbra/csv.vim'
Plug 'junegunn/goyo.vim'
call plug#end()


"" Key mappings
"" ------------
" Deletes trailing whitespace
map <F12> :%s/\s\+$//e<cr>
imap jk <Esc>
nmap <F8> :TagbarToggle<CR>
" Faster tabs
map <C-h> :tabprev<cr>
map <C-l> :tabnext<cr>
map <C-J> :tabfirst<cr>
map <C-K> :tablast<cr>
map <C-n> :Te<cr>
" Find with fzf
map <Leader>f :FZF<cr>
" Cycle through neomake errors
" Toggle word processing mode (useful for spellcheck)
map <F2> :setlocal spell! spelllang=en_us<cr>
" next buffer
map <Leader>n :bnext<cr>

"" Save and run ctags
" map <C-t> :!ctags  -R -f .git/tags .<cr>

"" Use pydoc for keywordprg in *.py
autocmd BufNewFile,BufRead *.py set keywordprg=pydoc

"" Change working directory to the one for the current file
command Cwd cd %:p:h

"" Check the current folder for tags file
" The ;/ suffix directs vim to do an upward search and stop at home
set tags=tags;$HOME

"" Misc. options
"" -------------

"" Java import plugin options
let g:JavaImpPaths =
  \ $HOME . "/kbase/kb_sdk/src/java," .
  \ $HOME . "/kbase/njs_wrapper/src," .
  \ $HOME . "/kbase/jars/lib/jars,"
let g:JavaImpDataDir = $HOME . "/.cache/vim-java-imp"

"" deoplete options
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

"" neomake options
call neomake#configure#automake('w')
let g:neomake_python_enabled_makers = ['flake8', 'python', 'mypy']
let g:neomake_java_enabled_makers = ['gradle']
let g:neomake_java_javac_autoload_eclipse_classpath = 1
let g:neomake_java_javac_classpath = ''
" let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_javascript_enabled_makers = ['standard']

"" Colors
"" ------

" hi Visual term=reverse cterm=reverse guibg=DarkGray guifg=White
" Visual text highlight -- white on dark grey
hi Visual ctermbg=DarkGray ctermfg=255

