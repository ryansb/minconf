set nocompatible
filetype off  " required!
filetype plugin off
filetype plugin indent on     " required!

set background=dark
colorscheme desert

"Map , as the leader key
let mapleader = ","

""""""Die, Error bells
set noerrorbells

""""""Visual
" Shorten error messages, and get rid of some obnoxious ones
set shortmess=atI

syntax on
syntax sync fromstart

""""""Visual
set number
set showmode
set wrap
set wrapmargin=8000
set background=dark
set ruler
set backspace=start,indent,eol
set showmatch       " Briefly jump to a paren once it's balanced
set matchtime=2     " Do so for exactly 2 seconds
set scrolloff=5 "Keep the cursor at least 5 lines from the top and bottom

""""""Buffer management
" Use +/- to change window height
" Use * and / to change width
if bufwinnr(1)
	map <kPlus> <C-W>+
	map <kMinus> <C-W>-
	map <kDivide> <c-w><
	map <kMultiply> <c-w>>
endif

""""""Indentation
set shiftwidth=3
set tabstop=3
set listchars=tab:>-,trail:-,eol:$,nbsp:%
set list
" This turns indentation into just 'start at the same as previoius line'
"set autoindent
"set nosmartindent
"set nocindent
" Convert file between spaces and tabs
map <leader>t :%s/    /\t/gg<CR>
map <leader>T :%s/\t/    /gg<CR>

""""""Terminal
set showcmd
set laststatus=2
"fancy status bar
set statusline=%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ L#:\ %l/%L:%c\ \ FT:%Y\ \ %P
set report=0        " Show number of lines changed by : commands
set ch=1 "Set height of command line
"levels of undo
set history=1000
set undolevels=1000

" Function to return current directory for status line
function! CurDir()
	let curdir = substitute(getcwd(), '/home/ryansb/', "~/", "g")
		return curdir
	endfunction

"Search things
nmap <silent> ,/ :nohlsearch<CR> 
set hlsearch
set gdefault
set incsearch
"ignore search case with all lowercase, use case when all uppercase
set ignorecase
set smartcase

""""""Encoding
set encoding=utf-8  " Set file encoding
set termencoding=utf-8

set nobackup
set noswapfile
set noautowrite      " When I want to write to a file, I'll say so
set noautowriteall
set autoread         "Re-read open files when they are changed outside Vim

"""""FileType specific settings
" Autocomplete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType python inoremap <Nul> <C-x><C-o>
autocmd FileType perl set omnifunc=perlcomplete#CompletePerl

" Python stuff
let python_highlight_all=1

" Highlight whitespace
highlight BadWhitespace ctermbg=red guibg=red
" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Map ; to : for great pythonic justice
autocmd FileType python inoremap ; :
autocmd FileType python inoremap : ;

" set foldmethod (fdm) to be indent-based for Python
autocmd FileType python set fdm=indent
autocmd FileType python set expandtab
autocmd FileType python set ts=4
autocmd FileType python set shiftwidth=4

""""""Keybindings
" Map ; to : in normal mode for mega-easy vim commands.
nnoremap ; :

"let jj get you out of insert mode
inoremap jj <ESC>

" reflow paragraph with Q in normal and visual mode
nnoremap Q gqap
vnoremap Q gq

" Let Y yank to end of line like C and D
nnoremap Y y$

"w!! writes the file using sudo
cmap w!! w !sudo tee % >/dev/null

" Word swapping
nmap <silent> gw "_yiw:s/\(\%#\w\+\)\(\W\+\)\(\w\+\)/\3\2\1/<cr><c-o><c-l>

" Character swapping
nmap <silent> gc xph

" tabs
" create a new tab
map :tc :tabnew %<cr>
" close a tab
map :td :tabclose<cr>

"let me add newlines by hitting enter in normal mode
""nmap <CR> o<ESC>

"Insert timestamp on next line
map <F5> :r!date<CR>

" Bindings for code folding
nnoremap zz zO
nnoremap Zz zM
nnoremap zZ zR

"go vertical even with line wraps and don't jump
"noremap j gj
"noremap k gk

" Mappings to jump me to the beginning of functions
" Cred to Globe for these ones
map [[ ?{<CR>w99[{
map ][ /}<CR>b99]}
map ]] j0[[%/{<CR>
map [] k$][%?}<CR>

" take you out of insert mode after being inactive for a while
" au CursorHoldI * stopinsert

" Toggle paste/nopaste
map <Leader>ip :set invpaste invnumber invlist<CR>

" Yank to system clipboard
map <Leader>y "+y

" Clear registers
function! ClearReg()
	let regs='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"'
	| let i=0 | while (i<strlen(regs)) | exec 'let @'.regs[i].'=""' |
		let i=i+1 | endwhile | unlet regs'"'
	return ""
	endfunction
map <Leader>cr :call ClearReg()<CR>
