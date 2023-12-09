" this file should be linked to ~/.vimrc
" the following lines are to determine which computer it is
let computer = system('scutil --get LocalHostName')[:-2]
let is_pro = computer == 'ZhuXYs-Pro'
let is_air = computer == 'ZhuXYs-Air'

"--------------------------------------------------------------------------
"| Vundle
"--------------------------------------------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim' " let Vundle manage Vundle, required
" Plugin 'ycm-core/YouCompleteMe'
    " set updatetime=2000
Plugin 'SirVer/ultisnips' "补全的引擎
    let g:UltiSnipsExpandTrigger="jj" "默认为<tab>
    let g:UltiSnipsJumpForwardTrigger="jj" "默认为<c-b>
    let g:UltiSnipsJumpBackwardTrigger="kk" "默认为<c-z>
Plugin 'vim-latex/vim-latex' "LaTeX plug
Plugin 'cormacrelf/vim-colors-github'
Plugin 'christoomey/vim-tmux-navigator'
if is_pro
    Plugin 'jpalardy/vim-slime'
    Plugin 'hanschen/vim-ipython-cell'
    Plugin 'dense-analysis/ale'
    Plugin 'godlygeek/tabular' " required by vim-markdown
    Plugin 'preservim/vim-markdown'
endif
" All of your Plugins must be added before the following line
call vundle#end()            " required
"--End of Vundle

"--------------------------------------------------------------------------
"| basic vim configuration
"--------------------------------------------------------------------------
filetype plugin indent on    " required by Vundle, equals to filetype type on, filetype indent on, filetype plugin on

" find files. `path` is only available for `find` but not `e`.
" `**` means all the files inside. Without **, only for the first layer.
set path+=$note/**
set path+=**
" show the menu for available possibilities
set wildmenu

" generate tags using :MakeTags
" command! MakeTags !ctags -R .
" use tags for python 
" autocmd BufWritePost *.py silent !ctags -R .

" replace all occurences of the word under the cursor
:nnoremap <Leader>w :%s/\<<C-r><C-w>\>/<C-r><C-w>/g<Left><Left>

" open new windows on the bottom & right
" set splitbelow
" set splitright

"使用系统剪切板
set clipboard+=unnamed

"显示行号
set nu

" 设定vim内部编码格式
set fenc=utf-8
set fencs=utf-8,usc-bom,euc-jp,gb18030,gbk,gb2312,cp936

" 设定默认文件编码
set encoding=utf8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

" 设置语言和词典
lan en_US.UTF-8 "zh_CN.UTF-8
set dictionary+=/usr/share/dict/words

"语法高亮
syntax on

" 输入:make编译并运行
autocmd FileType cpp set makeprg=clear;g++\ -w\ %\ -o\ %<\ &&\ ./%<
autocmd FileType c set makeprg=clear;gcc\ -w\ %\ -o\ %<\ &&\ ./%<
autocmd FileType python set makeprg=clear;python3\ %
autocmd FileType sh set makeprg=clear;source\ %
autocmd FileType tex set makeprg=clear;cd\ %:p:h;xelatex\ %;cd\ -

"没有保存或文件只读时弹出确认
set confirm

"鼠标在i和n、v模式下都可用
set mouse=inv
"每次鼠标滚轮只滚一行而非默认的三行
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

" 用箭头来做显示行的上下跳转。
map <Up> gk
map <Down> gj
imap <Up> <C-O>gk
imap <Down> <C-O>gj

"tab缩进
set tabstop=4
set expandtab
set smarttab
set softtabstop=4
set shiftwidth=4

" 在c,c++,python文件中用空格代替制表符
"autocmd FileType c,cpp,python,py set shiftwidth=4 | set expandtab

"文件自动检测外部更改
set autoread

"c文件自动缩进
set cindent

"自动对齐
set autoindent

"智能缩进
set smartindent

"查询时非常方便，如要查找book单词，当输入到/b时，会自动找到第一
"个b开头的单词，当输入到/bo时，会自动找到第一个bo开头的单词，依
"次类推，进行查找时，使用此设置会快速找到答案，当你找要匹配的单词
"时，别忘记回车
set incsearch

"高亮查找匹配，用:noh暂时取消高亮。
set hlsearch

"显示匹配括号
set showmatch

"显示标尺，就是在右下角显示光标位置
" set ruler

"去除vi的一致性
set nocompatible

"启动状态行
set laststatus=2
"状态行显示设定
set statusline=%<%f%h%m%r\ %y%=\ Ln\ %l/%L\,\ Col\ %c\ \ %p%%

" 通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0

"右下角显示输入的命令
set showcmd

"被分割窗口之间显示空白
"set fillchars=vert:/
"set fillchars=stl:/
"set fillchars=stlnc:/

" 配色方案
" colorscheme default
set background=light
colorscheme github
" colorscheme lunaperche 
" colorscheme shine

"折行且顺滑滚动
set wrap smoothscroll

"针对tex做断行，设成72后在80格的窗口下是一整行，左边空4格indent，右边对称空四格
autocmd FileType tex set tw=72

"如果最后一行是一个在窗口大小下显示不完整的长行，至少显示出部分，而不是只显示很多个@
set display=lastline

syntax keyword cppSTLtype initializer_list

" 基于缩进或语法进行代码折叠
set foldmethod=indent
" set foldmethod=syntax

" 对python，基于ipython cell的标题折叠
function! IPyFolds()
   let thisline = getline(v:lnum)
   if match(thisline, '^# %%') >= 0
      return ">1"
   else
      return "="
   endif
endfunction

autocmd FileType python setlocal foldmethod=expr
autocmd FileType python setlocal foldexpr=IPyFolds()

" 启动 vim 时关闭折叠代码
set nofoldenable
" the following commands is used for saving and loading the folding
" information
nmap <silent> <leader>m :mkview<return>
nmap <silent> <leader>l :loadview<return>

"允许用退格键删除字符
set backspace=2

"上方不要蹦出来scratch窗口
set completeopt-=preview

" 搜索时大小写不敏感
set ignorecase

" 设置下列内容，否则TMUX中粘贴时会在缩进上出错
" 见vim中:h xterm-bracketed-paste
if &term =~ "screen"
  let &t_BE = "\e[?2004h"
  let &t_BD = "\e[?2004l"
  exec "set t_PS=\e[200~"
  exec "set t_PE=\e[201~"
endif

" remove trailing whitespace when saving
function! <SID>StripTrailingWhitespaces()
  if !&binary && &filetype != 'diff'
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
  endif
endfun
autocmd FileType tex,cpp,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" set some private mode when the file is encrypted
au BufRead * if &key!= ""
    \ | setlocal history=0 nobackup nomodeline noshelltemp noswapfile noundofile nowritebackup secure viminfo=""
    \ | endif

" show the differences between the current unsaved buffer and the previously
" saved original file.
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()
noremap <Leader>d :DiffSaved<return>

"--------------------------------------------------------------------------
"| comment & uncomment
"--------------------------------------------------------------------------
" map { and } to comment and uncomment
" works for both n and v mode. move one line down after executing
" <C-/> can't used in mac Terminal.app+tmux. pity.
function AddComment(commentchar)
    :silent exe 's/^\(\s*\)\('.a:commentchar.'\)*\s*\([^'.a:commentchar.']\)/\1'.a:commentchar.' \3/ge'
    " noh
    normal j
endfunction

function DelComment(commentchar)
    " The first line works for `#    a` and returns `    a`
    " where the space must >=2
    :silent exe 's/^'.a:commentchar.'\(\s\{2,\}\)/\1/ge'
    " The second line works for `# a`, `#a`, `   #a`, `    # a`.
    " And for `    #  a`, it returns `      a`,
    " where the space is added if the space between `#` and `a` >=2
    :silent exe 's/^\(\s*\)'.a:commentchar.'\s\{,1\}/\1/ge'
    " noh
    normal j
endfunction

" autocmd FileType python,zsh,sh,tmux,crontab noremap ]/ :call AddComment('#')<return>
" autocmd FileType python,zsh,sh,tmux,crontab noremap [/ :call DelComment('#')<return>
noremap ]/ :call AddComment('#')<return>
noremap [/ :call DelComment('#')<return>
autocmd FileType vim    noremap ]/ :call AddComment('"')<return>
autocmd FileType vim    noremap [/ :call DelComment('"')<return>
autocmd FileType tex    noremap ]/ :call AddComment('%')<return>
autocmd FileType tex    noremap [/ :call DelComment('%')<return>
autocmd FileType cpp    noremap ]/ :call AddComment('\/\/')<return>
autocmd FileType cpp    noremap [/ :call DelComment('\/\/')<return>

" # `"""` in python
function! SurroundWithTripleQuotes()
    let [lnum_start, col_start] = getpos("'<")[1:2]
    let [lnum_end, col_end] = getpos("'>")[1:2]

    " Add the line before the selected region
    exe l:lnum_start
    " here the \"\"\" is mapped to the double \"\"\" below
    normal O"""
    " so we need to delete the empty line and cut the end line
    normal dddd
    " Add the line after the selected region
    exe l:lnum_end + 1
    normal p
endfunction

autocmd FileType python vnoremap """ :<C-u>call SurroundWithTripleQuotes()<CR><CR>

"--------------------------------------------------------------------------
"| auto complete brackets and quotes
"--------------------------------------------------------------------------
inoremap {} {}<left>
inoremap () ()<left>
inoremap [] []<left>
inoremap <> <lt>><left>
inoremap "" ""<left>
inoremap '' ''<left>
inoremap `` ``<left>
" The change here will affect the vnoremap above!
autocmd FileType python inoremap """ """"""<left><left><left><return><esc>O
autocmd FileType python inoremap ''' ''''''<left><left><left><return><esc>O
autocmd FileType markdown inoremap ``` ``````<left><left><left><return><esc>O

"--------------------------------------------------------------------------
"| mapping chinese marks
"--------------------------------------------------------------------------
map 、 \
map · `
map ： :
map ； ;
map 【 [
map 】 ]
map 《 <
map 》 >
map 「 {
map 」 }
map ？ ?
map …… ^
map ‘ '
map ’ '
map “ "
map ” "
map 。 .
map ， ,
map ～ ~
map （ (
map ） )

" THE END OF BASIC VIM CONFIG

" vim terminal
tnoremap <C-w><C-u> <C-\><C-n>

if is_pro
    "-----------------------------------------------------------------------
    "| ALE configuration
    "-----------------------------------------------------------------------
    let g:ale_linters = {
    \   'python': ['mypy', 'flake8'],
    \}

    " :ALEFix will fix the whole file
    let g:ale_fixers = {
    \   'python': ['black'],
    \}

    " map \f to :ALEFix
    nnoremap <Leader>f :ALEFix<return>

    " For Flake8
    " W503: line break before binary operator
    " W605: invalid escape sequence '\l'
    let g:ale_python_flake8_options="--ignore=W503,W605 --max-line-length=120"

    " use \j and \k to jump to the next/previous error
    map <silent> <leader>j :ALENext<return>
    map <silent> <leader>k :ALEPrevious<return>


    "-----------------------------------------------------------------------
    "| slime configuration
    "-----------------------------------------------------------------------
    " always use tmux
    let g:slime_target = 'tmux'
    " let g:slime_target = "vimterminal"

    " always send text to the top right pane in the current tmux tab without asking
    let g:slime_default_config = {'target_pane': '{top-right}',
                \ 'socket_name': get(split($TMUX, ','), 0)}
                " \ 'socket_name': 'default'}

    let g:slime_dont_ask_default = 1

    " fix paste issues in ipython
    " let g:slime_python_ipython = 1
    " ↑ not recommended in tmux
    let g:slime_bracketed_paste = 1

    xmap <c-c><c-c> <Plug>SlimeRegionSend
    " line-by-line sending will cause bugs in ipython. <c-c><c-c> is redefined for
    " python

    "-----------------------------------------------------------------------
    "| ipython-cell configuration
    "-----------------------------------------------------------------------

    " calculate time when running each cell. Default: '%paste -q'
    let g:ipython_cell_cell_command = '%time %paste -q'

    " the tag is the same as default, but without trailing white space
    let g:ipython_cell_insert_tag = '# %%'

    " Keyboard mappings. <Leader> is \ (backslash) by default
    " map <Leader>s to start IPython
    autocmd FileType python noremap <Leader>s :SlimeSend1 ipython<return>
    " map <Leader>q to exit debug mode or IPython
    autocmd FileType python noremap <Leader>q :SlimeSend1 exit<return>
    " map <Leader>Q to restart ipython
    autocmd FileType python noremap <Leader>Q :SlimeSend1 exit<return>:SlimeSend1 ipython<return>

    " Run the whole script
    " autocmd FileType python noremap <Leader>r :IPythonCellRun<return>
    autocmd FileType python noremap <Leader>R :IPythonCellRunTime<return>

    " Run cell
    autocmd FileType python noremap <Leader>c :IPythonCellExecuteCellJump<return>jzz
    autocmd FileType python noremap <Leader>r :IPythonCellExecuteCell<return>

    " Run from the beginning to this cell
    autocmd FileType python noremap <Leader>C :IPythonCellNextCell<return>kVggy:SlimeSend1 %time %paste -q<return>``

    " map [c and ]c to jump to the previous and next cell header
    " for [c, I the jumping is stacked to avoid jumping to the current header when
    " the cursur is between headers. But a new bug is that when at the last cell,
    " it will jump to 2 cells before.
    autocmd FileType python noremap [c :IPythonCellNextCell<return>:IPythonCellPrevCell<return>:IPythonCellPrevCell<return>jzz
    autocmd FileType python noremap ]c :IPythonCellNextCell<return>jzz

    " map <Leader>a and <Leader>b to insert a cell header tag above/below and enter insert mode
    autocmd FileType python noremap <Leader>a :IPythonCellInsertAbove<return>zzo
    autocmd FileType python noremap <Leader>b :IPythonCellInsertBelow<return>zzo

    autocmd FileType python noremap <Leader>L :IPythonCellClear<return>
    autocmd FileType python noremap <Leader>X :IPythonCellClose<return>

    " map <c-c> to send the current line or current selection to IPython
    autocmd FileType python nmap <c-c><c-c> <Plug>SlimeLineSend
    autocmd FileType python xmap <c-c><c-c> m]y:SlimeSend1 %time %paste -q<return>`]

    " map <Leader>p to run the previous command
    autocmd FileType python noremap <Leader>p :IPythonCellPrevCommand<return>

    "-----------------------------------------------------------------------
    "| vim-markdown configuration
    "-----------------------------------------------------------------------
    " vim-markdown is useful in the TOC when there are #s as code comments
    let g:vim_markdown_toc_autofit = 1
    let g:vim_markdown_math = 1
    " disable most key mappings
    let g:vim_markdown_no_default_key_mappings = 1
    " but re-define gx
    autocmd FileType markdown noremap gx <Plug>Markdown_OpenUrlUnderCursor

    "-----------------------------------------------------------------------
    "| TOC
    "-----------------------------------------------------------------------
    " map \t to check titles as a table of content
    " and \T to close the titles
    " markdown uses vim-markdown shown in location list
    autocmd FileType markdown noremap <Leader>t :Toc<return>:ll 
    " others is shown in the quickfix, because the ALE uses location list
    " python and vim use TocCleaned 
    autocmd FileType python noremap <Leader>t :call TocCleaned("# %%\\s")<return>:cc 
    autocmd FileType vim noremap <Leader>t :call TocCleaned('\"\|')<return>:cc 
    " tex uses its own configuration
    autocmd FileType tex noremap <Leader>t :call TocCleanedTex()<return>:cc 
    noremap <Leader>x :cclose<return>
    autocmd FileType markdown noremap <Leader>x :lclose<return>

    " map [t and ]t to jump between titles
    noremap [t :cprev<return>
    noremap ]t :cnext<return>
    " markdown uses vim-markdown
    autocmd FileType markdown noremap [t <Plug>Markdown_MoveToPreviousHeader
    autocmd FileType markdown noremap ]t <Plug>Markdown_MoveToNextHeader

    function TocCleaned(titlestr)
        silent exe "vimgrep /^\\s*".a:titlestr."/j %"
        copen
        wincmd H
        setlocal conceallevel=2
        setlocal concealcursor=nvic
        silent exe "syntax match qfFileName /^[^|]*|[^|]*|\\s*".a:titlestr."/ transparent conceal"
        vertical resize 25
        setlocal nowrap 
    endfunction

    function TocCleanedTex()
        vimgrep /^\s*\\\(sub\)*section{/j %
        copen
        wincmd H
        setlocal conceallevel=2
        setlocal concealcursor=nvic
        syntax match qfFileName /}.*$/ transparent conceal
        syntax match qfFileName /^[^|]*|[^|]*|\s*\\section{/ transparent conceal
        syntax match qfFileName /^[^|]*|[^|]*|\s*\\subsection{/ transparent conceal cchar={
        syntax match qfFileName /^[^|]*|[^|]*|\s*\\subsubsection{/ transparent conceal cchar=[
        syntax match qfFileName /^[^|]*|[^|]*|\s*\\subsubsection{/ transparent conceal cchar=(
        vertical resize 25
        setlocal nowrap 
    endfunction
endif

"--------------------------------------------------------------------------
"| vim-latex configuration
"--------------------------------------------------------------------------
" this is mostly a matter of taste. but LaTeX looks good with just a bit
" of indentation.
autocmd FileType tex set shiftwidth=2
" TIP: if you write your \label's as \label{fig:something}, then if you
" type in \ref{fig: and press <C-n> you will automatically cycle through
" all the figure labels. Very useful!
set iskeyword+=:
let g:Tex_DefaultTargetFormat = 'pdf' 
let g:Tex_CompileRule_pdf = 'xelatex -synctex=0 $*' "compile with xelatex, if want to refresh automatically, add `-interaction=nonstopmode' and `-synctex=1'
let g:Tex_ViewRule_pdf = 'open -a pdf\ expert' "preview pdf
let g:Tex_Folding = 0 "fold nothing
let g:Tex_IgnoreLevel = 7 "ignore the default 7 warnings
let g:Tex_GotoError=0 "即使有Error，编译后也回到文件。
let g:Tex_Menus=0 "不显示任何目录，比如template，package之类
let g:Imap_FreezeImap=1 "断绝所有快捷键
let g:tex_flavor='xelatex -interaction=nonstopmode'
let g:vimtex_view_method='open -a pdf\ expert'
let g:Tex_MultipleCompileFormats='pdf,bibtex,pdf'
let g:Tex_BibtexFlavor='bibtex'
let g:Imap_UsePlaceHolders=0
let g:vimtex_quickfix_mode=0
let g:Tex_ShowErrorContext = 0  " 不要再在quickfix窗口下面显示log了
let g:Tex_IgnoredWarnings =
            \'Package fontspec Warning:'."\n"  " 如果在下面继续加，要在本行最后再加一个.


" Use \c and \r to save and \ll
autocmd FileType tex nnoremap <Leader>c :w<return>:call Tex_RunLaTeX()<return>
autocmd FileType tex nnoremap <Leader>r :w<return>:call Tex_RunLaTeX()<return>
" Use \v to \lv
" autocmd FileType tex nmap <Leader>v <Leader>lv
autocmd FileType tex nmap <Leader>v :call Tex_ViewLaTeX()<return>
" Use c-b to map the biblography seaerch
autocmd FileType tex nmap <C-b> hf}i<F9>
autocmd FileType tex imap <C-b> <F9>


" inoremap <C-f> <Esc>: silent exec '.!inks "'.getline('.').'" %:p:h > /dev/null '<CR>:w<CR>i
" 在i模式下读取当行并吃掉，然后第一个参数给当行内容（允许含空格），第二个参数给当前tex文件的路径位置。运行后保存tex并进入i模式
" nnoremap <C-f> : silent exec '.!echo "'.getline('.').'" ; inks "'.input('.').'" %:p:h > /dev/null '<CR>
" 在n模式下读取当行、吃掉并输出（保留当行），然后敲入文件名，第二个参数给当前tex文件的路径位置。运行后进入n模式

