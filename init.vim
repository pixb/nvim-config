" 常用配置
let mapleader=" "

" 识别文件格式
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

" 行号
set nu


" 设置全局路径
let $VIM_PATH = fnamemodify(resolve(expand('<sfile>:p')), ':h')
" Set data/cache directory as $XDG_CACHE_HOME/vim
let $DATA_PATH =
	\ expand(($XDG_CACHE_HOME ? $XDG_CACHE_HOME : '~/.cache') . '/vim')

" ===========================dein======================== 
" dein Scripts-----------------------------
if &compatible
        set nocompatible               " Be iMproved
endif
" Required:
set runtimepath+=/home/pix/.cache/dein/repos/github.com/Shougo/dein.vim
" Required:
if dein#load_state('/home/pix/.cache/dein')
        call dein#begin('/home/pix/.cache/dein')                                                                     " Let dein manage dein
        " Required:
        call dein#add('/home/pix/.cache/dein/repos/github.com/Shougo/dein.vim')
	call dein#local($VIM_PATH . '/dev', { 'frozen': 1, 'merged': 0 })
	" Defx
	call dein#add('Shougo/defx.nvim', {'on_cmd': 'Defx', 'hook_source': 'source  $VIM_PATH/modules/module-defx.vim'})
	call dein#add('kristijanhusak/defx-git')
	call dein#add('kristijanhusak/defx-icons')
	" WhickKey
	call dein#add('liuchengxu/vim-which-key', {'on_cmd': '[WhichKey, Whichkey!]',
	\ 'hook_add': join(["let g:which_key_map =  { 'name' : 'Leader'}",
	\ "let g:which_key_localmap =  {'name' : 'LocalLeader'}"], "\n"),
	\ "hook_post_source":
	\ "function! s:register_whichkey()\n
	\ let s:leader_key=substitute(get(g:, 'mapleader', '\\'), ' ', '<Space>', '')\n
	\ let s:localleader_key= get(g:, 'maplocalleader', ';')\n
	\ call which_key#register(s:leader_key, 'g:which_key_map')\n
	\ call which_key#register(s:localleader_key, 'g:which_key_localmap')\n
	\ endfunction \n
	\ call s:register_whichkey()"})
	" FloatTerm
	call dein#add('voldikss/vim-floaterm', {
				\ 'on_cmd': '[ FloatermNew, FloatermToggle, FloatermPrev, FloatermNext, FloatermSend]',
				\ 'hook_source': 'source $VIM_PATH/modules/module-floaterm.vim'
				\})
	" VimClap
	call dein#add('liuchengxu/vim-clap', {
				\ 'merged': 0, 
				\ 'build': 'bash install.sh', 'on_map': '{n: <Plug>}', 'hook_add': 'source $VIM_PATH/modules/module-clap.vim'})
	" VimBuffet
	call dein#add('pixb/vim-buffet', { 'on_event': [ 'BufReadPre', 'BufNew'], 'hook_add': 'source $VIM_PATH/modules/module-buffet.vim'})
	" rainbow
	call dein#add('luochen1990/rainbow', { 
				\ 'on_ft': '[ html,css,javascript,javascriptreact,vue,go,python,c,cpp,lua,rust,vim,less,stylus,sass,scss,json,ruby,scala,toml,php,haskell]', 
				\ 'hook_source': 'let g:rainbow_active = 1'})
	" coc
	call dein#add('neoclide/coc.nvim', {'merge':0, 'build': 'yarn install --frozen-lockfile', 'hook_add': 'source  $VIM_PATH/modules/module-coc.vim', 'hook_source': 'source $VIM_PATH/modules/module-lsp.vim'})
	" coc-clap
	call dein#add('vn-ki/coc-clap', {'on_source:': 'vim-clap'})
	" vim-devicons
	call dein#add('ryanoasis/vim-devicons')
	" spaceline
	call dein#add('glepnir/spaceline.vim',{ 'on_event': ['BufReadPre', 'BufNew'], 'hook_add': "let g:spaceline_seperate_style='slant-cons'"})
	" oceanic-material
	call dein#add('glepnir/oceanic-material')
	" context_filetype
	call dein#add('Shougo/context_filetype.vim')
	" Caw
	call dein#add('tyru/caw.vim', {'depends': 'context_filetype.vim', 'on_map': '{ nx: <Plug> }'})
        " Required:
        call dein#end()
        call dein#save_state()
endif
" Required:
filetype plugin indent on
syntax enable
" If you want to install not installed plugins on
" startup.
if dein#check_install()
  call dein#install()
endif
"End dein Scripts-------------------------

" 加载快捷键配置
call utils#source_file($VIM_PATH,'keybinds.vim') 
" 加载主题
call theme#init()

