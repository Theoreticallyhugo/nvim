return {
  --- XXX: lsp
  -- FIXME: documentation opening in new buffer. is that bad?
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      require("configs.lsp")
    end,
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    main = "nvim-treesitter.configs",
    opts = require("configs.treesitter"),
  },
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = function()
      require("configs.mason_installer")
    end,
  },
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("configs.conform")
    end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = require("configs.todo-comments"),
    -- https://github.com/folke/todo-comments.nvim
    lazy = false,
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^5", -- Recommended
    lazy = false, -- This plugin is already lazy
  },
  --- XXX: navigation
  {
    "nvim-tree/nvim-tree.lua",
    opts = require("configs.nvimtree"),
  },
  {
    "akinsho/bufferline.nvim",
    version = "*",
    opts = function()
      require("configs.bufferline")
    end,
    dependencies = "nvim-tree/nvim-web-devicons",
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    cmd = "Telescope",
    opts = function()
      return require("configs.telescope")
    end,
    config = function(_, opts)
      local telescope = require("telescope")
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
      return require("configs.gitsigns")
    end,
  },
  {
    "akinsho/git-conflict.nvim",
    version = "v1.3.0",
    config = function()
      require("configs.git-conflict")
    end,
    lazy = false,
  },
  --- XXX: autocompletion
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
  {
    -- autopairing of (){}[] etc
    "windwp/nvim-autopairs",
    opts = {
      fast_wrap = {},
      disable_filetype = { "TelescopePrompt", "vim" },
    },
    config = function(_, opts)
      require("nvim-autopairs").setup(opts)

      -- setup cmp for autopairs
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },
  {
    -- Docstring creation
    -- * quickly create docstrings via `<leader>a`
    "danymat/neogen",
    opts = true,
    keys = {
      {
        "<leader>a",
        function()
          require("neogen").generate()
        end,
        desc = "Add Docstring",
      },
    },
    config = function()
      require("configs.neogen")
    end,
  },
  {
    -- f-strings
    -- * auto-convert strings to f-strings when typing `{}` in a string
    -- * also auto-converts f-strings back to regular strings when removing `{}`
    "chrisgrieser/nvim-puppeteer",
    dependencies = "nvim-treesitter/nvim-treesitter",
  },
  --- XXX: help
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
  --- XXX: eyecandy
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = function()
      require("configs.catppuccin")
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
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
    opts = require("configs.dashboard"),
  },
  --- XXX: debugger
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
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
    end,
  },
  --- XXX: UNDO
  {
    "jiaoshijie/undotree",
    dependencies = "nvim-lua/plenary.nvim",
    config = true,
  },
}
