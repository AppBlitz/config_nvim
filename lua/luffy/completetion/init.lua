---@diagnostic disable: missing-fields
local cmp = require "cmp"
local lspkind = require "lspkind"
local luasnip = require "luasnip"
local cmp_autopairs = require "nvim-autopairs.completion.cmp"
local compare = require "cmp.config.compare"
local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end
local M = {}

M.setup = function(opts)
  cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })

  -- Run cmp setup with options
  cmp.setup(opts)
  cmp.setup {
    mapping = {
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-e>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.close()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<C-j>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.choice_active() then
          luasnip.change_choice(1)
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<C-k>"] = cmp.mapping(function()
        if cmp.visible() then
          cmp.select_prev_item()
        elseif vim.fn["vsnip#jumpable"](-1) == 1 then
          feedkey("<Plug>(vsnip-jump-prev)", "")
        end
      end, { "i", "s" }),
      ["<C-y>"] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      },
      ["<c-space>"] = cmp.mapping.complete(),
    },
    sources = {
      { name = "nvim_lua" },
      { name = "nvim_lsp" },
      { name = "path" },
      { name = "luasnip" },
      { name = "copilot" },
      {
        name = "buffer",
        keyword_length = 4,
        option = {
          get_bufnrs = function()
            local bufs = {}
            for _, win in ipairs(vim.api.nvim_list_wins()) do
              bufs[vim.api.nvim_win_get_buf(win)] = true
            end
            return vim.tbl_keys(bufs)
          end,
        },
      },
    },

    snippet = {
      expand = function(args) require("luasnip").lsp_expand(args.body) end,
    },

    formatting = {
      format = lspkind.cmp_format {
        with_text = true,
        menu = {
          buffer = "[buf]",
          nvim_lsp = "[ ]",
          nvim_lua = "[api]",
          path = "[path]",
          luasnip = "[snip]",
          copilot = "",
          ["vim-dadbod-completion"] = "[DB]",
        },
      },
    },

    sorting = {
      priority_weight = 2,
      comparators = {
        compare.kind,
        compare.sort_text,
      },
    },

    experimental = {
      native_menu = false,

      ghost_text = false,
    },
  }

  vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })

  -- Set configuration for specific filetype.
  cmp.setup.filetype("gitcommit", {
    sources = cmp.config.sources({
      { name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = "buffer" },
    }),
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline("/", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = "buffer" },
    },
    view = {
      entries = { name = "wildmenu", separator = "|", selection_order = "near_cursor" },
    },
  })
  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = "path" },
    }, {
      {
        name = "cmdline",
        option = {
          ignore_cmds = { "Man", "!" },
        },
      },
    }),
  })
  cmp.setup.filetype({ "sql", "mysql", "plsql" }, {
    sources = cmp.config.sources({
      { name = "vim-dadbod-completion" },
    }, {
      { name = "buffer" },
    }),
  })
end
return M
