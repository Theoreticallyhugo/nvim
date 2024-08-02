return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = require "configs.treesitter"
    },
    {
        "nvim-tree/nvim-tree.lua",
        opts = require "configs.nvimtree",
    },
    {
        'akinsho/bufferline.nvim', version = "*", 
        opts = function()
            require "configs.bufferline"
        end,
        dependencies = 'nvim-tree/nvim-web-devicons'
    },
    {
        "kdheepak/lazygit.nvim",
        cmd = { "LazyGit" },
    },
}
