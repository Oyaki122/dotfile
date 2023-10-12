return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use 'ggandor/lightspeed.nvim'
    use 'tpope/vim-repeat'
    use 'terryma/vim-expand-region' 
    use "gbprod/yanky.nvim"
    use "fuenor/im_control.vim"
    use 'vim-denops/denops.vim'
    use 'vim-skk/denops-skkeleton.vim'
    use 'Shougo/ddc.vim'    
    use 'Shougo/ddc-ui-native'
    use 'Shougo/ddc-source-around'
    use 'Shougo/ddc-matcher_head'
    use 'Shougo/ddc-sorter_rank'
    use 'jacoborus/tender.vim'
--    if vim.g.vscode then
--    else
--        use {'neoclide/coc.nvim', branch = 'release'}
--    end

end)
