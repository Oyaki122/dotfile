local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

	-- Override plugin definition options

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- format & linting
			{
				"jose-elias-alvarez/null-ls.nvim",
				config = function()
					require("custom.configs.null-ls")
				end,
			},
		},
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end, -- Override to setup mason-lspconfig
	},

	-- override plugin configs
	{
		"williamboman/mason.nvim",
		opts = overrides.mason,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
	},
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "windwp/nvim-autopairs",
      config = function(_, opts)
        require("nvim-autopairs").setup(opts)
        local Rule = require('nvim-autopairs.rule')
        local npairs = require('nvim-autopairs')
        local cond = require('nvim-autopairs.conds')
        npairs.remove_rule('`')
        npairs.add_rule(
          Rule("`","`")
            :with_pair(cond.not_filetypes({"verilog", "systemverilog"}))
        )

        -- setup cmp for autopairs
        local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
      end,
    },
  },

	-- Install a plugin
	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("better_escape").setup()
		end,
	},

	{
		"github/copilot.vim",
		lazy = false,
		config = function()
			vim.g.copilot_no_tab_map = true
			vim.api.nvim_set_keymap("i", "<C-i>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
		end,
	},

	{
		"p00f/nvim-ts-rainbow",
		event = "BufRead",
		config = function()
			require("nvim-treesitter.configs").setup({
				rainbow = {
					enable = true,
					extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
					max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
				},
			})
		end,
	},

  {
    "soramugi/auto-ctags.vim",
    config = function()
      vim.g.auto_ctags = 1;
    end
  },

  {
    "rhysd/clever-f.vim",
    event = "BufRead"
  },

  {
    "unblevable/quick-scope",
    event = "BufRead"
  },

  {
    "monaqa/dial.nvim",
    event = "BufRead"
  },

  {
    "rapan931/lasterisk.nvim",
    event = "BufRead",
    config = function ()
      vim.keymap.set('n', '*',  function()
        require("lasterisk").search()
      end)
      vim.keymap.set('n', 'g*', function()
        require("lasterisk").search({ is_whole = false })
      end)
      vim.keymap.set('x', 'g*', function()
        require("lasterisk").search({ is_whole = false })
      end)
    end
  }



	-- To make a plugin not be loaded
	-- {
	--   "NvChad/nvim-colorizer.lua",
	--   enabled = false
	-- },

	-- All NvChad plugins are lazy-loaded by default
	-- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
	-- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
	-- {
	--   "mg979/vim-visual-multi",
	--   lazy = false,
	-- }
  --
  -- {
  --   "nat-418/tcl.nvim",
  --   config = function()
  --     -- vim.cmd.packadd('tcl.nvim')
  --     require('tcl').setup()
  --   end,
  --   event = "BufRead"
  -- }
}

return plugins
