return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-git",
    "windwp/nvim-autopairs",
    {
      "zbirenbaum/copilot-cmp",
      dependencies = {
        "zbirenbaum/copilot.lua",
        cmd = { "Copilot" },
        event = { "VeryLazy" },
        opts = {
          suggestion = { enabled = false },
          panel = { enabled = false },
        },
      },
      config = true,
    },
  },
  event = "VeryLazy",
  config = function(_, opts) require("luffy.completetion").setup(opts) end,
}
