require('mason').setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    },
})

require('mason-lspconfig').setup()

-- Set different settings for different languages' LSP
-- LSP list: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
-- How to use setup({}): https://github.com/neovim/nvim-lspconfig/wiki/Understanding-setup-%7B%7D
--     - the settings table is sent to the LSP
--     - on_attach: a lua callback function to run after LSP attaches to a given buffer

-- Customized on_attach function


vim.lsp.enable({
  "pyright",
  "lua_ls",
  "html",
  "clangd",
  "texlab",
  "dockerls",
  "jsonls",
  "yamlls",
  "ltex_plus",
  "bashls",
  "ruff",
})

-- How to add LSP for a specific language?

-- -- bash-language-server
-- lspconfig.bashls.setup {
--   on_attach = on_attach,
--   -- on_init = on_init,
--   -- capabilities = capabilities,
--   filetypes = { "sh", "bash", "zsh" },
-- }
--
-- -- ruff uses an LSP proxy, therefore it needs to be enabled as if it
-- -- were a LSP. In practice, ruff only provides linter-like diagnostics
-- -- and some code actions, and is not a full LSP yet.
-- lspconfig.ruff.setup({
--   -- disable ruff as hover provider to avoid conflicts with pyright
--   on_attach = function(client) client.server_capabilities.hoverProvider = false end,
-- })
--
-- -- FIXME:
-- -- grammarly but foss is ltex
-- lspconfig.ltex.setup {
--   on_attach = on_attach,
--   -- on_init = on_init,
--   -- capabilities = capabilities,
--   -- filetypes = { "tex", "plaintex", "txt", "markdown" },
--   settings = {
--     ltex = {
--   	  language = "auto",
--   	  -- language = "en-GB",
--   	  -- language = "de-DE",
--   	},
--   },
-- }
