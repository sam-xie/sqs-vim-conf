filetype on
filetype plugin on
set noerrorbells
set nocompatible
set noeb
set report=0
"set mouse=a
set selection=exclusive

syntax enable
syntax on
set background=dark
set t_Co=256
set showcmd
set cmdheight=2
set showmode
set laststatus=2
set nu
set ruler
autocmd InsertEnter * se cul
set linespace=0
set fillchars=vert:\ ,stl:\ ,stlnc:\
set showmatch
set matchtime=1
set scrolloff=3
set iskeyword+=_,$,@,%,#,-
set whichwrap+=<,>,h,l

set autoindent
set cindent
set cinoptions=g0,:0,N-s,(0
set smartindent
filetype indent on
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set history=1000
"set nowrap
set backspace=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 搜索设置
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 高亮显示搜索结果
set hlsearch
" 开启实时搜索功能
set incsearch
" 搜索时大小写不敏感
set ignorecase
" 设置魔术
set magic                   

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码折叠
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 基于缩进或语法进行代码折叠
" set foldmethod=indent
set foldmethod=syntax
" 启动vim时关闭折叠代码
set nofoldenable

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码补全
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim自身命名行模式智能补全
set wildmenu
" 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 缓存设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 禁止生成临时文件
set nobackup
"set noswapfile
" 文件在vim之外修改过，自动重新读入
set autoread
" 设置自动保存
"set autowrite
" 在处理未保存或只读文件的时候，弹出确认
set confirm

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 编码设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set langmenu=zh_CN.UTF-8
" 帮助系统设置为中文
set helplang=cn
" 设置编码格式
set termencoding=utf-8
set encoding=utf8
" 使用utf-8或gbk打开文件
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030

if &term =~ '256color'  
	set t_ut= 
endif  

colorscheme monokai-soda

map <F5> :call CompileAndRun()<CR>
func! CompileAndRun()
	exec 'w'
	if &filetype == 'c'
		exec ':!gcc % -g -o %<.out && ./%<.out'
	elseif &filetype == 'cpp'
		exec ':!g++ % -g -o %<.out && ./%<.out'
	elseif &filetype == 'lua'
		exec ':!lua %'
	elseif &filetype == 'sh'
		exec ':!./%'
	endif
endfunc

