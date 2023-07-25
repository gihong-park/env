call vundle#begin()

Plugin 'gmarik/Vundle.vim' " Vundle 플러그인
Plugin 'nanotech/jellybeans.vim' " colorscheme
Plugin 'tstelzer/welpe.vim' " colorscheme
Plugin 'majutsushi/tagbar' " 함수 및 변수 리스트
Plugin 'scrooloose/nerdtree' " 파일리스트 
Plugin 'nathanaelkane/vim-indent-guides' " indent 보여주는 패키지
Plugin 'airblade/vim-gitgutter' " vim with git status(added, modified, and removed lines)
Plugin 'tpope/vim-fugitive' " vim with git command(e.g., Gdiff)
Plugin 'vim-airline/vim-airline' " vim status bar 하단 상태바
Plugin 'vim-airline/vim-airline-themes' " 하단 상태바 테마
Plugin 'blueyed/vim-diminactive' " 활성화된 window highlight 변경
Plugin 'puremourning/vimspector' " vim GUI Debugging 툴
Plugin 'jiangmiao/auto-pairs' " 자동으로 페어를 만들주는 패키지 (ex. "", {}, ()... etc)
Plugin 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production'   } " prettier 패키지
Plugin 'scrooloose/nerdcommenter' "자동 주석 패키지 
Plugin 'pangloss/vim-simplefold' "코드접기
Plugin 'Konfekt/FastFold' " fold 수행을 빠르게 하는 패키지
"

" Add maktaba and codefmt to the runtimepath.
" (The latter must be installed before it can be used.)
 Plugin 'google/vim-maktaba'
 Plugin 'google/vim-codefmt'
 " Also add Glaive, which is used to configure codefmt's maktaba flags. See
 " `:help :Glaive` for usage.
 Plugin 'google/vim-glaive'
 Plugin 'pangloss/vim-javascript'    " JavaScript support
 Plugin 'leafgarland/typescript-vim' " TypeScript syntax
 Plugin 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
 Plugin 'jparise/vim-graphql'        " GraphQL syntax
 Plugin 'neoclide/coc.nvim', {'branch': 'release'} " coc 코드 인텔리센스 패키지
 Plugin 'dart-lang/dart-vim-plugin' " dart languege 서버
 Plugin 'fatih/vim-go', { 'tag': '*'    } " golang 패키지
 Plugin 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim'  } " golang server
 Plugin 'ludovicchabant/vim-gutentags' " ctag 자동 갱신

 call vundle#end()
 filetype plugin indent on


" the glaive#Install() should go after the "call vundle#end()"
call glaive#Install()
" Optional: Enable codefmt's default mappings on the <Leader>= prefix.
Glaive codefmt plugin[mappings]
Glaive codefmt google_java_executable="java -jar /path/to/google-java-format-VERSION-all-deps.jar"

" for jellybeans
colorscheme jellybeans
" for welpe
" colorscheme welpe
