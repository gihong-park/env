" for tagbar
let g:tagbar_width = 25

" typescript tagbar configuration

let g:tagbar_type_typescript = {
    \ 'ctagstype': 'typescript',
    \ 'kinds': [
      \ 'c:classes',
    \ 'n:modules',
    \ 'f:functions',
    \ 'v:variables',
    \ 'v:varlambdas',
    \ 'm:members',
    \ 'i:interfaces',
    \ 'e:enums',
  \ ]
      \ }

let g:tagbar_type_typescriptreact = {
      \ 'ctagstype': 'typescript',
      \ 'kinds': [
    \ 'c:class',
  \ 'n:namespace',
  \ 'f:function',
  \ 'G:generator',
  \ 'v:variable',
  \ 'm:method',
  \ 'p:property',
  \ 'i:interface',
  \ 'g:enum',
  \ 't:type',
  \ 'a:alias',
  \ ],
      \'sro': '.',
      \ 'kind2scope' : {
      \ 'c' : 'class',
    \ 'n' : 'namespace',
    \ 'i' : 'interface',
    \ 'f' : 'function',
    \ 'G' : 'generator',
    \ 'm' : 'method',
    \ 'p' : 'property',
    \},
    \ }

