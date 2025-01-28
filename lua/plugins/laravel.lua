return {
  "adalessa/laravel.nvim",
  dependencies = {
    "tpope/vim-dotenv",
    "nvim-telescope/telescope.nvim",
    "MunifTanjim/nui.nvim",
    "kevinhwang91/promise-async",
  },
  cmd = { "Laravel" },
  keys = {
    { "<leader><leader>la", ":Laravel artisan<cr>" },
    { "<leader><leader>lr", ":Laravel routes<cr>" },
    { "<leader><leader>lm", ":Laravel related<cr>" },
  },
  event = { "VeryLazy" },
  opts = {},
  config = true,
}
