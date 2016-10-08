
"------
"general
"------

set nocompatible "use vim as vim
set history=2000
set browsedir=buffer
set viminfo+=! "make sure it can save viminfo
set ffs=unix,dos
set fenc=utf-8 "default fileencoding
set fencs=utf-8,ucs-bom,euc-jp,gb18030,gb2312,cp936
filetype on "enable file type detection
filetype plugin on "enable loading the plugin for appropriata filetype
filetype plugin indent on  "启动自动补全
set autoread "文件修改后自动载入
set mouse=a

""""""""""""""""""""""""""""""""""""

"set cursorcolumn
"set cursorline          " 突出显示当前行

"Set tags
set tags=tags
"set autochdir

"when vimrc is edited reload it 
autocmd! bufwritepost vimrc source ~/.vimrc 

""""""""""""""""""""""""""""""
"=>vim user interface
"""""""""""""""""""""""""""
" Set 7 lines to the curors -when moving vertical..
set so=7

set showcmd
"for jedi-vim func paramter
"set showmode
set noshowmode

set wildmenu " Turn no wild menu

set ruler "Alway show current position

"set cmdheight=2 "the commandbar height

set hid  " change buffer - without saving

set linespace=4

"Set backspace cofing
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

"search 
set ignorecase
set smartcase
set incsearch
set novisualbell
set title                " change the terminal's title
set hlsearch
set nolazyredraw " Don't redraw while executing macros
set showmatch " show matching bracets when text indicator is over them""""""""""""""""""""""""""""""
set magic " Set magic on 
set mat=2 "how many theths of a seound to blink

"NO sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm =500

set cindent  

"------
"platform dependent
"--------
function! MySys() 
	return "linux"
endfunction
"---
"colors and fonts
"----

"set font according to system
if MySys() == "mac"
	set gfn=Menlo:h14
	set shell=/bin/bash
elseif MySys()=="windows"
	set gfn=Bitstream\Vera\Sans\Mono:h10
elseif MySys() == "linux"
	set gfn=Monaco\ 15
	set shell=/bin/bash
endif

"==========================================
" Theme Settings  主题设置
"==========================================
if has("gui_running")
    " 去掉菜单
    set guifont=Monaco:h14
    if has("gui_gtk2")   "GTK2
        set guifont=Monaco\ 12,Monospace\ 12
    endif
    set guioptions-=m
	set guioptions-=T
	set guioptions-=l
	set guioptions-=r
	set background=dark
	colorscheme calmar256-dark
	"colorscheme molokai
	set nu
else
	"colorscheme slate 
	"colorscheme molokai
	"colorscheme peaksea
	"colorscheme calmar256-dark
	set background=dark
    syntax on
    set t_Co=256
    colorscheme solarized
	set nu
endif

"''''''''''''''''''''''''''''
"=>Files backups and undo
""""""""""""""""""""""""""""
"Turn backup off 
"取消备份
set nobackup 
set nowb
"关闭交换文件
set noswapfile
"Persistent undo

"""""""""""""""""""""'
"=>Text ,tab and indent related
""""""""""""""""""""""
set expandtab   " tab自动转化成空格
set shiftwidth=4 " 每一次缩进对应的空格数
set tabstop=4   "tab 键宽度
set smarttab
set shiftround  "缩进时，取整use multiple of shiftwidth when indenting with '<' and '>'

set lbr
set tw=500

set ai
set si
"set wrap "Wrap lines
"""""""""""""
" hot key setting
""""""""""""""""

"With a map leader it's possible to do extra key combinations
let mapleader=";"
"Fast saving  test
nmap <leader>ww :w<cr>
nmap <leader>wf :w!<cr>
nmap <leader>q :q!<cr>
nmap <leader>wq :wq!<cr>
nmap <leader>qa :qall!<cr>
" mac 下操作系统剪切板
vnoremap <Leader>y :w !pbcopy<CR><CR>
nmap <Leader>p :r !pbpaste<CR><CR>

"""""""""""""""""""
"=> Visual mod related
""""""""""""""""

"In visual mode when you press * or # to search for the curren selection
vnoremap <silent>* :call VisualSearch('f')<cr>
vnoremap <silent># :call VisualSearch('b')<cr> 

" When you press gv  you vimgrep after the selected text
vnoremap <silent>gv :call VisualSearch('gv')<cr>

"""""""""""""""
"tab setting
""""""""""""""
" normal模式下切换到确切的tab
"noremap <leader>1 1gt
"noremap <leader>2 2gt
"noremap <leader>3 3gt
"noremap <leader>4 4gt
"noremap <leader>5 5gt
"noremap <leader>6 6gt
"noremap <leader>7 7gt
"noremap <leader>8 8gt
"noremap <leader>9 9gt
"noremap <leader>0 :tablast<cr>
"
"buffer switch
noremap <leader>1 :1b<cr>
noremap <leader>2 :2b<cr>
noremap <leader>3 :3b<cr>
noremap <leader>4 :4b<cr>
noremap <leader>5 :5b<cr>
noremap <leader>6 :6b<cr>
noremap <leader>7 :7b<cr>
noremap <leader>8 :8b<cr>
noremap <leader>9 :9b<cr>
"noremap <leader>0 :tablast<cr>

""""""""""""'
"=> Moving arongd ,tabs and buffers
""""""""""""""""""
map <space> /
map <c-space> ?

"map <right> :bn <cr>
"map <left> :bp <cr>

"Tab configuration
map <leader>tn :tabnew
map <leader>te :tabedit
map <leader>tc :tabclose<cr>

" when pressing <leader> cd switch to the dir of open buffer
map <leader>cd  :cd %:p:h<cr>


""""""""""""""""""""""""""""""""""""""
"=>Spell checking 
"""""""""""""""""""""""""""""""""""""""
"pressing ;ss will toggle and untotoggle spell checking
map <leader>sp :setlocal spell!<cr>


"Fasting editing of the .vimrc
nmap <leader>e :e! ~/.vimrc<cr>
nmap <leader>ss :source ~/.vimrc<cr>
nmap <leader>cd :chdir ~/paint/ <cr>
nmap <leader>m :set mouse=i <cr>
"canle higt light
nmap <leader><cr> :noh<cr>

nmap <C-s> :wa <cr>


"""""""""""""""""""""""""""""""""""""""
" Plugin confi
""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""
"i don't understand
""""""""""""""""""""""''
noremap <F3> :!./vitags.sh<CR>:cs reset<CR>
noremap <S-F3> :!cvs up<CR>

if has("cscope")
	set csprg=/usr/local/bin/cscope

	set csto=0
	set cst
	set nocsverb
	" add any database in current directory
	if filereadable("cscope.out")
	    cs add cscope.out
	" else add database pointed to by environment
	elseif $CSCOPE_DB != ""
	    cs add $CSCOPE_DB
	endif
	set csverb
	set cscopetag
endif

"""""""""""""""""""""""""""""""""""
""winManager setting

"let g:winManagerWindowLayout="FileExplorer|TagList,BufExplorer"
"let g:winManagerWidth=30
"let g:defaultExplorer=0
"let g:AutoOpenWinManager=1
"nmap <C-W><C-F> :FirstExplorerWindown<cr>
"nmap <C-W><C-B> :BottomExplorerWindown<cr>
"nmap <silent><leader>wm :WMToggle<cr>

"""""""""""""""""""""""""""""""""""

"let g:netrw_browse_split=3
"set nocp

"""""""""""""""""""""""""""""""
"CSApprox Configure

"let g:CSApprox_loaded = 1
"set CSApproxSnapshot ~/.vim/colors/calmar256-dark.vim

"""""""""""""""""""""""""""""""
"let g:miniBufExplMapCTabSwitchBufs = 1

"set completeopt=longest,menu
"mnicomplete
set completeopt-=preview                    " remove omnicompletion dropdown"

""""""""""""""""""""""""""""
map <F12> :call Do_CsTag()<CR>
"nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>:copen<CR>
"nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
"nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>:copen<CR>
"nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>:copen<CR>
"nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>:copen<CR>
"nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>:copen<CR>
"nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>:copen<CR>
"nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

" bind Ctrl+<movement> keys  to move around the windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

""""""""""""
"set buffer
"
noremap <left> :bp<CR>
noremap <right> :bn<CR>

" easiter moving of code blocks
vnoremap < <gv 
vnoremap > >gv

"gcc 
"map <leader>gc :!gcc %:p -o %:r -lapue;./%:r <cr>
map <leader>gc :!gcc %:p -o %:r ;./%:r <cr>
map <leader>pp :!python %:p <cr>
map <leader>er :%!xxd <cr>
map <leader>re :%!xxd <cr>
map <C-d> :wq!<CR>
map q %
map `q :if &mouse=='a'<CR>set mouse=v<CR>set nonu<CR>else<CR>set mouse=a<CR>set nu<CR>endif<CR><CR>

"""""""""""
"" floding
"""""""""""""
nmap <silent><leader>zo zO
vmap <silent><leader>zo zO


"python setting
" enable all Python syntax highlighting features
let python_highlight_all = 1
map <leader>pp :!python %:p <cr>
map <leader>pu :!python 


"""""""""""""""""""""""""

"clipboard
"set clipboard=unnamed
"
""""""""""""""""""""""""
"set Vundle
filetype off " required!

set rtp+=~/.vim/bundle/vundle/

call vundle#rc()
" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:
"
"" original repos on github
"Bundle 'tpope/vim-fugitive'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"Bundle 'tpope/vim-rails.git'
" vim-scripts repos
"Bundle 'L9'
"Bundle 'FuzzyFinder'
" non github repos
"Bundle 'taglist.vim'
Bundle "majutsushi/tagbar"
Bundle "scrooloose/nerdtree"
Bundle "bling/vim-airline"
Bundle "vim-airline/vim-airline-themes"
Bundle "Raimondi/delimitMate"
Bundle "scrooloose/nerdcommenter"
Bundle 'EasyGrep'
"for ptyhon 
Bundle "davidhalter/jedi-vim"
Bundle "kien/ctrlp.vim"
Bundle "klen/python-mode"
" ...
"
filetype plugin indent on " required!
"
" Brief help? -- ´˴¦ºó¼ÊvundleµÄ¹ÓÃÁ
" :BundleList????????? - list configured bundles
" :BundleInstall(!)??? - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)????? - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
"
""""""""""
" vim powerline
"set guifont=PowerlineSymbols\ for\ Powerline
"总是显示状态栏
set laststatus=2
"set nocompatible
"let g:Powerline_symbols='fancy'
"set encoding=utf8

"""""""""""
"set vim-airline
let g:airline_theme="luna"
let g:airline_enable_branch=1
let g:airline_enable_syntastic=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show = 1

let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'þ'
"let g:airline_symbols.paste = '∥'
"let g:airline_symbols.whitespace = 'ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

""""""""""""
"
map <leader>t :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
" 显示隐藏文件
let NERDTreeShowHidden=1
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$' ]
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=0
"close vim if the only window left open is a NERDTree
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end
" s/v 分屏打开文件
let g:NERDTreeMapOpenSplit = 's'
let g:NERDTreeMapOpenVSplit = 'v'


" nerdtreetabs
"map <Leader>n <plug>NERDTreeTabsToggle<CR>
" 关闭同步
let g:nerdtree_tabs_synchronize_view=0
let g:nerdtree_tabs_synchronize_focus=0
" 是否自动开启nerdtree
" thank to @ListenerRi, see https://github.com/wklken/k-vim/issues/165
let g:nerdtree_tabs_open_on_console_startup=0
let g:nerdtree_tabs_open_on_gui_startup=0

" 删除文件时自动删除文件对应 buffer
"let NERDTreeAutoDeleteBuffer=1
"let g:NERDTreeDirArrowExpandable = '▸'
"let g:NERDTreeDirArrowCollapsible = '▾'

""""""""""""""
"setting for taglist
"map t :TlistToggle<CR>
"let Tlist_Use_Right_Window = 1 
"let Tlist_Exit_OnlyWindow = 1 
"let Tlist_Show_One_File = 1
"let Tlist_GainFocus_On_ToggleOpen = 1  
"let Tlist_Use_Right_Window=1
"let Tlist_File_Fold_Auto_Close=1
"let Tlist_Show_One_File=1
"let Tlist_Exit_OnlyWindow=1
"map <F4> :TlistToggle<CR>
"noremap <F6> :make<CR>
"noremap <S-F6> :make clean;make<CR>
"noremap <F7> :Tlist<CR>
"noremap <S-F7> :TlistSync<CR>


""""""""""""""
"set tagbar
nmap <F10> :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_sort=0
let g:tagbar_width=35

""""""""
"ctrlp
let g:ctrlp_working_path_mode=0

"""""""""""
"set python-mode
let g:pymode_folding=0
let g:pymode_rope=0
let g:pymode_rope_completion=0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_lint = 0 "code checking

"""""""""""""
" jedi-vim
"
"let g:jedi#completions_command = "<C-M>""
"let g:jedi#force_py_version = 3
"let g:jedi#popup_select_first=0             " Disable choose first option on autocomplete
let g:jedi#show_call_signatures=2           " Show call signatures
let g:jedi#popup_on_dot=1                   " Enable autocomplete on dot

"""""""""""""""
"easygrep
let g:EasyGrepRecursive  = 1

""""""""""""""
" fix bug
""""""""""""""
"Quickfix window opening beneath TagBar
autocmd FileType qf wincmd J

" function def 
function! Do_CsTag()
    let dir = getcwd()
    if filereadable("tags")
        if(g:iswindows==1)
            let tagsdeleted=delete(dir."\\"."tags")
        else
            let tagsdeleted=delete("./"."tags")
        endif
        if(tagsdeleted!=0)
            echohl WarningMsg | echo "Fail to do tags! I cannot delete the tags" | echohl None
            return
        endif
    endif
    if has("cscope")
        silent! execute "cs kill -1"
    endif
    if filereadable("cscope.files")
        if(g:iswindows==1)
            let csfilesdeleted=delete(dir."\\"."cscope.files")
        else
            let csfilesdeleted=delete("./"."cscope.files")
        endif
        if(csfilesdeleted!=0)
            echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.files" | echohl None
            return
        endif
    endif
    if filereadable("cscope.out")
        if(g:iswindows==1)
            let csoutdeleted=delete(dir."\\"."cscope.out")
        else
            let csoutdeleted=delete("./"."cscope.out")
        endif
        if(csoutdeleted!=0)
            echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.out" | echohl None
            return
        endif
    endif
    if(executable('/opt/local/bin/ctags'))
        "silent! execute "!/opt/local/bin/ctags -R --c-types=+p --fields=+S *"
        silent! execute "!/opt/local/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q ."
    endif
    if(executable('cscope') && has("cscope") )
        "if(g:iswindows!=1)
        if filereadable("cscope.files")
            if filereadable("cscope.out")
                execute "cs add cscope.out"
            endif
        else
            silent! execute "!find . -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' > cscope.files"
        "else
        "    silent! execute "!dir /s/b *.c,*.cpp,*.h,*.java,*.cs >> cscope.files"
        "endif
            silent! execute "!cscope -bkq -i cscope.files"
            execute "normal :"
            if filereadable("cscope.out")
                execute "cs add cscope.out"
            endif
        endif
    endif
endfunction

"map `q <Esc>:!echo -en "\033[31;49;5m Please input STB IP: \033[39;49;0m" && read stbip && stbip=`[ "$stbip" = "" ] && echo "$STBIP" \|\| echo "$stbip"` && echo $stbip && echo -e "stbhwmonitor \033[31;49;5m$stbip\033[39;49;0m upgradesoft `ls $RELEASEDIR/images/*.bin` /f" && stbhwmonitor $stbip upgradesoft `ls $RELEASEDIR/images/*.bin` /f<CR>
"
"python添加文件头注释
"
function HeaderPython()
    call setline(1, "#!/usr/bin/env python")
    call append(1, "# -*- coding: utf-8 -*-")
    call append(2, "# ZHR @ " . strftime('%Y-%m-%d %T', localtime()))
    normal G
    normal o
    normal o
endf
autocmd bufnewfile *.py call HeaderPython()


