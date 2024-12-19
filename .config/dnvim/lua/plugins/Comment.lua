vim.keymap.set('v', '<C-_>', 'gc', { remap = true })

return {
  'numToStr/Comment.nvim',
  event = { "BufReadPre", "BufNewFile" },
  -- opts = {
  --   toggler = {
  --     line = '<C-/>',
  --     block = '<C-S-/>'
  --   }
  -- },
  config = function()
    require('Comment').setup({
      toggler = {
        line = '<C-_>',   -- <C-/>扱いになるらしい
      }
    })
  end
}
