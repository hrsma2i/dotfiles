"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Outline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" - dein.vim
" - UI
" - Tab & Indent
" - Search
" - Other

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" dein.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if &compatible
  set nocompatible
endif
" path to plugin base path directory
let s:dein_dir = expand('~/.cache/dein')
" path to dein.vim directory
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
execute 'set runtimepath^=' . s:dein_repo_dir

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  call dein#add('Shougo/vimproc')
  call dein#add('Shougo/denite.nvim')
  call dein#add('Shougo/deoplete.nvim')
  let g:deoplete#enable_at_startup = 1
  call dein#add('jiangmiao/auto-pairs')
  call dein#add('tpope/vim-surround')
"  call dein#add('davidhalter/jedi-vim')

  call dein#end()
  call dein#save_state()
endif

" if there is a not installed plugin, install it
if dein#check_install()
	call dein#install()
endif

filetype plugin indent on
syntax enable
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UI 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 行番号表示
set nu
" cursor highlight
set cursorcolumn
set cursorline
" 編集中のタイトル表示
set title

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tab & Indent 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autoindentより優れてるらしい
set smartindent 
" expandtab   = softtab = space
" noexpandtab = hardtab = tab
set noexpandtab
" タブを表示するときの幅
set tabstop=4
" 自動挿入されるインデントの幅
set shiftwidth=4
" softタブ入力時の幅
set softtabstop=4

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 大文字小文字区別しない
set ignorecase
" 検索ワードに大文字が含まれるときだけignorecaseをoff
set smartcase
" 1文字入力ごとに検索
set incsearch

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Other
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmenu

nnoremap j gj
nnoremap k gk

set encoding=utf8

" _ を単語としてカウントしない
" set iskeyword-=_

inoremap jj <ESC>
" Up/Down by half a page
nnoremap J <C-d>
nnoremap K <C-u>

colorscheme molokai
