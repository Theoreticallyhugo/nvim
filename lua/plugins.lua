return {
    --- XXX: lsp
    -- FIXME: documentation opening in new buffer. is that bad?
    {
        "nvim-treesitter/nvim-treesitter",
        opts = require "configs.treesitter"
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = require "configs.todo-comments",
        -- https://github.com/folke/todo-comments.nvim
        lazy = false,
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
        "lewis6991/gitsigns.nvim",
        opts = function()
            return require "configs.gitsigns"
        end,
    },
    {
       "akinsho/git-conflict.nvim",
       version = "v1.3.0",
       config = function()
         require "configs.git-conflict"
       end,
       lazy = false,
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
    -- autopairing of (){}[] etc
    {
          "windwp/nvim-autopairs",
          opts = {
              fast_wrap = {},
              disable_filetype = { "TelescopePrompt", "vim" },
          },
          config = function(_, opts)
              require("nvim-autopairs").setup(opts)

              -- setup cmp for autopairs
              local cmp_autopairs = require "nvim-autopairs.completion.cmp"
              require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
          end,
      },
    -- help
    --
    {
        "folke/which-key.nvim",
        keys = { "<leader>", "<c-r>", "<c-w>", '"', "'", "`", "c", "v", "g" },
        cmd = "WhichKey",
        lazy = false,
        config = function()
              require("which-key").setup()
        end,
    },
    -- XXX: eyecandy
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        opts = function()
            require "configs.catppuccin"
        end,
    },
    {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require('colorizer').setup()
        end,
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require("configs.lualine")
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        -- event = "User FilePost",
        main = "ibl",
        opts = {
            indent = { char = "│", highlight = "IblChar" },
            scope = { char = "│", highlight = "IblScopeChar" },
        },
        config = function()
            require("configs.indent-blankline")
        end,
        lazy = false,
    },
    {
        "nvimdev/dashboard-nvim",
        lazy = false, -- As https://github.com/nvimdev/dashboard-nvim/pull/450, dashboard-nvim shouldn't be lazy-loaded to properly handle stdin.
        opts = require("configs.dashboard")
    },
    -- XXX: debugger
    {
          "jay-babu/mason-nvim-dap.nvim",
          event = "VeryLazy",
          dependencies = {
              "mfussenegger/nvim-dap",
          },
          opts = {
              handlers = {},
          },
    },
    {
          "rcarriga/nvim-dap-ui",
          event = "VeryLazy",
          dependencies = {
              "mfussenegger/nvim-dap",
              "nvim-neotest/nvim-nio",
          },
          config = require("configs.nvim-dap-ui").config,
    },
    {
          "mfussenegger/nvim-dap-python",
          ft = "python",
          dependencies = {
              "mfussenegger/nvim-dap",
              "rcarriga/nvim-dap-ui"
          },
          config = function()
              local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
              require("dap-python").setup(path)
          end,
    },
    -- XXX: UNDO
    {
        "jiaoshijie/undotree",
        dependencies = "nvim-lua/plenary.nvim",
        config = true,
    },
}
