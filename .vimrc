set enc=utf-8
set fenc=utf-8
set fencs=utf-8,euc-jp,cp932,iso-2022-jp
set nu
set ruler
set nolist
set autoindent
set ts=2
set wrapscan
set formatoptions+=mM
set showcmd
set incsearch
set smartindent
set cindent
set expandtab
set shiftwidth=2
set ts=2
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>
nnoremap Y

if 0 | endif

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'VimClojure'
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'vim-scripts/diffchar.vim'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'mhartington/oceanic-next'
call neobundle#end()
filetype plugin indent on
NeoBundleCheck

""""""""""""""""""""""""""""""
" neocomplcache
""""""""""""""""""""""""""""""
"neocomplcache for auto completing
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

""""""""""""""""""""""""""""""
" Unit.vim
""""""""""""""""""""""""""""""
let g:unite_enable_start_insert=1
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1
noremap <C-P><C-P> :Unite buffer<CR>
noremap <C-N><C-N> :Unite -buffer-name=file file<CR>
noremap <C-O><C-O> :Unite file_rec<CR>
noremap <C-Z> :Unite file_mru<CR>
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
"grep search
nnoremap <silent> ,g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
nnoremap <silent> ,dg  :<C-u>Unite grep -buffer-name=search-buffer<CR>
nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W><CR>
nnoremap <silent> ,r  :<C-u>UniteResume search-buffer<CR>
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

""""""""""""""""""""""""""""""
" NERDTree
""""""""""""""""""""""""""""""
nnoremap <silent><C-e> :NERDTreeToggle<CR>
autocmd BufEnter * lcd %:p:h

filetype indent on
syntax on

""""""""""""""""""""""""""""""
" fugitive.vim
""""""""""""""""""""""""""""""
autocmd QuickFixCmdPost *grep* cwindow
set statusline+=%{fugitive#statusline()}

""""""""""""""""""""""""""""""
" tcomment.vim
""""""""""""""""""""""""""""""
"let g:tcommentMapLeader1 = '<C-#>'

""""""""""""""""""""""""""""""
" vim-indent-guides
""""""""""""""""""""""""""""""
let g:indent_guides_enable_on_vim_startup = 1

""""""""""""""""""""""""""""""
" Colors
""""""""""""""""""""""""""""""
"colorscheme hybrid
"colorscheme solarized
"colorscheme zenburn
colorscheme wombat
"colorscheme OceanicNext

""""""""""""""""""""""""""""""
" Indent
""""""""""""""""""""""""""""""
autocmd Filetype html setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype coffee setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=4 sts=4 sw=4 expandtab

""""""""""""""""""""""""""""""
" auto reload .vimrc
""""""""""""""""""""""""""""""
augroup source-vimrc
  autocmd!
  autocmd BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker
  autocmd BufWritePost *gvimrc if has('gui_running') source $MYGVIMRC
augroup END

""""""""""""""""""""""""""""""
" Commands
""""""""""""""""""""""""""""""
:command! Json :%!python -m json.tool
