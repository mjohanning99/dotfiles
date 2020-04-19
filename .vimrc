 ".vimrc Marvin Johanning @ marvinjohanning.de
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'vim-airline/vim-airline' "Airline status bar
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-syntastic/syntastic' "Syntax check
Plugin 'scrooloose/nerdtree' "NerdTree, file tree
Plugin 'ctrlpvim/ctrlp.vim' "CtrlP
Plugin 'dylanaraps/wal.vim' "Pywal
Plugin 'tpope/vim-surround' "For better surrounding
Plugin 'christoomey/vim-system-copy'
Plugin 'terryma/vim-smooth-scroll' "Smooth scrolling
Plugin 'mhartington/oceanic-next' "Theme OceanicNext
Plugin 'jacoborus/tender.vim' "Theme Tender
" Plugin 'thoughtbot/vim-rspec' "RSpec Plugin
Plugin 'MikeCoder/markdown-preview.vim' "Markdown preview
Plugin 'lervag/vimtex' " LaTeX 

" All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on

"Other plugin stuff
let g:airline#extensionstabline#enabled=1
let g:airline_powerline_fonts=1
let g:airline_theme='luna'
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

"Key Mapping
let mapleader=","
autocmd FileType ruby nnoremap <leader>c I#<ESC>
autocmd FileType vim nnoremap <leader>c I"<ESC>
autocmd FileType vim inoremap <leader>fc function! ()<CR><+++><CR>endfunction<ESC>3b<ESC>i
autocmd FileType ruby inoremap <leader>fc def ()<CR><+++><CR>end<ESC>3b<ESC>i
let g:ctrlp_map = '<c-p>' " For CtrlP Plugin
let g:ctrlp_cmd = 'CtrlP' 
noremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-l> :call ToggleRelativeNumbers()<CR>
nnoremap <C-h> :call ToggleHighlights()<CR>
"Ctrl + A will yank entire file
nnoremap <C-a> ggVGy<CR> 
"nnoremap da ggVGdd<CR>
nnoremap <C-z> <ESC>u
"leader plus ( will create () and put user inside
nnoremap <leader>" viw<ESC>a"<ESC>bi"<ESC>lel
nnoremap <leader>' viw<ESC>a'<ESC>bi'<ESC>ll
nnoremap <Space><Space> <kDivide><+++><CR>ca<
"- will delete the line and paste it on the line below
nnoremap - 0y$Do<ESC>p$i<ESC>
"Open .vimrc (ev) and source it (sv)
nnoremap ev :vsplit $MYVIMRC<CR>
nnoremap sv :source $MYVIMRC<CR>
"Smooth scrolling mappings
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>
"RSpec mappings
"map <Leader>t :call RunCurrentSpecFile()<CR>
"map <Leader>s :call RunNearestSpec()<CR>
"map <Leader>l :call RunLastSpec()<CR>
"map <Leader>a :call RunAllSpecs()<CR>

"For creating German-style quotation for LaTeX's babel package
nnoremap <leader>q i"`<+++>"'<ESC> 
let g:vimtex_view_general_viewer = 'zathura' " Setting Zathura as the default viewer for LaTeX

"Colour stuff
syntax on
"colorscheme jellybeans
"colorscheme tender
colorscheme wal

"Functions
function! ToggleHighlights()
  if &hlsearch == 1
    set nohlsearch
  else
    set hlsearch
  endif
endfunction

function! ToggleRelativeNumbers()
  if &rnu == 1
    set nornu
  else
    set rnu
  endif
endfunction

"Other
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set number "line numbers enabled
set relativenumber "Relative line numbers 
set hlsearch "highlight all occurences of a word that was searched  
set noeb vb t_vb= "Beeping can fuck right off
set t_ut="" "Disabling Vim's 'Background Color Erase' option to mitigate the problem of wrong background colour rendering
set breakindent "For better indentation
autocmd BufWritePost config.h !sudo make clean install
