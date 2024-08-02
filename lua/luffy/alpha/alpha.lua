---@diagnostic disable: missing-fields
local alpha = require "alpha"
local dashboard = require "alpha.themes.dashboard"
local builtin = require "telescope.builtin"
local M = {}

function M.setup()
  local logo = [[
     .-.
       __/   (
     , '-.____\
      u=='/  \
         /_/  \
       .-''   |
      (  ____/_____
      _>_/.--------
      \///
       //
      //
  ]]
  -- Set header
  dashboard.section.header.val = vim.split(logo, "\n")

  -- Set menu
  dashboard.section.buttons.val = {
    { type = "text", val = "Telescope", opts = { hl = "SpecialComment", position = "center" } },
    dashboard.button("f", " File Browser", builtin.find_files),
    dashboard.button("r", "  Recent", builtin.oldfiles),
    dashboard.button("e", "  New file", "<cmd>ene<CR>"),
    dashboard.button("u", "󱐥  Update plugins", "<cmd>Lazy sync<CR>"),
    dashboard.button("t", "  Install language tools", "<cmd>Mason<CR>"),

    { type = "text", val = "Neovim", opts = { hl = "SpecialComment", position = "center" } },
    dashboard.button("q", "☠  Quit NVIM", ":quitall<cr>"),

    { type = "text", val = "Files", opts = { hl = "SpecialComment", position = "center" } },
    dashboard.button("o", " Oil", "<CMD>Oil<CR>"),
  }
  local message = [[
Glück
]]
  -- Additional section (example: a quote or a tip)
  dashboard.section.footer.val = vim.split(message, "\n")

  -- Send config to alpha
  alpha.setup(dashboard.opts)

  -- Disable folding on alpha buffer
  vim.cmd [[
    autocmd FileType alpha setlocal nofoldenable
  ]]
end

return M
