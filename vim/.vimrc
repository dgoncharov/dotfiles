" ~/.vimrc
" \started 2008.06.15
" \last modification 2010.03.16
"

set nocompatible
set autoindent
set nobackup
set mousehide	" Hide the mouse when typing text
set backspace=indent,eol,start

set showcmd
set showmatch
set statusline=%n%m\ %f\ %l/%L,%c-%v
set laststatus=2

" backspace in Visual mode deletes selection
vnoremap <BS> d

syntax on

" Switch on search pattern highlighting.
set hlsearch
set ignorecase
set incsearch

set encoding=utf-8 fileencoding=utf-8 termencoding=utf-8

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc


set guifont=Terminus\ 11

" Set nice colors
" background for normal text is light grey
" Text below the last line is darker grey
" Cursor is green, Cyan when ":lmap" mappings are active
" Constants are not underlined but have a slightly lighter background
highlight Normal guibg=grey90
highlight Cursor guibg=Black guifg=NONE
highlight lCursor guibg=Cyan guifg=NONE
highlight NonText guibg=grey80
highlight Constant gui=NONE guibg=grey95
highlight Special gui=NONE guibg=grey95

