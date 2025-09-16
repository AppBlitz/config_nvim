return {
  "jameswolensky/marker-groups.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim", -- Required
    "nvim-telescope/telescope.nvim", -- Optional: for fuzzy search
  },
  config = function()
    require("marker-groups").setup {
      -- Your configuration here
    }
  end,
}
