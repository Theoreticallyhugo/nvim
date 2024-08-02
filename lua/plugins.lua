return {
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            require "configs.lspconfig"
        end,
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
        },
    },
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
    {
        "catppuccin/nvim", 
        name = "catppuccin", 
        priority = 1000,
        opts = function()
            require "configs.catppuccin"
        end,
    }
}
