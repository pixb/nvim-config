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
  call dein#add('tyru/caw.vim', {'on_map': '{nx: <Plug>}'})
	" dashboard
	call dein#add('glepnir/dashboard-nvim',{'hook_add': 'source  $VIM_PATH/modules/module-dashboard.vim'})
	" vim-snippets
	call dein#add('honza/vim-snippets', { 'depends': 'coc.nvim' })
	" vim-md-write
	call dein#add('openpix/vim-md-write', {'on_ft': 'markdown'})
	" vim-table-mode
	call dein#add('dhruvasagar/vim-table-mode', {'on_ft': 'markdown'})
	" vim-markdown
	call dein#add('plasticboy/vim-markdown', {'on_ft': 'markdown',
				\ 'hook_add': join([
				\ "let g:vim_markdown_folding_level = 1",
				\ "let g:vim_markdown_folding_style_pythonic = 1",
				\ "let g:vim_markdown_frontmatter = 1",
				\ "let g:vim_markdown_auto_insert_bullets = 1",
				\ "let g:vim_markdown_new_list_item_indent = 0",
				\ "let g:vim_markdown_conceal_code_blocks = 0",
				\ "let g:vim_markdown_conceal = 0",
				\ "let g:vim_markdown_strikethrough = 1",
				\ "let g:vim_markdown_edit_url_in = 'vsplit'",
				\ "let g:vim_markdown_fenced_languages = ['c++=cpp','viml=vim','bash=sh','ini=dosini','js=javascript','json=javascript','jsx=javascriptreact','tsx=typescriptreact','docker=Dockerfile','makefile=make','py=python']"], "\n")})
	" log-highlighting
	call dein#add('MTDL9/vim-log-highlighting', {'on_ft': 'log'})
	" vim-gfm-syntax
	call dein#add('rhysd/vim-gfm-syntax', { 'depends': 'vim-markdown',
				\ 'on_ft': 'markdown',
				\ 'hook_add': join([
				\ "let g:gfm_syntax_enable_always = 1",
				\ "let g:gfm_syntax_highlight_emoji = 1",
				\ "let g:gfm_syntax_enable_filetypes = ['markdown']"
				\ ], "\n")})
	call dein#add('iamcco/markdown-preview.nvim', {'on_ft': join(['markdown', 'pandoc.markdown', 'rmd'], "\n"),
				\ 'build': 'sh -c "cd app & yarn install"',
				\ 'hook_source': join(["let g:mkdp_auto_start = 0",
				\ 'let g:mkdp_browser="/usr/bin/chromium"'], "\n")})
	call dein#add('editorconfig/editorconfig-vim')
  call dein#add('rizzatti/dash.vim', {'if':  "has('mac')",
        \ 'on_map': '{ n: <Plug> }',
        \ 'hook_source': "let g:dash_map = {
        \ 'javascript': ['javascript', 'NodeJS'],
        \ 'javascriptreact': ['react'],
        \ 'html': ['html', 'svg'],
        \ 'go' : 'Go',
        \}"})
  call dein#add('rhysd/accelerated-jk', {'on_map':'{n: <Plug>}'})
  call dein#add('haya14busa/vim-asterisk',{'on_map': '{ vn: <Plug>}'})
  call dein#add('lambdalisue/suda.vim', {'on_event': 'BufRead',
		\ 'hook_add': 'let g:suda_smart_edit=1'})
  call dein#add('ludovicchabant/vim-gutentags', {
        \ 'if': "executable('ctags')",
        \ 'on_event': [ 'BufReadPost', 'BufWritePost' ],
        \ 'hook_source': 'source  $VIM_PATH/modules/module-gutentags.vim'
        \ })
  call dein#add('t9md/vim-choosewin', {
        \ 'on_map': "{ n: <Plug> }",
        \ 'hook_source': 'source  $VIM_PATH/modules/module-choosewin.vim',
        \ })
  call dein#add('psliwka/vim-smoothie', {
        \ 'on_func': 'smoothie#',
        \ 'hook_add': ' let g:smoothie_no_default_mappings = v:true',
        \ })
  call dein#add('thinca/vim-quickrun', {
        \ 'on_cmd': 'QuickRun',
        \ 'hook_source':join([
        \ "let g:quickrun_config = { '_' : {'outputter' : 'message', },}",
        \ "let g:quickrun_config.html = {'command' : 'chromium'}",
        \ "let g:quickrun_no_default_key_mappings = 1"
        \ ], "\n")
        \ })

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

