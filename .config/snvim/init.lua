require('plugins')

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

vim.g.mapleader = ' '

vim.cmd("autocmd!")

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.opt.number = true
vim.wo.number = true
vim.wo.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 2
vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.inccommand = 'split'
vim.opt.ignorecase = true 
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.wrap = true 
vim.opt.helplang = 'ja','en'
vim.opt.updatetime = 300
vim.opt.showtabline = 2
vim.opt.clipboard = 'unnamedplus'
vim.opt.termguicolors = true
vim.opt.signcolumn = 'yes'
vim.opt.hidden = true
vim.opt.swapfile = false
vim.opt.wrap = true

-- float-transparent
vim.opt.winblend = 5
-- Python3
vim.cmd([[
    let g:python3_host_prog = '/usr/bin/python3'
]])

-- 不可視文字を非表示(colorscheme用)
vim.opt.list = false

local keymap = vim.keymap
-- キーバインド
-- アクティブウィンドウの移動
-- keymap.set('', 'sh', '<C-w>h')
-- keymap.set('', 'sk', '<C-w>k')
-- keymap.set('', 'sj', '<C-w>j')
-- keymap.set('', 'sl', '<C-w>l')

-- Emacs風
keymap.set('i', '<C-f>', '<Right>')
-- jjでEscする
keymap.set('i','<C-c>','<Esc>')

-- 設定ファイルを開く
-- keymap.set('n','<C-,>',':edit $MYVIMRC<CR>')
keymap.set('n', '<C-Tab>', ':echo "hoge"<CR>')
keymap.set('n', '<C-S-Tab>', ':echo "hoge"<CR>')

keymap.set('i', '<C-j>', '<Plug>(skkeleton-toggle)')
keymap.set('c', '<C-j>', '<Plug>(skkeleton-toggle)')

vim.api.nvim_exec([[
  call skkeleton#config({
   \'eggLikeNewline':v:true
 \})
  call skkeleton#config({ 'globalJisyo': '~/.skk/SKK-JISYO.L' })
  call skkeleton#register_keymap('input', ';', 'henkanPoint')
]],true)


vim.api.nvim_exec(
[[
" 「日本語入力固定モード」の動作モード

let IM_CtrlMode = 1

" 「日本語入力固定モード」切替キー

" inoremap <silent> <C-j> <C-r>=IMState('FixMode')<CR>

" IBus 1.5以降

function! g:IMCtrl(cmd)

  let cmd = a:cmd

  if cmd == 'On'

    let res = system('ibus engine "mozc-jp"')
    echo "On"

  elseif cmd == 'Off'

    let res = system('ibus engine "xkb:us::eng"')
    echo "Off"

  endif

  return ''

endfunction
]], true)


-- color theme
vim.api.nvim_exec([[
	if (has("termguicolors"))
	 set termguicolors
	endif

	syntax enable
	colorscheme tender
]], true)

