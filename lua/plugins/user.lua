-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:
local builtin = require "telescope.builtin"
---@type LazySpec
return {

  -- == Examples of Adding Plugins ==

  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  -- == Examples of Overriding Plugins ==

  -- customize alpha options
  {
    "goolord/alpha-nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "nvim-lua/plenary.nvim",
    },
    opts = function(_, opts)
      -- customize the opts header
      --[[ opts.section.header.val = {
        "   ******                    **                 ",
        "  **////**                  /**                 ",
        " **    //   ******   ****** /**  ******   ******",
        "/**        //////** //**//* /** **////** **//// ",
        "/**         *******  /** /  /**/**   /**//***** ",
        "//**    ** **////**  /**    /**/**   /** /////**",
        " //****** //********/***    ***//******  ****** ",
        "  //////   //////// ///    ///  //////  //////  ",
      }
      opts.section.buttons.val = {
        opts.button("e", "New file", ":enew<CR>"),
      } ]]
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
      opts.section.header.val = vim.split(logo, "\n")
      opts.section.buttons.val = {
        { type = "text", val = "Telescope", opts = { hl = "SpecialComment", position = "center" } },
        opts.button("f", " File Browser", builtin.find_files),
        opts.button("r", "  Recent", builtin.oldfiles),
        opts.button("e", "  New file", "<cmd>ene<CR>"),
        opts.button("u", "󱐥  Update plugins", "<cmd>Lazy sync<CR>"),
        opts.button("t", "  Install language tools", "<cmd>Mason<CR>"),

        { type = "text", val = "Neovim", opts = { hl = "SpecialComment", position = "center" } },
        opts.button("q", "☠  Quit NVIM", ":quitall<cr>"),

        { type = "text", val = "Files", opts = { hl = "SpecialComment", position = "center" } },
        opts.button("o", " Oil", "<CMD>Oil<CR>"),
      }
      local message = [[
Glück
]]
      opts.section.footer.val = vim.split(message, "\n")
      return opts
    end,
  },

  -- You can disable default plugins as follows:
  { "max397574/better-escape.nvim", enabled = false },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },
}
