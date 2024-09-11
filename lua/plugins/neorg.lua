return {
  "nvim-neorg/neorg",
  dependencies = { "luarocks.nvim" },
  version = "*",
  config = function()
    require("neorg").setup {
      load = {
        ["core.defaults"] = {},
        ["core.ui.calendar"] = {},
        ["core.export"] = {},
        ["core.summary"] = {},
        ["core.keybinds"] = {
          config = {
            default_keybinds = true,
            neorg_leader = ",",
          },
        }, -- Adds default keybindings
        ["core.export.markdown"] = {},
        ["core.esupports.metagen"] = {
          config = {
            update_date = true,
            timezone = "local",
            type = "auto",
          },
        },
        ["core.completion"] = {
          config = {
            engine = "nvim-cmp",
          },
        }, -- Enables support for completion plugins
        ["core.concealer"] = {
          config = {
            icon_preset = "diamond",
          },
        },
        ["core.dirman"] = {
          config = {
            workspaces = {
              programming = "~/projects/programming",
              Series = "~/projects/Series",
              notes = "~/projects/notes",
              books = "~/projects/books/",
              University = "~/projects/University",
              neovim = "~/projects/neovim",
              anime = "~/projects/anime",
              films = "~/projects/films",
            },

            default_workspace = "notes",
          },
        },
      },
    }
    vim.wo.foldlevel = 99
    vim.wo.conceallevel = 2
  end,
}
