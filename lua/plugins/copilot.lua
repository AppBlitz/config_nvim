return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup {
      panel = {
        enabled = true,
        auto_refresh = true,
      },
      suggestion = {
        enabled = true,
        auto_trigger = true,
        hide_during_completion = true,
        debounce = 75,
        keymap = {
          accept = "<M-l>",
          --[[ next = "<M-]>",
          prev = "<M-[>", ]]
        },
      },
    }
  end,
}
