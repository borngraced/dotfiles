return {
    {
        "savq/melange-nvim",
        as = "biscuit",
        config = function()
            vim.opt.termguicolors = true
            vim.cmd('colorscheme melange')
        end
    } }
