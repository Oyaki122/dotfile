return {
  {
    "neovim/nvim-lspconfig",
    version = "*",
    lazy = false,
    config = function()
      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
        vim.lsp.handlers.hover,
        {
          border = "rounded", -- "single", "shadow" , "none", "rounded"
          -- border = border
          -- width = 100,
        }
      )
    end,
  },
  {
    "williamboman/mason.nvim",
    version = "*",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    version = "*",
    lazy = false,
    config = function()
      local lsp_servers = { "lua_ls", "yamlls", "jsonls", "verible" }
      local diagnostics = { "typos_lsp" }
      require("mason-lspconfig").setup {
        ensure_installed = vim.tbl_flatten({ lsp_servers, diagnostics }),
      }

      local lspconfig = require("lspconfig")
      local handlers = {
        function(server_name) -- default handler (optional)
          lspconfig[server_name].setup {}
        end,
        ["typos_lsp"] = function()
          lspconfig.typos_lsp.setup {}
        end,
        ["lua_ls"] = function()
          lspconfig.lua_ls.setup {
            settings = {
              Lua = {
                diagnostics = { globals = { "vim" } },
                format = { enable = true },
              }
            }
          }
        end,
        ["clangd"] = function()
          lspconfig.clangd.setup {
            -- on_attach = on_attach,
            -- capabilities = cmp_nvim_lsp.default_capabilities(),
            cmd = {
              "clangd",
              "--offset-encoding=utf-16",
            },
          }
        end,
        ["verible"] = function()
          lspconfig.verible.setup {
            filetypes = { "verilog", "systemverilog" },
            cmd = {
              "verible-verilog-ls",
              "--rules=-packed-dimensions-range-ordering,-unpacked-dimensions-range-ordering",
              "--indentation_spaces=4",
              "--named_port_alignment=align",
              "--named_port_indentation=indent",
              "--port_declarations_alignment=align",
              "--port_declarations_indentation=indent",
              "--formal_parameters_indentation=indent",
            },

          }
        end

      }

      require("mason-lspconfig").setup_handlers(handlers)


      -- require("mason-lspconfig").setup_handlers {
      --   function (server_name)
      --     local nvim_lsp = require("lspconfig")
      --
      --     -- require("lspconfig").pyright.setup {
      --     --   root_dir = nvim_lsp.util.root_pattern(".venv"),
      --     --   -- cmd = { "bash", "-c", "source ./.venv/bin/activate"},
      --     --   settings = {
      --     --     python = {
      --     --       -- 仮想環境のルートパス
      --     --       venvPath = ".",
      --     --       -- 仮想環境のフォルダ名
      --     --       -- venv = ".venv",
      --     --       pythonPath = "./.venv/bin/python",
      --     --       -- analysis = {
      --     --       --   extraPaths = {"."},
      --     --       --   autoSearchPaths = true,
      --     --       --   useLibraryCodeForTypes = true
      --     --       -- }
      --     --     }
      --     --   }
      --     -- }
      --   end,
      -- }
      vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')           -- カーソル下の変数の情報
      vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')     -- 定義ジャンプ
      vim.keymap.set('n', 'gt', '<C-t>')                                     -- 定義ジャンプ後に下のファイルに戻る
      vim.keymap.set('n', '<leader>fm', '<cmd>lua vim.lsp.buf.format()<CR>') -- 改行やインデントなどのフォーマット
      vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')     -- カーソル下の変数をコード内で参照している箇所
      vim.keymap.set('n', 'gn', '<cmd>lua vim.lsp.buf.rename()<CR>')         -- 変数名のリネーム
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        -- null_ls.builtins.formatting.lua_ls
      })
    end
  },
  {
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup()
    end,
    opts = {
      -- options
      integration = {
        ["nvim-tree"] = {
          enable = true, -- Integrate with nvim-tree/nvim-tree.lua (if installed)
        },
      },
    }
  }

}
