" Load Ctrl-p
set runtimepath^=~/.vim/bundle/ctrlp.vim
set runtimepath^=~/.vim/bundle/clojure

set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" Line numbers
set number

" Syntax highlighting
syntax on
" Undo history
set history=1000

" Nice filename completion
set wildmenu
set wildmode=list:longest,full

"
set title

" Scroll padding of three lines at edge of screen. Increases visual context around cursor
set scrolloff=3

" Turn off any annoying beeping, bells, or flashes
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Automatically change dir to current buffer
set autochdir

" Remember some state after quitting vim
set viminfo='20,<50,s10,h,%

" Shorten interruptive prompts
set shortmess=atI

" Put all vim swap files in ~/.vim-swp
" I find it annoying to have vim swap files scattered all over
" You must mkdir ~/.vim-swp or vim will complain at you.
set backupdir=~/.vim-swp,~/.swp,~/swp,/var/swp,/swp
set directory=~/.vim-swp,~/.swp,~/swp,/var/swp,/swp

" enable 256 colors
set t_Co=256

set incsearch
set hlsearch
" case-insensitive searching by default
" if you search with a cap, then it's automatically case-sensitive
set ignorecase
set smartcase

"" Status line
set laststatus=2 " show statusline by default
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P

" Avoid double spaces with J or gq
set nojoinspaces

"" Whitespace
" Tabs for indentation, spaces for alignment
" universal tab width is 2 spaces
set tabstop=1
set softtabstop=1
set shiftwidth=1
set autoindent
set smartindent

" mark tabs with a subtle bar character to distinguish them with spaces
" especially useful when editing code with expandtab on
set list
set listchars=tab:│\ 

filetype plugin indent on

" Set tabs to two spaces in yaml files
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

"" Folding
" I don't do very complicated folding. Select with v and then zf to fold. zd
" to unfold. Simple.
set foldmethod=manual   "fold manually (i found syntax and indent modes annoying)
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use. wat.

" Avoid ENOENT errors with inotifywait, watchify, and other file modification
" watchers
set backupcopy=auto

" Colors
" ---

" Show highlighting groups for current word
" Ctrl-x
nmap <C-X> :call <SID>SynStack()<cr>
function! <SID>SynStack()
	if !exists("*synstack")
		return
	endif
	echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" ~/.vim/colors/mnm.vim
colorscheme mnm


"" Mappings

" Toggle word processing mode (mostly just useful for spellcheck)
map <F2> :setlocal spell! spelllang=en_us<cr>

" CtrlP file opener mappings
" <leader> is backslash
" Open a file in the current tab and pane
map <leader><leader> :CtrlP<cr>
" Open a file in a new tab
map <leader>t :tabedit<cr>:CtrlP<cr>
" Open a file in a new vertical split
map <leader>v :vsp<cr>:CtrlP<cr>
" Open a file in a new horizontal split
map <leader>s :sp<cr>:CtrlP<cr>

" Scroll up and down faster (by three lines instead of one)
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

""Entering command mode:
" jk has been my final happy place. It's so fast.
" might as well do accidental caps as well.
imap jk <Esc>
imap Jk <Esc>
imap JK <Esc>

"" Faster tabs
map th :tabfirst<cr>
map tk :tabnext<cr>
map tj :tabprev<cr>
map tl :tablast<cr>
map tt :tabedit<Space>
map tn :tabnext<cr>
map tm :tabm<Space>
map te :Texplore<cr>

"" Quickly delete trailing whitespace, save and close
map Q :%s/\s\+$//e \| :wq <cr>

"" Delete all trailing whitespace
map <F12> :%s/\s\+$//e<cr>

"" Split lines in command mode -- very handy
nmap K i<S-cr><esc>k$

" Very quick saving
" (I don't care about default s -- cl is fast)
map s :w<cr>

" Create line breaks in command mode
map <cr> o<Esc>

"" Macros
" quickly run macro in slot 'q' using the spacebar
nnoremap <Space> @q

"" Buffer
" list buffers and prompt to switch
set hidden
nnoremap <F5> :buffers<cr>:buffer <Space>
map <leader>n :bNext<cr>

"" Mark remaps
" list marks
noremap <F4> :mark<cr>
" Swap backtick with quote for mark jumping
" backtick jumps to position (line+col) of mark
" quote jumps to line only
" I think backtick is more useful than quote. But quote is more typable. So let's swap em.
nnoremap ' `
nnoremap ` '
