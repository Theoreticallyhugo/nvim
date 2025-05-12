---Wrapps the given string in a table
local function desc(s)
  return { desc = s }
end

local map = vim.keymap.set

--- bufferline
map("n", "<tab>", "<cmd>BufferLineCycleNext<CR>", desc("Buffer: cycle next buffer"))
map("n", "<S-tab>", "<cmd>BufferLineCyclePrev<CR>", desc("Buffer: cycle prev buffer"))
map("n", "<leader>x", "<cmd>:bd<CR>", desc("Buffer: close current buffer"))
