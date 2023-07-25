" basic vim settings
set shell=/bin/zsh " 기본 사용 쉘
set autowrite " 자동저장
set autoread

set backspace=indent,eol,start " 줄의 끝, 시작, 들여쓰기에서 백스페이스시 이전줄로
set number " 왼쪽 줄 넘버 표시

set cindent
set autoindent " 자동 들여쓰기
set smartindent

set tabstop=2  " tab 간격
set expandtab " tab을 space로 변경하여 저장
set shiftwidth=2 " >> 또는 << 키로 들여 쓰기 할때 스페이스의 갯수. 기본값 8
set laststatus=2 " turn on bottom bar

set clipboard=unnamed " clipboard와 vim 연결

set hlsearch " 검색 시 highlight"
set ignorecase " 검색 시 대소문자 구분 X

set showmatch " 커서 위치 시 괄호 끝과 시작 표시

set encoding=utf-8         " encoding 설정
set fileencodings=utf-8,cp949,default,latin1
set termencoding=utf-8

set rtp+=~/.vim/bundle/Vundle.vim " runtime path to include Vundle and initialize"

" 한글 처리
if $LANG[0] == 'k' && $LANG[1] == 'o'
  set fileencoding=korea
endif
