nmap <C-m> :TagbarToggle<CR>
map <C-n> :NERDTreeToggle<CR>
map <C-s> :FormatCode<CR>
map <S-w> :VimspectorReset<CR>
" map <C-e> :norm i
nmap <leader><space> :noh <CR>
nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>

" typescript coc shortcut
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <leader>q :bp<CR>
nnoremap <leader>w :bn<CR>

" intelisense typescript configuration
" Remap keys for applying codeAction to the current line.
nmap <leader>ca  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

nnoremap <Leader>dd :call vimspector#Launch()<CR>
nnoremap <Leader>dr :call vimspector#Reset()<CR>
nnoremap <Leader>dc :call vimspector#Continue()<CR>

nnoremap <Leader>b :call vimspector#ToggleBreakpoint()<CR>
nnoremap <Leader>B :call vimspector#ClearBreakpoints()<CR>

nmap <Leader>di <Plug>VimspectorBalloonEval
xmap <Leader>di <Plug>VimspectorBalloonEval
