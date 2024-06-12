return {
  "nvim-neorg/neorg",

  version = "^8",
  dependencies = {
    {
      "vhyrro/luarocks.nvim",
      priority = 1000, -- We'd like this plugin to load first out of the rest
      config = true,
    },
  },
  event = "VeryLazy",
  opts = {
    load = {
      ["core.defaults"] = {
        config = {
          disable = {
            -- module list goes here
            "core.autocommands",
            "core.keybinds",
            "core.itero",
            "core.ui.calendar",
            "core.export",
          },
        },
      }, -- Loads default behaviour
      ["core.concealer"] = {}, -- Adds pretty icons to your documents
      -- ["core.exports"] = {},
      ["core.dirman"] = {
        config = {
          workspaces = {
            notes = "~/neorg",
          },
          default_workspace = "notes",
        },
      },
    },
  },
}
