return {
    --- XXX: lsp
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
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        opts = function()
            require "configs.mason_installer"
        end,
    },
    --- XXX: navigation
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
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        cmd = "Telescope",
        opts = function()
            return require "configs.telescope"
        end,
        config = function(_, opts)
            local telescope = require "telescope"
            telescope.setup(opts)

            -- load extensions
            for _, ext in ipairs(opts.extensions_list) do
               telescope.load_extension(ext)
            end
        end,
    },
    --- XXX: git
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
    },

    -- XXX: autocompletion
	{
	    -- Vscode-like pictograms
		"onsails/lspkind.nvim",
		event = { "VimEnter" },
	},
	{
	    -- Auto-completion engine
		"hrsh7th/nvim-cmp",
		dependencies = {
			"lspkind.nvim",
			"hrsh7th/cmp-nvim-lsp", -- lsp auto-completion
			"hrsh7th/cmp-buffer", -- buffer auto-completion
			"hrsh7th/cmp-path", -- path auto-completion
			"hrsh7th/cmp-cmdline", -- cmdline auto-completion
		},
		config = function()
			require("configs.cmp")
		end,
	},
	{
	    -- Code snippet engine
		"L3MON4D3/LuaSnip",
		version = "v2.*",
	},
    -- help
    --
    {
        "folke/which-key.nvim",
        keys = { "<leader>", "<c-r>", "<c-w>", '"', "'", "`", "c", "v", "g" },
        cmd = "WhichKey",
        config = function()
              require("which-key").setup()
        end,
    },
}
