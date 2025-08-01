-- Hint: use `:h <option>` to figure out the meaning if needed
vim.opt.clipboard = "unnamedplus" -- use system clipboard
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.mouse = "a" -- allow the mouse to be used in Nvim

-- Tab
vim.opt.tabstop = 4 -- number of visual spaces per TAB
vim.opt.softtabstop = 4 -- number of spacesin tab when editing
vim.opt.shiftwidth = 4 -- insert 4 spaces on a tab
vim.opt.expandtab = true -- tabs are spaces, mainly because of python

-- UI config
vim.opt.number = true -- show absolute number
vim.opt.relativenumber = true -- add numbers to each line on the left side
vim.opt.cursorline = true -- highlight cursor line underneath the cursor horizontally
vim.opt.splitbelow = true -- open new vertical split bottom
vim.opt.splitright = true -- open new horizontal splits right
-- vim.opt.termguicolors = true        -- enabl 24-bit RGB color in the TUI
vim.opt.showmode = true -- we are experienced, still we need the "-- INSERT --" mode hint

-- Searching
vim.opt.incsearch = true -- search as characters are entered
vim.opt.hlsearch = true -- not highlight matches
vim.opt.ignorecase = true -- ignore case in searches by default
vim.opt.smartcase = true -- but make it case sensitive if an uppercase is entered

-- undo
-- Create the undo directory if it doesn't exist
local undodir = vim.fn.expand("~/.config/nvim/undodir")
if not vim.loop.fs_stat(undodir) then
  vim.fn.mkdir(undodir, "p")
end

-- Set the undo options
vim.opt.undofile = true
vim.opt.undodir = undodir
vim.opt.undolevels = 1000

vim.opt.foldlevelstart = 99

--------------------------------------------------------------------------------
-- SETUP BASIC PYTHON-RELATED OPTIONS

-- The filetype-autocmd runs a function when opening a file with the filetype
-- "python". This method allows you to make filetype-specific configurations. In
-- there, you have to use `opt_local` instead of `opt` to limit the changes to
-- just that buffer. (As an alternative to using an autocmd, you can also put those
-- configurations into a file `/after/ftplugin/{filetype}.lua` in your
-- nvim-directory.)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python", -- filetype for which to run the autocmd
  callback = function()
    -- use pep8 standards
    vim.opt_local.expandtab = true
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4

    -- folds based on indentation https://neovim.io/doc/user/fold.html#fold-indent
    -- if you are a heavy user of folds, consider using `nvim-ufo`
    vim.opt_local.foldmethod = "indent"

    local iabbrev = function(lhs, rhs)
      vim.keymap.set("ia", lhs, rhs, { buffer = true })
    end
    -- automatically capitalize boolean values. Useful if you come from a
    -- different language, and lowercase them out of habit.
    -- iabbrev("true", "True")
    -- iabbrev("false", "False")

    -- we can also fix other habits we might have from other languages
    -- iabbrev("--", "#")
    -- iabbrev("null", "None")
    -- iabbrev("none", "None")
    -- iabbrev("nil", "None")
    -- iabbrev("function", "def")
  end,
})
