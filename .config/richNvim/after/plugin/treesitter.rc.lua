local status, treesitter = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

treesitter.setup {
  ensure_installed = {"vim", "lua"},
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false, -- catpuucin用
    disable = {},
  },
	indent ={
		enable =true,
    disable ={"html"},
	},
  autotag = {
    enable = true,
  },
}
