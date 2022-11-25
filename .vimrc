syntax on
colorscheme gruvbox
set background=dark
set nu
let g:gruvbox_number_column = '1'
let g:gruvbox_color_column = '1'
let g:gruvbox_improved_warnings = '1'
set mouse=a
set autoindent
set expandtab 
set tabstop=2
set shiftwidth=2
set nocompatible
autocmd InsertLeave * set iminsert=0
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'morhetz/gruvbox'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'suxpert/vimcaps'

call vundle#end()
filetype plugin indent on

" NERDTree Configs
nmap <F6> :NERDTreeToggle<CR>
"autocmd VimEnter * NERDTree
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" End NERDTree Configs

inoremap ( ()<esc>:call BC_AddChar(")")<cr>i
inoremap { {}<esc>:call BC_AddChar("}")<cr>i
inoremap [ []<esc>:call BC_AddChar("]")<cr>i
inoremap ' ''<esc>:call BC_AddChar("'")<cr>i
inoremap " ""<esc>:call BC_AddChar("\"")<cr>i
inoremap <C-j> <esc>:call search(BC_GetChar(), "W")<cr>a
function! BC_AddChar(schar)
   if exists("b:robstack")
       let b:robstack = b:robstack . a:schar
   else
       let b:robstack = a:schar
   endif
endfunction
function! BC_GetChar()
   let l:char = b:robstack[strlen(b:robstack)-1]
   let b:robstack = strpart(b:robstack, 0, strlen(b:robstack)-1)
   return l:char
endfunction


