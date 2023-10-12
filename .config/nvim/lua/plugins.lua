return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")
	use("ggandor/lightspeed.nvim")
	use("tpope/vim-repeat")
	use("terryma/vim-expand-region")
	use("gbprod/yanky.nvim")
	-- use "fuenor/im_control.vim"

	--    if vim.g.vscode then
	--    else
	--        use {'neoclide/coc.nvim', branch = 'release'}
	--    end
end)
