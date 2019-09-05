"==========================================  
"General  
"==========================================  
" history存储长度。  
set history=1000         
"检测文件类型  
filetype on  
" 针对不同的文件类型采用不同的缩进格式    
filetype indent on                 
filetype plugin on  
filetype plugin indent on  
"兼容vi模式。去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限  
set nocompatible        
set autoread          " 文件修改之后自动载入。  
set shortmess=atI       " 启动的时候不显示那个援助索马里儿童的提示  

" 取消备份。  
"urn backup off, since most stuff is in SVN, git et.c anyway...  
set nobackup  
set nowb  
set noswapfile  
  
"贴时保持格式  
set paste  
"- 则点击光标不会换,用于复制  
set mouse-=a           " 在所有的模式下面打开鼠标。  
set selection=exclusive    
set selectmode=mouse,key  
  
" No annoying sound on errors  
" 去掉输入错误的提示声音  
set noerrorbells  
set novisualbell  
set t_vb=  
set tm=500    
  
"==========================================  
" show and format  
"==========================================  
"显示行号：  
set number  
set nowrap                    " 取消换行。  
"为方便复制，用<F6>开启/关闭行号显示:  
nnoremap <F6> :set nonumber!<CR>:set foldcolumn=0<CR>  

"括号配对情况  
set showmatch  
" How many tenths of a second to blink when matching brackets  
set mat=2  
  
"设置文内智能搜索提示  
" 高亮search命中的文本。  
set hlsearch            
" 搜索时忽略大小写  
set ignorecase  
" 随着键入即时搜索  
set incsearch  
" 有一个或以上大写字母时仍大小写敏感  
set smartcase  
  
" 代码折叠  
set foldenable  
" 折叠方法  
" manual    手工折叠  
" indent    使用缩进表示折叠  
" expr      使用表达式定义折叠  
" syntax    使用语法定义折叠  
" diff      对没有更改的文本进行折叠  
" marker    使用标记进行折叠, 默认标记是 {{{ 和 }}}  
set foldmethod=syntax  
" 在左侧显示折叠的层次  
"set foldcolumn=4  
  
set tabstop=4                " 设置Tab键的宽度        [等同的空格个数]  
set shiftwidth=4  
set expandtab                " 将Tab自动转化成空格    [需要输入真正的Tab键时，使用 Ctrl+V + Tab]  
" 按退格键时可以一次删掉 4 个空格  
set softtabstop=4  
  
set ai "Auto indent  
set si "Smart indent  
  
"==========================================  
" status  
"==========================================  
"显示当前的行号列号：  
set ruler  
"在状态栏显示正在输入的命令  
set showcmd  
  
" Set 7 lines to the cursor - when moving vertically using j/k 上下滚动,始终在中间  
set so=7    
"set cursorline              " 突出显示当前行    

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'majutsushi/tagbar'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Lokaltog/vim-powerline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'STL-improved'
Plugin 'tczengming/autoload_cscope.vim'
Plugin 'CmdlineComplete'
Plugin 'xptemplate'
Plugin 'neocomplcache'
Plugin 'genutils'
Plugin 'lookupfile'
Plugin 'wincent/Command-T'
Plugin 'autopreview'
Plugin 'echofunc.vim'
Plugin 'Toggle'
Plugin 'Color-Sampler-Pack'
Plugin 'txt.vim'
Plugin 'mru.vim'
Plugin 'YankRing.vim'
Plugin 'tpope/vim-surround.git'
Plugin 'DoxygenToolkit.vim'
Plugin 'tczengming/headerGatesAdd.vim'
" Plugin 'ShowMarks'
call vundle#end()            "required

let mapleader="\<Space>"

syntax enable
set background=dark
colorscheme solarized

" NERDTree config
" open a NERDTree automatically when vim starts up
autocmd vimenter * NERDTree
"open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
"map F2 to open NERDTree
map <F2> :NERDTreeToggle<CR>
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" YcmCompleter
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'

" Tagbar
let g:tagbar_width=35
let g:tagbar_autofocus=1
let g:tagbar_left = 0
nmap <F3> :TagbarToggle<CR>

" 打开ctrlp搜索
let g:ctrlp_map = '<leader>ff'
let g:ctrlp_cmd = 'CtrlP'
" 相当于mru功能，show recently opened files
map <leader>fp :CtrlPMRU<CR>
"set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux"
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz)$',
    \ }
"\ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files.
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " Ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Vim-powerline'
let g:Powerline_symbols = 'fancy'
set encoding=utf-8 
set laststatus=2

"YankRing
"将yankring的历史文件夹移到~/.vim
let g:yankring_history_dir = $HOME.'/.vim/'
"修改历史文件名
let g:yankring_history_file = '.yankring_history'
"<leader>m选择上一个复制的文本
let g:yankring_replace_n_pkey = '<Leader>m'
"<leader>n选择下一个复制的文本
let g:yankring_replace_n_pkey = '<Leader>n'
"<leader>y显示yankring中的内容
nmap <Leader>y :YRShow<CR>

"Cscope
if has("cscope")
set csprg=/usr/bin/cscope
set csto=0
set cst
set nocsverb
set cscopequickfix=s-,c-,d-,i-,t-,e-
" add any database in current directory
if filereadable("cscope.out")
cs add cscope.out
" else add database pointed to by environment
elseif $CSCOPE_DB != ""
cs add $CSCOPE_DB
endif
set csverb
endif
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
