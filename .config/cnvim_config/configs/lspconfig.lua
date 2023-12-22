local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local configs = require("lspconfig.configs")
local utils = require("core.utils")

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "clangd", "ocamllsp" }

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

if not configs.cl_lsp then
	configs.cl_lsp = {
		default_config = {
			cmd = { "/home/oyaki/.roswell/bin/cl-lsp" },
			root_dir = lspconfig.util.root_pattern("*.ros"),
			filetypes = { "lisp", "ros" },
		},
	}
end

lspconfig.cl_lsp.setup({
	on_attach = function(client, bufnr)
		client.server_capabilities.documentFormattingProvider = true
		client.server_capabilities.documentRangeFormattingProvider = true

		utils.load_mappings("lspconfig", { buffer = bufnr })

		if client.server_capabilities.signatureHelpProvider then
			require("nvchad.signature").setup(client)
		end

		if not utils.load_config().ui.lsp_semantic_tokens and client.supports_method("textDocument/semanticTokens") then
			client.server_capabilities.semanticTokensProvider = nil
		end
	end,
	capabilities = capabilities,
})

local virtual_env_path = vim.trim(vim.fn.system("poetry config virtualenvs.path"))
local virtual_env_dirctory = string.gsub(vim.trim(vim.fn.system("poetry env list")), " %(Activated%)", "")

local python_path = "python"
-- 現在のディレクトリに対応するvirtualenvがあるかのチェック
if #vim.split(virtual_env_dirctory, "\n") == 1 then
	python_path = string.format("%s/%s/bin/python", virtual_env_path, virtual_env_dirctory)
end
lspconfig.pyright.setup({
	settings = {
		python = {
			pythonPath = python_path,
		},
	},
	on_attach = on_attach,
	capabilities = capabilities,
})

--
-- lspconfig.pyright.setup { blabla}
