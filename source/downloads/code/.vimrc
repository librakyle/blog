
let mapleader = ','
" 添加行号
set number
" 背景颜色
set background=dark
" 搜索
set hlsearch
set incsearch
set ignorecase
set smartcase

" vundle管理插件
set nocompatible               " be iMproved
filetype off                   " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" original repos on github
" Bundle 'tpope/vim-fugitive'
" vim-scripts repos
" Bundle 'L9'
" 切换打开的文件
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
Bundle 'minibufexplorerpp'
" 切换.h和.cpp文件
Bundle 'a.vim'
" 标签列表
let Tlist_Compact_Format = 1
" let Tlist_Close_On_Select = 1
" let Tlist_Process_File_Always = 1
" let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
nnoremap <silent> <F8> :TlistToggle<CR>
Bundle 'taglist.vim'
" 文件浏览
nnoremap <silent> <F7> :WMToggle<CR>
Bundle 'winmanager'
" non github repos
" Bundle 'git://git.wincent.com/command-t.git'

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

