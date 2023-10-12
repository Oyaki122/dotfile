vim.cmd([[
let g:fern#renderer = "nerdfont"
let g:fern#default_hidden=1

augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
  autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END
nnoremap <Plug>(fern-close-drawer) :<C-u>FernDo close -drawer -stay<CR>
nmap <buffer><silent> <Plug>(fern-action-open-and-close)
    \ <Plug>(fern-action-open)
    \ <Plug>(fern-close-drawer)
]])

vim.keymap.set('n', '<C-n>', ':Fern . -reveal=%<CR>', { silent = true, noremap = true })

-- 下記の記述はtrash-cliを用いない場合にファイル等を削除する方法
-- ただし内部的には $ rm のため、原則使わない

-- function! s:fern_settings() abort
--   nmap <silent> <buffer> dd <Plug>(fern-action-remove)
-- endfunction

-- augroup fern-settings
--   autocmd!
--   autocmd FileType fern call s:fern_settings()
-- augroup END
