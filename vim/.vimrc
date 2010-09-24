" ~/.vimrc
" \started 2008.06.15

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

" Switch on search pattern highlighting.
set hlsearch
set ignorecase
set incsearch

set tabstop=4
set shiftwidth=4
set expandtab

au BufRead,BufNewFile *.py setl noexpandtab shiftwidth=4 tabstop=4

set encoding=utf-8 fileencoding=utf-8 termencoding=utf-8

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

set guifont=Terminus\ 11

" No vertical scrollbar.
set guioptions-=r
" No menubar.
set guioptions-=m
" No toolbar.
set guioptions-=T


" Cursor shape in kde4 konsole.
let &t_SI = "\<Esc>]50;CursorShape=1\x7" 
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

"highlight Normal ctermbg=black guibg=black ctermfg=white guifg=white
"highlight Cursor ctermfg=black guifg=black
"highlight lCursor guibg=Cyan guifg=NONE
"highlight Comment ctermfg=grey guifg=grey
"highlight Keyword ctermfg=cyan guifg=cyan
"highlight NonText guibg=grey80
"highlight Constant gui=NONE guibg=grey95
"highlight Special gui=NONE guibg=grey95

set bg=dark
hi clear

hi Normal guifg=white guibg=black ctermfg=white ctermbg=black
"hi ErrorMsg     guifg=#ffffff guibg=#287eff                     ctermfg=white ctermbg=lightblue
hi Visual       guifg=grey guibg=black gui=reverse ctermfg=grey ctermbg=black cterm=reverse
"hi VisualNOS    guifg=#8080ff guibg=fg      gui=reverse,underline   ctermfg=lightblue ctermbg=fg cterm=reverse,underline
"hi Todo         guifg=#d14a14 guibg=#1248d1                     ctermfg=red ctermbg=darkblue
hi Search       guifg=yellow guibg=black ctermfg=yellow ctermbg=black
"hi IncSearch    guifg=#b0ffff guibg=#2050d0                         ctermfg=darkblue ctermbg=gray

"hi SpecialKey       guifg=cyan          ctermfg=darkcyan
"hi Directory        guifg=cyan          ctermfg=cyan
"hi Title            guifg=magenta gui=none ctermfg=magenta cterm=bold
"hi WarningMsg       guifg=red           ctermfg=red
"hi WildMenu         guifg=yellow guibg=black ctermfg=yellow ctermbg=black cterm=none term=none
"hi ModeMsg          guifg=#22cce2       ctermfg=lightblue
"hi MoreMsg          ctermfg=darkgreen   ctermfg=darkgreen
"hi Question         guifg=green gui=none ctermfg=green cterm=none
"hi NonText          guifg=#0030ff       ctermfg=darkblue

"hi StatusLine   guifg=blue guibg=darkgray gui=none      ctermfg=blue ctermbg=gray term=none cterm=none
"hi StatusLineNC guifg=black guibg=darkgray gui=none     ctermfg=black ctermbg=gray term=none cterm=none
"hi VertSplit    guifg=black guibg=darkgray gui=none     ctermfg=black ctermbg=gray term=none cterm=none

"hi Folded   guifg=#808080 guibg=#000040         ctermfg=darkgrey ctermbg=black cterm=bold term=bold
"hi FoldColumn   guifg=#808080 guibg=#000040         ctermfg=darkgrey ctermbg=black cterm=bold term=bold
"hi LineNr   guifg=#90f020           ctermfg=green cterm=none

"hi DiffAdd  guibg=darkblue  ctermbg=darkblue term=none cterm=none
"hi DiffChange   guibg=darkmagenta ctermbg=magenta cterm=none
"hi DiffDelete   ctermfg=blue ctermbg=cyan gui=bold guifg=Blue guibg=DarkCyan
"hi DiffText cterm=bold ctermbg=red gui=bold guibg=Red

hi Cursor   guifg=white ctermfg=white

hi Comment  guifg=darkgrey ctermfg=darkgrey
hi Constant ctermfg=brown guifg=brown cterm=none
hi Special  ctermfg=cyan guifg=cyan cterm=none gui=none
hi Identifier   ctermfg=cyan guifg=cyan cterm=none
hi Statement    ctermfg=cyan cterm=none guifg=cyan gui=none
hi PreProc  ctermfg=magenta guifg=magenta gui=none cterm=none
hi type     ctermfg=cyan guifg=cyan gui=none cterm=none
"hi Underlined   cterm=underline term=underline
"hi Ignore   guifg=bg ctermfg=bg

" suggested by tigmoid, 2008 Jul 18
" hi Pmenu guifg=#c0c0c0 guibg=#404080
" hi PmenuSel guifg=#c0c0c0 guibg=#2050d0
" hi PmenuSbar guifg=blue guibg=darkgray
" hi PmenuThumb guifg=#c0c0c0

syntax enable

map <C-l> :ls<cr>
map <C-e> :e .<cr>
map <C-s> :up<cr>


set tags=$HOME/tags,./tags

set exrc " enable per-directory .vimrc files
set secure " disable unsafe commands in local .vimrc file

