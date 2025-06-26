local options = {
  defaults = {
    prompt_prefix = "   ",
    selection_caret = " ",
    entry_prefix = " ",
    sorting_strategy = "ascending",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
      },
      width = 0.87,
      height = 0.80,
    },
    mappings = {
      n = { ["q"] = require("telescope.actions").close },
    },
    vimgrep_arguments = {
      "grep",
      "--extended-regexp",
      "--color=never",
      "--with-filename",
      "--line-number",
      "-b", -- grep doesn't support a `--column` option :(
      "--ignore-case",
      "--recursive",
      "--no-messages",
      "--exclude-dir=*cache*",
      "--exclude-dir=*.git",
      "--exclude=.*",
      "--binary-files=without-match"
   },
    file_ignore_patterns = {
     "node_modules", "build", "dist", "yarn.lock", "env",
   },

  },

  extensions_list = {},
  extensions = {},

  pickers = {
  find_files = {
    hidden = true,
    },
  },
}

return options
