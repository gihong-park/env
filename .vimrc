set shell=/bin/bash
set autowrite
set rtp+=~/.vim/bundle/Vundle.vim
set backspace=indent,eol,start
set number

execute pathogen#infect()
filetype plugin indent on
nmap <C-m> :TagbarToggle<CR>
map <C-n> :NERDTreeToggle<CR>
map <C-s> :FormatCode<CR>
map <S-w> :VimspectorReset<CR>
nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>

call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'nanotech/jellybeans.vim'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'airblade/vim-gitgutter' " vim with git status(added, modified, and removed lines)
Plugin 'tpope/vim-fugitive' " vim with git command(e.g., Gdiff)
Plugin 'vim-airline/vim-airline' " vim status bar
Plugin 'vim-airline/vim-airline-themes'
Plugin 'blueyed/vim-diminactive'
Plugin 'pbondoer/vim-42header'
Plugin 'puremourning/vimspector'
Plugin 'jiangmiao/auto-pairs'
" Add maktaba and codefmt to the runtimepath.
" (The latter must be installed before it can be used.)
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.
Plugin 'google/vim-glaive'
call vundle#end()

set t_Co=256
set smartindent
set tabstop=2
set expandtab
set shiftwidth=2 " >> 또는 << 키로 들여 쓰기 할때 스페이스의 갯수. 기본값 8
" for jellybeans
colorscheme jellybeans


" the glaive#Install() should go after the "call vundle#end()"
call glaive#Install()
" Optional: Enable codefmt's default mappings on the <Leader>= prefix.
Glaive codefmt plugin[mappings]
Glaive codefmt google_java_executable="java -jar /path/to/google-java-format-VERSION-all-deps.jar"
" for taglist
" nmap <F8> :Tagbar<CR>

" for indent guide
let g:indentguides_spacechar = '┆'
let g:indentguides_tabchar = '|'
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

" let g:vimspector_base_dir=expand( '$HOME/.vim/vimspector-config' )
let g:vimspector_base_dir='/Users/kihongpark/.vim/vimspector-config'
" for vim-airline
let g:airline#extensions#tabline#enabled = 1 " turn on buffer list
let g:airline_theme='hybrid'
let g:vimspector_enable_mappings = 'HUMAN'
set laststatus=2 " turn on bottom bar
let mapleader = ","
nnoremap <leader>q :bp<CR>
nnoremap <leader>w :bn<CR>

" vimspector
let g:vimspector_install_gadgets = ['CodeLLDB']
" for blueyed/vim-diminactive
let g:diminactive_enable_focus = 2

" ...
" the glaive#Install() should go after the "call vundle#end()"
call glaive#Install()
" Optional: Enable codefmt's default mappings on the <Leader>= prefix.
Glaive codefmt plugin[mappings]
Glaive codefmt google_java_executable="java -jar /path/to/google-java-format-VERSION-all-deps.jar"

syntax enable
filetype indent on
highlight Comment term=bold cterm=bold ctermfg=4

" termdebug
packadd termdebug
" vimspector config
let g:vimspector_terminal_maxwidth = 35
let g:vimspector_terminal_minheight= 85

let g:vimspector_bottombar_height = 10

function! s:SetUpUI() abort
  call win_gotoid( g:vimspector_session_windows.output )

  call win_gotoid( g:vimspector_session_windows.code )
endfunction

augroup VimspectorCustom
  au!
  autocmd User VimspectorUICreated call s:SetUpUI()
augroup END
