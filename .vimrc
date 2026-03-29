" Description {
    " sh7ne的vim server配置
    " https://github.com/sh7ning/vim_thes_server
    " 新建时间：2014-6-6
    " 最后更新时间：2014-10-9
" }

" Environment {

    " Basics {
        "格式化高亮（vim-tiny 可能未编译 syntax 支持）
        if has('syntax')
            syntax on
        endif
        "禁用VI兼容模式
        set nocompatible

        " 仅区分 macOS / Linux，不考虑 Windows
        let g:is_macos = has('macunix')
        let g:is_linux = has('unix') && !g:is_macos
    " }

    " General {
        "公共配置
        "显示行号
        set nu
        "设置新文件的编码为 UTF-8
        set encoding=utf-8
        "Vim 在与屏幕/键盘交互时使用的编码(取决于实际的终端的设定)
        set termencoding=utf-8
        "Vim 打开文件时的尝试使用的编码
        set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
        " Use Unix as the standard file type
        set ffs=unix,dos,mac
        " 鼠标暂不启用
        set mouse-=a

        "自动对齐 autoindent
        set ai
        "依据上面的对齐格式
        set smartindent
        set cindent
        " 按服务器/日志文件场景处理，默认不自动换行
        set nowrap
        "不在单词中间断行
        set lbr
        set tw=0
        " smart backspace
        set backspace=start,indent,eol
        " GUI 下的行间距；仅在 macOS 图形界面下设置，Linux 终端无需此项
        if g:is_macos && has('gui_running') && exists('+linespace')
            set linespace=0
        endif

        " tab相关变更
        " 设置Tab键的宽度        [等同的空格个数]
        set tabstop=4
        " 每一次缩进对应的空格数
        set shiftwidth=4
        " 按退格键时可以一次删掉 4 个空格
        set softtabstop=4
        " insert tabs on the start of a line according to shiftwidth, not tabstop 按退格键时可以一次删掉 4 个空格
        set smarttab
        " 将Tab自动转化成空格    [需要输入真正的Tab键时，使用 Ctrl+V + Tab]
        set expandtab
        " 缩进时，取整 use multiple of shiftwidth when indenting with '<' and '>'
        set shiftround

        "括号配对情况,跳转并高亮一下匹配的括号
        set showmatch
        set matchtime=2

        " 在上下移动光标时，光标的上方或下方至少会保留显示的行数
        set scrolloff=7

        " 固定行号列宽，避免文件行数变化时文本左右抖动
        if exists('+numberwidth')
            set numberwidth=4
        endif

        " history存储行数
        set history=200
        " 执行有风险的操作时给出确认提示，减少误关闭和误覆盖
        if exists('+confirm')
            set confirm
        endif
        "文件被外部修改，自动读入
        set autoread
        " 启动的时候不显示那个援助索马里儿童的提示
        "set shortmess=atI
        set shortmess+=filmnrxoOtT

        " 保留搜索高亮与增量搜索，方便定位关键字和排查问题
        set hlsearch
        set noincsearch
        " 搜索到文件末尾后不从文件开头继续，避免误判匹配位置
        set nowrapscan
        " 搜索时忽略大小写
        set ignorecase
        " 有一个或以上大写字母时仍大小写敏感
        set smartcase
        " For regular expressions turn magic on
        set magic

        " 去掉错误时提示声音
        set noerrorbells
        set novisualbell
        set t_vb=
        " CursorHold 触发等待时间，降低后插件/状态刷新更及时
        set updatetime=300
        " 映射按键超时时间，降低后组合键响应更快（原 tm=500）
        set timeoutlen=500
        " 终端按键码超时时间，避免 ESC 等待过久
        set ttimeoutlen=10
        " 宏执行/批量操作时不重绘，减少卡顿
        set lazyredraw
        " 超长行仅高亮前 N 列，提升大文件性能
        set synmaxcol=240

        " 不自动延续注释，避免回车时无意插入注释前缀
        if exists('+formatoptions')
            set formatoptions-=r
            set formatoptions-=o
            set formatoptions-=c
        endif

        "没有保存的缓冲区可以自动被隐藏
        set hidden
        set ttyfast

        " 系统剪贴板联动
        " macOS 下 '*' 和 '+' 最终都会落到系统剪贴板，使用 unnamed 即可
        " Linux 仅在图形环境（X11/Wayland）下启用 unnamedplus，避免无头服务器误判
        if has('clipboard')
            if g:is_macos
                set clipboard=unnamed
            elseif g:is_linux && (!empty($DISPLAY) || !empty($WAYLAND_DISPLAY))
                set clipboard=unnamedplus
            endif
        endif

        " 取消备份
        set nobackup
        set nowb
        " 关闭交换文件
        set noswapfile

        if has('persistent_undo')
            set undofile
            " 设置撤销文件的存放的目录
            set undolevels=1000
            set undoreload=10000
            set undodir=~/.vim_undo
            " 首次启动自动创建撤销目录，避免 undofile 失效
            if !isdirectory(expand('~/.vim_undo'))
                call mkdir(expand('~/.vim_undo'), 'p')
            endif
        endif

        " 左下角显示当前vim模式
        set showmode

        if has('cmdline_info')
            set ruler
            ""在状态栏显示正在输入的命令
            set showcmd
        endif

        if has('statusline')
            set laststatus=2
            " Broken down into easily includeable segments
            set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
        endif

        "检测文件类型 + 插件 + 缩进（vim-tiny 可能未编译 autocmd 支持）
        if has('autocmd')
            filetype plugin indent on
        endif

        "让分屏出现在右侧vsp
        set splitright
        "让分屏出现在下侧
        set splitbelow

        " 始终预留符号列，减少诊断/标记出现时文本左右跳动
        if exists('+signcolumn')
            set signcolumn=yes
        endif

        " 自动补全配置
        "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
        "set wildmode=list:longest,full
        "set completeopt=longest,menu
        "文件和目录名的补全中忽略符合其中任何模式的文件
        "set wildignore=*.swp,*.bak,.svn
        " 增强模式中的命令行自动完成操作
        set wildmenu

    " }

    " Theme {
        " 突出显示当前行等 高亮
        set cursorline
        "set cursorcolumn

        set background=dark

        " 默认主题（silent! 防止极简安装缺少该 colorscheme）
        silent! colorscheme pablo
        "colorscheme elflord
        "编辑区背景色 启用
        silent! hi Normal guibg=#99cc99 guifg=Black
        "光标所在行背景色 启用
        silent! hi CursorLine guibg=#2d2d2d ctermbg=236 cterm=none
        "hi CursorLine cterm=NONE ctermbg=darkred guibg=#66cc99 guifg=black ctermfg=white
        "行号背景色
        silent! hi LineNr guibg=#003366 guifg=#99ccff ctermbg=7777 ctermfg=blue
        " 老终端回退到 256 色
        if !has('termguicolors')
            set t_Co=256
        endif

        " SignColumn should match background
        silent! highlight clear SignColumn
        " Current line number row will have same background color in relative mode
        silent! highlight clear LineNr
        " Remove highlight color from current line number
        "highlight clear CursorLineNr
        " if &diff
        "    colorscheme murphy
        "    " syntax off
        " endif
    " }

    " Map hot key and setup Plugin {
        " 修改leader键 key
        let mapleader = ','
        let g:mapleader = ','

        "粘贴时候防止格式错乱 key
        set pastetoggle=<F4>
        "php语法检测，因为安装了语法插件，所以不启用，如插件无效，可以手动开启
        "map <F3> :!php -l % <CR>
        
        " 去掉^M
        "map <F5> :call StripTrailingBr()<CR>
        
        " 去掉行尾空格
        "map <F6> :call DeleteTrailingWS()<CR>
        "也可以设置为保存php的过程中自动进行处理 
        "autocmd BufWrite *.php :call DeleteTrailingWS()

    " }
    " Other {
        if has('autocmd')
            augroup vimrc_auto_commands
                autocmd!
                " 定义函数AutoSetFileHead，自动插入文件头
                autocmd BufNewFile *.sh,*.php call AutoSetFileHead()
                " 打开文件为上次打开的位置 if this not work ,make sure .viminfo is writable for you
                autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
                "配置文件.vimrc更改后自动重新载入使设置生效
                autocmd BufWritePost .vimrc source ~/.vimrc
            augroup END
        endif

        function! AutoSetFileHead()
            "如果文件类型为.sh文件
            if &filetype == 'sh'
                call setline(1, "\#!/bin/bash")
            endif

            "如果文件类型为php
            if &filetype == 'php'
                call setline(1, "<?php")
                "call append(0, "<?php")
                "call append(line("$"), "?>")
            endif

            normal G
            normal o
        endfunction

        " 删除行尾^M符号
        " 如果是很多行合并为一行了用 %s/\r/\r/g
        function! StripTrailingBr()  
            silent! keepjumps keeppatterns %s/\r//g
        endfunction

        "去掉空格
        function! DeleteTrailingWS()
            let l:save_view = winsaveview()
            silent! keepjumps keeppatterns %s/\s\+$//ge
            call winrestview(l:save_view)
        endfunction
    " }

" }

