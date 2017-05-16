
" Load Ctrl-p
set runtimepath^=~/.vim/bundle/ctrlp.vim
set runtimepath^=~/.vim/bundle/clojure

" Prevents some errors with file watcher scripts
set nowritebackup

" Always yank to X11 clipboard buffer
set clipboard=unnamedplus

" Load Pathogen
execute pathogen#infect()

set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" Ignore for ctrlp
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$\|public\/client',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

" Line numbers
set number

" Make the <leader> key the comma key
let mapleader=","

" Syntax highlighting
syntax on

" Associate .es6 files as javascript files
au BufRead,BufNewFile *.es6 setfiletype javascript

" Undo history
set history=1000

" Nice filename completion
set wildmenu
set wildmode=list:longest,full

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
set statusline=%F[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P

" Avoid double spaces with J or gq
set nojoinspaces

"" Whitespace tabs
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab autoindent

" Set tabs to tab characters for makefiles
autocmd FileType make setlocal noexpandtab

" Show tabs with a vertical line to differntiate them from spaces
set listchars=tab:│\",
",
filetype plugin indent on",
",
"" Folding",
" I don't do very complicated folding. Select with v and then zf to fold. zd",
" to unfold. Simple.",
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
" Hit Ctrl-x over a word in a file to see its syntax groups
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
map <leader>e :CtrlP<cr>
" Open a file in a new tab
map <leader>t :tabedit<cr>:CtrlP<cr>
" Open a file in a new vertical split
map <leader>v :vsp<cr>:CtrlP<cr>
" Open a file in a new horizontal split
map <leader>s :sp<cr>:CtrlP<cr>

"" Faster tabs
map tl :tabfirst<cr>
map ti :tabnext<cr>
map tn :tabprev<cr>
map ty :tablast<cr>
map tt :tabedit<Space>
map tm :tabm<Space>
map te :Texplore<cr>

"" Quickly delete trailing whitespace, save and close
" map Q :%s/\s\+$//e \| :wq <cr>

"" Delete all trailing whitespace
map <F12> :%s/\s\+$//e<cr>

"" Split lines in command mode -- very handy
" nmap K i<S-cr><esc>k$

" Very quick saving
" (I don't care about default s -- cl is fast)
" map s :w<cr>

" Create line breaks in command mode
" map <cr> o<Esc>

"" Macros
" quickly run macro in slot 'q' using the spacebar
" nnoremap <Space> @q

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
" nnoremap ' `
" nnoremap ` '

" automatically wrap viewscript in html inside vs comment tags
" map <leader>v 0i<!--= <Esc>$a --><Esc>

" Colemak bindings from forum.colemak.com/viewtopic.php?id=50
source ~/.vim/colemak.vim

" Custom modificatoins of the above colemak.vim layout
nnoremap gt zt
nnoremap gm zz
nnoremap gb zb

nnoremap U :w<cr>
