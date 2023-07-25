set nocompatible
execute pathogen#infect()
filetype plugin indent on
syntax enable
highlight Comment term=bold cterm=bold ctermfg=5

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
let mapleader = ","

" vimspector
let g:vimspector_install_gadgets = ['CodeLLDB']
" for blueyed/vim-diminactive
let g:diminactive_enable_focus = 2


" for NERDTree
let g:NERDTreeWinSize = 30


" termdebug
packadd termdebug

augroup remember_folds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup END

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
" variable

let g:coc_global_extensions = ['coc-tsserver']
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'   

colorscheme jellybeans
