return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      globalstatus = true,
    },
    sections = {
      lualine_x = { "fileformat", "filetype" },
      lualine_b = {},
      lualine_c = { "diagnostics" },
      lualine_y = { "filename" },
      lualine_z = {},
    },
    inactive_winbar = {
      lualine_c = { "filename" },
    },
  },
}
