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
nmap <leader>wl :TlistToggle<CR>
Bundle 'taglist.vim'

" 浏览文件
" autocmd vimenter * NERDTree
nnoremap <silent> <F7> :NERDTreeAuto<CR>
nmap <leader>wt :NERDTreeAuto<CR>
Bundle 'scrooloose/nerdtree'

" 语法高亮风格
"Bundle 'molokai'

" 切换打开的文件
" noremap <TAB>   :call <SID>CycleBuffer(1)<CR>:<BS>
" noremap <S-TAB> :call <SID>CycleBuffer(0)<CR>:<BS>
" nmap <leader>wn :call <SID>CycleBuffer(1)<CR>:<BS>
" nmap <leader>wp :call <SID>CycleBuffer(0)<CR>:<BS>
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
let g:miniBufExplMapWindowNavVim = 1 
Bundle 'fholgado/minibufexpl.vim'

" 切换.h和.cpp文件
Bundle 'a.vim'

" 自动补全
Bundle 'honza/snipmate-snippets'
Bundle 'snipMate'

" 代码提示
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
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }
" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()
" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"
" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1
" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
Bundle 'Shougo/neocomplcache'

" 函数参数提示
let g:EchoFuncLangsUsed = ["java","cpp"]
let g:EchoFuncKeyNext = "<c-n>"
let g:EchoFuncKeyPrev = "<c-p>"
Bundle 'mbbill/echofunc'

" 代码风格
Bundle 'google.vim'

" Markdown语法高亮
"Bundle 'plasticboy/vim-markdown'
"Bundle 'Markdown'
Bundle 'hallison/vim-markdown'

" 查找
set cscopetag
set cscopeverbose
set csto=0
map <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>:CscopeGen<CR><CR>
nmap <Leader>wc :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>:CscopeGen<CR><CR>
Bundle 'brookhong/cscope.vim'
"Bundle 'cscope_macros.vim'

" 注释
Bundle 'scrooloose/nerdcommenter'

" 项目
nmap <leader>wj :Project .vimprojects<CR>\C
Bundle 'project.tar.gz'

" 自动创建目录
Bundle 'DataWraith/auto_mkdir'

" 打开终端
nmap <leader>tt :ConqueTerm bash <CR><CR>
nmap <leader>ts :ConqueTermSplit bash <CR><CR>
nmap <leader>tv :ConqueTermVSplit bash <CR><CR>
Bundle 'Conque-Shell'

" 显示缩进
"let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=4
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=5
Bundle 'nathanaelkane/vim-indent-guides'

" sudo时仍然使用本配置
"Bundle 'sudo.vim'

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
set backspace=indent,start
set nowrap
set tabstop=4
set shiftwidth=4
set expandtab
set list listchars=tab:\ \ ,trail:.
" 语法高亮
syntax enable
syntax on
colorscheme default
set background=dark
" 文件类型
"filetype on
"filetype plugin on
"filetype indent on
" 打开文件同一行
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
" 标签库
set tags=./tags,tags
set tags+=/
set tags+=/home/librakyle/.vim/tags/stl/tags
set tags+=/home/librakyle/.vim/tags/c/tags
set tags+=/home/librakyle/.vim/tags/opencv/tags
set tags+=/home/librakyle/.vim/tags/opencv2/tags
set tags+=/home/librakyle/.vim/tags/boost/tags
" 自动折行
set wrap
" 折叠
"set foldenable
"set foldmethod=indent
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
set cmdheight=2
set laststatus=3
" 右边界
set colorcolumn=80

