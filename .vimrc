" Prevents some errors with file watcher scripts
set nowritebackup
" Avoid ENOENT errors with inotifywait, watchify, and other file modification
" watchers
set backupcopy=auto

" Always yank to X11 clipboard buffer
set clipboard=unnamedplus

set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" Line numbers
set number

" Make the <leader> key the comma key
let mapleader=","

" Syntax highlighting
syntax on

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
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab autoindent

" Set tabs to tab characters for makefiles
autocmd FileType make setlocal noexpandtab

" Show tabs with a vertical line to differentiate them from spaces
set listchars=tab:│\",
",
filetype plugin indent on",
",

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

"" Mappings

" Toggle word processing mode (mostly just useful for spellcheck)
map <F2> :setlocal spell! spelllang=en_us<cr>

" <leader> is comma
" Open a file in a new tab
map <leader>t :tabedit<cr>:CtrlP<cr>
" Open a file in a new vertical split
map <leader>v :vsp<cr>:CtrlP<cr>
" Open a file in a new horizontal split
map <leader>s :sp<cr>:CtrlP<cr>

"" Faster tabs
map <C-h> :tabprev<cr>
map <C-l> :tabnext<cr>
map <C-n> :Tex<cr>

"" Delete all trailing whitespace
map <F12> :%s/\s\+$//e<cr>

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

" Important
imap jk <Esc>

" FZF
set rtp+=~/.fzf
map <leader>f :FZF<cr>

" Change text highlight colors
hi Search cterm=NONE ctermfg=white ctermbg=blue

"" Plugs
call plug#begin('~/.vim/plugged')
Plug 'neomake/neomake'
Plug 'cespare/vim-toml'
Plug 'Quramy/tsuquyomi'
Plug 'leafgarland/typescript-vim'
call plug#end()

" Configure neomake
let g:neomake_javascript_enabled_makers = ['standard']
" let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_c_clang_args = ['-Iutils']

function! MyOnBattery()
  return readfile('/sys/class/power_supply/AC/online') == ['0']
endfunction

if MyOnBattery()
  call neomake#configure#automake('w')
else
  call neomake#configure#automake('nw', 1000)
endif
