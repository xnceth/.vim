filetype off
filetype plugin indent off

" Runtime - Pathogen
runtime bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect()

" Runtime - Golang
" set runtimepath+=/cygdrive/c/Go/misc/vim/ 

set cursorline
set encoding=utf-8
set expandtab
set hlsearch
set ic
set incsearch
set laststatus=2
set nocompatible
set ruler
set shiftwidth=3
set showcmd
set tabstop=3
set listchars=tab:>-,eol:¬

" http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
" set completeopt=longest,menu

colorscheme xncSlate 

" Editor encoding
let &termencoding=&encoding

" Console encoding
language messages en_US.utf-8

" Easy <ESC>
inoremap ;; <ESC>

" Easy scrolling
nnoremap j jzz
nnoremap k kzz

" Automatically append closing characters
" [http://vim.wikia.com/wiki/Automatically_append_closing_characters]
inoremap {{     {}<Left>
inoremap {<CR>  {<CR>}<Esc>O<Tab>
inoremap ((     ()<Left>
inoremap [[     []<left>
inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
inoremap <expr> ]  strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"
inoremap <C-J> <DOWN>
inoremap <C-K> <UP>

" Switch : and ;
nnoremap ; :
nnoremap : ;

" Echo info about the current or supplied project.
" set statusline=%<%f\ %M\ %h%r%=%-10.(%l,%c%V\ %{eclim#project#util#ProjectStatusLine()}%)\ %P

" ECLIM {
" set runtimepath+=/cygdrive/c/Vim/vimfiles
" Disable Eclim with Taglist. [https://groups.google.com/forum/?fromgroups#!topic/eclim-user/GHy9_DsQA3s] 
" let g:taglisttoo_disabled = 1
" let g:EclimTaglistEnabled = 0
" let g:EclimDisable = 1
" Disable eclim logging plugin.
" let g:EclimLoggingDisabled = 1
" let g:EclimProjectStatusLine = 'p=${name}, n=${natures}'
" Use semantic completers from Eclim for YouCompleteMe
" let g:EclimCompletionMethod = 'omnifunc'
" } ECLIM

" Trigger configuration. Not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsSnippetDirectories=["snip"]
" let g:UltiSnipsExpandTrigger="<c-o>"
" let g:UltiSnipsJumpForwardTrigger="<c-j>"
" let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" let g:UltiSnipsListSnippets="<c-l>"
" let g:UltiSnipsEditSplit="vertical"
let g:ycm_error_symbol="!"
let g:ycm_warning_symbol="?"
let g:ycm_key_invoke_completion="<F11>"
let g:ycm_key_list_select_completion=["<TAB>", "<DOWN>"]
let g:ycm_key_list_previous_completion=["<S-TAB>", "<UP>"]

autocmd Filetype java nnoremap <F3> :JavaSearchContext<CR><ESC>
autocmd Filetype c nnoremap <F2> :YcmDiags<CR><ESC>:q
autocmd Filetype c nnoremap <F3> :YcmCompleter GoToDefinition<CR><ESC>
autocmd Filetype c nnoremap <F4> :YcmCompleter GoToDeclaration<CR><ESC>
autocmd Filetype c nnoremap <F5> :YcmForceCompileAndDiagnostics<CR><ESC>
autocmd Filetype c nnoremap <F6> :w<BAR>:make test<CR>

" Enable the C reference within editor. Requires 'CRefVim' plugin.
autocmd BufNewFile, BufRead *.c helptags ~/.vim/bundle/CRefVim/doc

" Turn off the preview window after inserting.
" autocmd InsertLeave * if pumvisible() == 0|pclose|endif 

" Identify the syntax highlighting group used at the cursor.
" http://vim.wikia.com/wiki/Identify_the_syntax_highlighting_group_used_at_the_cursor
noremap <F12> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>


filetype plugin indent on
syntax on
