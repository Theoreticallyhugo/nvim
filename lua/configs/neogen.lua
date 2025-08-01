require("neogen").setup({
  enabled = true,
  languages = {
    python = {
      template = {
        annotation_convention = "reST", -- for a full list of annotation_conventions, see supported-languages below,
      },
    },
  },
})
