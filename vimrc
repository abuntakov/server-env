scriptencoding utf-8
set encoding=utf-8

set nocompatible

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'

Plug 'easymotion/vim-easymotion'

Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-indent'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'scrooloose/nerdtree'
Plug 'Raimondi/delimitMate'
Plug 'Chiel92/vim-autoformat'
Plug 'kshenoy/vim-signature'

" syntax
Plug 'sheerun/vim-polyglot'
Plug 'ap/vim-css-color'
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'othree/yajs.vim'
Plug 'gre/play2vim'

" programming
Plug 'mattn/emmet-vim'

call plug#end()


let mapleader=","
let &t_Co=256
colorscheme darkblue
colorscheme gruvbox
syntax on

set ignorecase
set tabstop=3
set shiftwidth=3
set smartindent
set showmatch " показывать первую парную скобку после ввода второй
set laststatus=2
set hlsearch
set cursorline
set noswapfile
set previewheight=40 " Высота блока preview (например для git status)
set ffs=unix,dos,mac
set fencs=utf-8,cp1251,koi8-r,ucs-2,cp866
set hidden
set splitbelow
set splitright
set showcmd
set mouse=a
set number

set list
set listchars=
set listchars+=tab:\ \ 
set listchars+=trail:·
set listchars+=extends:»              " show cut off when nowrap
set listchars+=precedes:«
set listchars+=nbsp:⣿
set listchars+=eol:¬

set wildignore+=*/node_modules/**
set wildignore+=*/target/**
set wildignore+=.git,.hg,.svn
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*,*.gem,*/target/*
set wildignore+=*.aux,*.out,*.toc
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest,*.rbc,*.class
set wildignore+=*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp
set wildignore+=*.avi,*.m4a,*.mp3,*.oga,*.ogg,*.wav,*.webm
set wildignore+=*.eot,*.otf,*.ttf,*.woff
set wildignore+=*.doc,*.pdf
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*.swp,.lock,.DS_Store,._*

let g:EasyMotion_smartcase = 1

" delimate
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1

"""""""""""""""""""""""""""""
" signature
"""""""""""""""""""""""""""""
		let g:SignatureMap = {
		  \ 'Leader'             :  "m",
		  \ 'PlaceNextMark'      :  "m,",
		  \ 'ToggleMarkAtLine'   :  "m.",
		  \ 'PurgeMarksAtLine'   :  "m-",
		  \ 'DeleteMark'         :  "dm",
		  \ 'PurgeMarks'         :  "m<Space>",
		  \ 'PurgeMarkers'       :  "m<BS>",
		  \ 'GotoNextLineAlpha'  :  "')",
		  \ 'GotoPrevLineAlpha'  :  "'(",
		  \ 'GotoNextSpotAlpha'  :  "`)",
		  \ 'GotoPrevSpotAlpha'  :  "`(",
		  \ 'GotoNextLineByPos'  :  "]'",
		  \ 'GotoPrevLineByPos'  :  "['",
		  \ 'GotoNextSpotByPos'  :  "]`",
		  \ 'GotoPrevSpotByPos'  :  "[`",
		  \ 'GotoNextMarker'     :  "[+",
		  \ 'GotoPrevMarker'     :  "[-",
		  \ 'GotoNextMarkerAny'  :  "]=",
		  \ 'GotoPrevMarkerAny'  :  "[=",
		  \ 'ListBufferMarks'    :  "m/",
		  \ 'ListBufferMarkers'  :  "m?"
		  \ }

let g:polyglot_disabled = ['javascript']
let g:javascript_enable_domhtmlcss = 1

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'down': '35%'})



nmap <silent> <End> :edit!<CR>
nmap <silent> <Del> :bdelete<CR>
nmap <silent> <C-Del> :tabc<CR>
nmap <silent> <Ins> :tabnew<CR>

nmap <silent> <leader>f :Files<CR>
nmap <silent> <leader>hi :History<CR>
nmap <silent> <leader>b :Buffers<CR>
nmap <silent> <leader>w :Windows<CR>
nmap <silent> <leader>ll :Lines<CR>
nmap <silent> <leader>lb :BLines<CR>
nmap <silent> <leader>gf :GitFiles<CR>
nmap <silent> <leader>m :Marks<CR>

nnoremap <silent> <Space>/ :execute 'Ag ' . input('Ag/')<CR>
nnoremap <silent> K :call SearchWordWithAg()<CR>
vnoremap <silent> K :call SearchVisualSelectionWithAg()<CR>

function! SearchWordWithAg()
	execute 'Ag' expand('<cword>')
endfunction

function! SearchVisualSelectionWithAg() range
	let old_reg = getreg('"')
	let old_regtype = getregtype('"')
	let old_clipboard = &clipboard
	set clipboard&
	normal! ""gvy
	let selection = getreg('"')
	call setreg('"', old_reg, old_regtype)
	let &clipboard = old_clipboard
	execute 'Ag' selection
endfunction

" easy motion
map  	<Space>f <Plug>(easymotion-bd-f)
nmap 	<Space>f <Plug>(easymotion-overwin-f)

map  	<Space>t <Plug>(easymotion-bd-t)
nmap 	<Space>t <Plug>(easymotion-overwin-t)

" s{char}{char} to move to {char}{char}
nmap 	<Space><Space> <Plug>(easymotion-overwin-f2)

" Move to line
map	<Space>l <Plug>(easymotion-bd-jk)
nmap	<Space>l <Plug>(easymotion-overwin-line)

" Move to word
map  <Space>w <Plug>(easymotion-bd-w)
nmap <Space>w <Plug>(easymotion-overwin-w)

" easy align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" highlight word by *
nnoremap * *N

" highlight selected block in visual mode
vnoremap * y :execute ":let @/=@\""<CR> :execute "set hlsearch"<CR>

" off hightlight
nmap <silent> // :nohlsearch<CR>
noremap <leader>hl :set hlsearch! hlsearch?<CR>

nnoremap <silent> <F10> :qa<CR>
nnoremap <silent> <F5> :w<CR>
inoremap <silent> <F5> <Esc>:w<CR>

nmap	<silent> <F3>	:Autoformat<CR>
imap	<silent> <F3>	<Esc>:Autoformat<CR>

nmap <C-\> :NERDTreeFind<CR>
nmap <silent> <Bslash><Bslash> :NERDTreeToggle<CR>

cmap w!! %!sudo tee > /dev/null %"

" Toggle paste mode
nmap <silent> <F4> :set invpaste<CR>:set paste?<CR>
imap <silent> <F4> <ESC>:set invpaste<CR>:set paste?<CR>

imap jj <Esc>

" Map ctrl-movement keys to window switching
nmap <silent> <Tab>	<C-w>w

map <PageUp> <Nop>
map <PageDown> <Nop>
imap <PageUp> <Nop>
imap <PageDown> <Nop>

autocmd FileType html imap <PageDown> <CR><Esc>O


nmap <Space>h i<Space><Esc>l
nmap <Space>l a<Space><Esc>h

" Remove upper/down line
nmap d[ mz-dd`zdmz
nmap d] mz<CR>dd`zdmz

nmap [w :tabp<CR>
nmap ]w :tabn<CR>
