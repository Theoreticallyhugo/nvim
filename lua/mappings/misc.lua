-- reference https://github.com/NvChad/NvChad/blob/v2.5/lua/nvchad/mappings.lua

-- add yours here
---Wrapps the given string in a table 
local function desc(s)
  return { desc = s }
end

local map = vim.keymap.set

-- cmd
map("n", ";", ":", desc "CMD: enter command mode" )

-- esc
map("i", "jk", "<ESC>", desc "ESC: superior escape")

-- quit
map("n", "QQ", ":qa <CR>", desc "QUIT: quit all if there are no unsaved changes")

-- save
map("n", "W!", ":w !sudo tee % <CR>", desc "SAVE: save file as sudo when write protected")
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <CR>", desc "SAVE: save file")

-- insertion
-- map("n", "<C-J>", "o<ESC>k", desc "INSERT: empty line below")
-- map("n", "<C-K>", "O<ESC>j", desc "INSERT: empty line above")


-- navigation
vim.opt.whichwrap:append("h,l")
map({"n", "v"}, "j", "gj", desc "NAVIGATION: go down one visual line")
map({"n", "v"}, "k", "gk", desc "NAVIGATION: go up one visual line")

map("n", "<C-h>", "<C-w>h", desc "")
map("n", "<C-l>", "<C-w>l", desc "")

map("n", "<leader>pv", vim.cmd.Ex , desc "Netrw: open netrw")

vim.keymap.set("c", "<C-A>","<Home>")
vim.keymap.set("c", "<C-F>","<Right>")
vim.keymap.set("c", "<C-B>","<Left>")
vim.keymap.set("c", "<Esc>b","<S-Left>")
vim.keymap.set("c", "<Esc>f","<S-Right>")

-- updating
map("n", "<leader>ua", ":Lazy sync <CR>", desc "UPDATE: update all plugins" )
map("n", "<leader>um", "<CMD>MasonToolsUpdate <CR> <CMD>Mason <CR>", desc "UPDATE: update all mason plugins" )

-- formatting    
-- overrides NvChad default
map({ "n", "v" }, "<leader>fm", function()
      require("conform").format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 2000,
      })
    end,  desc "FORMAT: Format file or range (in visual mode)"
)

--- LazyGit
map("n", "<leader>gg", "<cmd> LazyGit <CR>", desc "LAZYGIT: Open LazyGit")

--- nvim tree
-- use g? to show all default mappings, custom ones excluded
-- refer to https://github.com/nvim-tree/nvim-tree.lua/blob/master/doc/nvim-tree-lua.txt
-- point 2.2 QUICKSTART: HELP at line 149 for the commands
map(
  "n",
  "_",
  function ()
    require("nvim-tree.api").tree.change_root_to_node() -- replacing <C-]>
  end,
  desc "Nvim-tree: CD change directory"
)
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "Nvim-tree: toggle window" })
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "Nvim-tree: focus window" })
