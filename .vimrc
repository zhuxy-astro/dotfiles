version 6.0
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
inoremap <silent> <C-Tab> =UltiSnips#ListSnippets()
imap <M-C-Right> <Plug>(copilot-accept-line)
imap <M-Right> <Plug>(copilot-accept-word)
imap <M-Bslash> <Plug>(copilot-suggest)
imap <M-[> <Plug>(copilot-previous)
imap <M-]> <Plug>(copilot-next)
imap <Plug>(copilot-suggest) <Cmd>call copilot#Suggest()
imap <Plug>(copilot-previous) <Cmd>call copilot#Previous()
imap <Plug>(copilot-next) <Cmd>call copilot#Next()
imap <Plug>(copilot-dismiss) <Cmd>call copilot#Dismiss()
inoremap <silent> <Plug>(ale_complete) :ALEComplete
inoremap <Left> =LeftArrow()
inoremap <Right> =RightArrow()
inoremap <Down> gj
inoremap <Up> gk
imap <S-Left> <Plug>(copilot-accept-word)
map! <D-v> *
nmap v <Plug>SlimeConfig
nmap  <Plug>SlimeParagraphSend
xmap  <Plug>SlimeRegionSend
snoremap <silent>  "_c
nnoremap <silent>  :TmuxNavigateLeft
xnoremap <silent> 	 :call UltiSnips#SaveLastVisualSelection()gvs
snoremap <silent> 	 :call UltiSnips#ExpandSnippetOrJump()
nnoremap <silent> <NL> :TmuxNavigateDown
nnoremap <silent>  :TmuxNavigateUp
nnoremap <silent>  :TmuxNavigateRight
snoremap  "_c
tnoremap  
nnoremap <silent>  :TmuxNavigatePrevious
noremap [t :cprev
noremap \t :call TocCleaned('\"|')
noremap \x :cclose
map <silent> \k :ALEPrevious
map <silent> \j :ALENext
nnoremap \f :ALEFix
nnoremap \A :ALEToggle
noremap \[ :call DelComment('"')
noremap \] :call AddComment('"')
noremap \d :DiffSaved
nmap <silent> \L :loadview
nmap <silent> \M :mkview
nnoremap \m :!make
noremap \F :!open -R %:p
xnoremap \R y:%s/+/+/g<Left><Left>
nnoremap \R :%s/\<\>//g<Left><Left>
nnoremap \T :!ctags -R .
noremap ]t :cnext
xmap gx <Plug>NetrwBrowseXVis
nmap gx <Plug>NetrwBrowseX
xnoremap <silent> <Plug>NetrwBrowseXVis :call netrw#BrowseXVis()
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#BrowseX(netrw#GX(),netrw#CheckIfRemote(netrw#GX()))
snoremap <C-R> "_c
snoremap <silent> <C-H> "_c
snoremap <silent> <Del> "_c
snoremap <silent> <BS> "_c
snoremap <silent> <C-Tab> :call UltiSnips#ListSnippets()
nnoremap <silent> <Plug>(ale_info_preview) :ALEInfo -preview
nnoremap <silent> <Plug>(ale_info_clipboard) :ALEInfo -clipboard
nnoremap <silent> <Plug>(ale_info_echo) :ALEInfo -echo
nnoremap <silent> <Plug>(ale_info) :ALEInfo
nnoremap <silent> <Plug>(ale_repeat_selection) :ALERepeatSelection
nnoremap <silent> <Plug>(ale_code_action) :ALECodeAction
nnoremap <silent> <Plug>(ale_filerename) :ALEFileRename
nnoremap <silent> <Plug>(ale_rename) :ALERename
nnoremap <silent> <Plug>(ale_import) :ALEImport
nnoremap <silent> <Plug>(ale_documentation) :ALEDocumentation
nnoremap <silent> <Plug>(ale_hover) :ALEHover
nnoremap <silent> <Plug>(ale_find_references) :ALEFindReferences
nnoremap <silent> <Plug>(ale_go_to_implementation_in_vsplit) :ALEGoToImplementation -vsplit
nnoremap <silent> <Plug>(ale_go_to_implementation_in_split) :ALEGoToImplementation -split
nnoremap <silent> <Plug>(ale_go_to_implementation_in_tab) :ALEGoToImplementation -tab
nnoremap <silent> <Plug>(ale_go_to_implementation) :ALEGoToImplementation
nnoremap <silent> <Plug>(ale_go_to_type_definition_in_vsplit) :ALEGoToTypeDefinition -vsplit
nnoremap <silent> <Plug>(ale_go_to_type_definition_in_split) :ALEGoToTypeDefinition -split
nnoremap <silent> <Plug>(ale_go_to_type_definition_in_tab) :ALEGoToTypeDefinition -tab
nnoremap <silent> <Plug>(ale_go_to_type_definition) :ALEGoToTypeDefinition
nnoremap <silent> <Plug>(ale_go_to_definition_in_vsplit) :ALEGoToDefinition -vsplit
nnoremap <silent> <Plug>(ale_go_to_definition_in_split) :ALEGoToDefinition -split
nnoremap <silent> <Plug>(ale_go_to_definition_in_tab) :ALEGoToDefinition -tab
nnoremap <silent> <Plug>(ale_go_to_definition) :ALEGoToDefinition
nnoremap <silent> <Plug>(ale_fix) :ALEFix
nnoremap <silent> <Plug>(ale_detail) :ALEDetail
nnoremap <silent> <Plug>(ale_lint) :ALELint
nnoremap <silent> <Plug>(ale_reset_buffer) :ALEResetBuffer
nnoremap <silent> <Plug>(ale_disable_buffer) :ALEDisableBuffer
nnoremap <silent> <Plug>(ale_enable_buffer) :ALEEnableBuffer
nnoremap <silent> <Plug>(ale_toggle_buffer) :ALEToggleBuffer
nnoremap <silent> <Plug>(ale_reset) :ALEReset
nnoremap <silent> <Plug>(ale_disable) :ALEDisable
nnoremap <silent> <Plug>(ale_enable) :ALEEnable
nnoremap <silent> <Plug>(ale_toggle) :ALEToggle
nnoremap <silent> <Plug>(ale_last) :ALELast
nnoremap <silent> <Plug>(ale_first) :ALEFirst
nnoremap <silent> <Plug>(ale_next_wrap_warning) :ALENext -wrap -warning
nnoremap <silent> <Plug>(ale_next_warning) :ALENext -warning
nnoremap <silent> <Plug>(ale_next_wrap_error) :ALENext -wrap -error
nnoremap <silent> <Plug>(ale_next_error) :ALENext -error
nnoremap <silent> <Plug>(ale_next_wrap) :ALENextWrap
nnoremap <silent> <Plug>(ale_next) :ALENext
nnoremap <silent> <Plug>(ale_previous_wrap_warning) :ALEPrevious -wrap -warning
nnoremap <silent> <Plug>(ale_previous_warning) :ALEPrevious -warning
nnoremap <silent> <Plug>(ale_previous_wrap_error) :ALEPrevious -wrap -error
nnoremap <silent> <Plug>(ale_previous_error) :ALEPrevious -error
nnoremap <silent> <Plug>(ale_previous_wrap) :ALEPreviousWrap
nnoremap <silent> <Plug>(ale_previous) :ALEPrevious
nmap <C-C>v <Plug>SlimeConfig
nmap <C-C><C-C> <Plug>SlimeParagraphSend
noremap <SNR>15_Operator :call slime#store_curpos():set opfunc=slime#send_opg@
nnoremap <silent> <C-Bslash> :TmuxNavigatePrevious
nnoremap <silent> <C-L> :TmuxNavigateRight
nnoremap <silent> <C-K> :TmuxNavigateUp
nnoremap <silent> <C-J> :TmuxNavigateDown
nnoremap <silent> <C-H> :TmuxNavigateLeft
xmap <C-C><C-C> <Plug>SlimeRegionSend
tnoremap <C-W><C-[> 
nnoremap <Right>  
nnoremap <Left> <BS>
nnoremap <Down> gj
nnoremap <Up> gk
map <ScrollWheelDown> 
map <ScrollWheelUp> 
xmap <BS> "-d
vmap <D-x> "*d
vmap <D-c> "*y
vmap <D-v> "-d"*P
nmap <D-v> "*P
inoremap <silent> 	 =UltiSnips#ExpandSnippetOrJump()
inoremap "" ""<Left>
inoremap '' ''<Left>
inoremap () ()<Left>
inoremap <> <><Left>
map · `
inoremap [] []<Left>
inoremap `` ``<Left>
map ” "
map “ "
map ’ '
map ‘ '
map …… ^
map 。 .
map 」 }
map 「 {
map 》 >
map 《 <
map 】 ]
map 【 [
map 、 \
map ） )
map （ (
map ～ ~
map ， ,
map ？ ?
map ； ;
map ： :
inoremap {} {}<Left>
let &cpo=s:cpo_save
unlet s:cpo_save
set autoindent
set autoread
set backspace=2
set cindent
set clipboard=unnamed
set completeopt=longest,menu,fuzzy
set confirm
set dictionary=/usr/share/dict/words
set display=lastline
set expandtab
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set helplang=en
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set mouse=inv
set report=0
set runtimepath=~/.vim,~/.vim/bundle/Vundle.vim,~/.vim/bundle/vim-colors-github,~/.vim/bundle/vim-tmux-navigator,~/.vim/bundle/vim-slime,~/.vim/bundle/ale,~/.vim/bundle/copilot.vim,~/.vim/bundle/ultisnips,/opt/homebrew/share/vim/vimfiles,/opt/homebrew/share/vim/vim91,/opt/homebrew/share/vim/vimfiles/after,~/.vim/after,~/.vim/bundle/Vundle.vim,~/.vim/bundle/Vundle.vim/after,~/.vim/bundle/vim-colors-github/after,~/.vim/bundle/vim-tmux-navigator/after,~/.vim/bundle/vim-slime/after,~/.vim/bundle/ale/after,~/.vim/bundle/copilot.vim/after,~/.vim/bundle/ultisnips/after
set shiftwidth=4
set showcmd
set showmatch
set smartindent
set smarttab
set softtabstop=4
set splitbelow
set splitright
set statusline=%<%f%h%m%r\ %y%=\ Ln\ %l/%L,\ Col\ %c\ \ %p%%
set tabstop=4
" vim: set ft=vim :
