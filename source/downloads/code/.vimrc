let mapleader = ','

" vundle管理插件
set nocompatible               " be iMproved
filetype off                   " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" 标签列表
let Tlist_Compact_Format = 1
" let Tlist_Close_On_Select = 1
" let Tlist_Process_File_Always = 1
" let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
nnoremap <silent> <F8> :TlistToggle<CR>
Bundle 'taglist.vim'

" 浏览文件
" autocmd vimenter * NERDTree
nnoremap <silent> <F7> :NERDTree<CR>
Bundle 'scrooloose/nerdtree'

" 语法高亮风格
"Bundle 'molokai'

" 切换打开的文件
" noremap <TAB>   :call <SID>CycleBuffer(1)<CR>:<BS>
" noremap <S-TAB> :call <SID>CycleBuffer(0)<CR>:<BS>
" noremap <silent> <F5>   :call <SID>CycleBuffer(1)<CR>:<BS>
" noremap <silent> <F6>   :call <SID>CycleBuffer(0)<CR>:<BS>
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
Bundle 'minibufexplorerpp'

" 切换.h和.cpp文件
Bundle 'a.vim'

" 自动更新Tags
"Bundle 'autotags'

" 自动补全
Bundle 'snipMate'

" 代码提示
"let g:acp_behaviorSnipmateLength = 1
"Bundle 'AutoComplPop'
map <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_NamespaceSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_MayCompleteDot = 1
let OmniCpp_MayCompleteArrow = 1
let OmniCpp_MayCompleteScope = 1
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
Bundle 'OmniCppComplete'

" 代码风格
"Bundle 'google.vim'

" 查找
"set cst
"set csto=0
"set csverb
Bundle 'cscope.vim'

" 注释
Bundle 'The-NERD-Commenter'

" 项目
Bundle 'project.tar.gz'

" 自动创建目录
Bundle 'auto_mkdir'

" 打开终端
nmap <leader>tt :ConqueTerm bash <CR>
nmap <leader>ts :ConqueTermSplit bash <CR>
nmap <leader>tv :ConqueTermVSplit bash <CR>
Bundle 'Conque-Shell'

" 缩进对齐
"Bundle 'nathanaelkane/vim-indent-guides'

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

" 添加行号
set number
" 搜索
set hlsearch
set incsearch
set ignorecase
set smartcase
" 空格
set nowrap
set tabstop=4
set shiftwidth=4
set expandtab
set list listchars=tab:\ \ ,trail:.
" 语法高亮
syntax enable
syntax on
set background=dark
" 文件类型
"filetype on
"filetype plugin on
"filetype indent on
" 标签库
set tags=./tags,tags
set tags+=/
set tags+=/home/librakyle/.vim/tags/stl/tags
set tags+=/home/librakyle/.vim/tags/c/tags
" 折叠
set foldenable
set foldmethod=indent
" 编码
set encoding=utf-8
" 当前行
"set cursorline
" 文件
set autoread
set autowrite
set nobackup
set noswapfile
" 历史记录
set history=1024
" 命令行
set cmdheight=1
set laststatus=2
" 右边界
set colorcolumn=80

