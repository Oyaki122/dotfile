return {
  { 'nvim-lua/plenary.nvim' },

  { 'ggandor/lightspeed.nvim' },
  { 'tpope/vim-repeat' },
  { 'terryma/vim-expand-region' },
  { 'gbprod/yanky.nvim' },
--  { 'fuenor/im_control.vim' },

  {
    'joshdick/onedark.vim',
    config = function()
      vim.cmd([[
          colorscheme onedark
      ]])
    end
  },

  -- Fern.vim
  {
    'lambdalisue/fern.vim',
    init = function()
      vim.cmd([[
          let g:["fern#renderer"] = "nerdfont"
      ]])
    end

  },
  { 'lambdalisue/nerdfont.vim' },
  {
    'lambdalisue/fern-renderer-nerdfont.vim',
    dependencies = { 'lambdalisue/fern.vim', 'lambdalisue/nerdfont.vim' },
  },
  { 'lambdalisue/fern-hijack.vim' },
  { 'lambdalisue/glyph-palette.vim' },
  { 'kyazdani42/nvim-web-devicons' },


  { 'romgrk/barbar.nvim',           requires = 'nvim-web-devicons' },

  { 'nvim-lualine/lualine.nvim' },

  {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      require('nvim-treesitter.install').update({ with_sync = true })
    end
  },

  -- telescope
  { 'nvim-telescope/telescope.nvim' },
  { 'kkharji/sqlite.lua' },
  {
    "nvim-telescope/telescope-frecency.nvim",
    requires = { "kkharji/sqlite.lua" }
  },
  { 'fannheyward/telescope-coc.nvim' },
  --
  -- coc.nvim
  { 'neoclide/coc.nvim',             branch = 'release' },
  {
    'rmagatti/auto-session',
    config = function()
      require("auto-session").setup {
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
      }
    end
  },
  {'preservim/nerdcommenter'}
}
