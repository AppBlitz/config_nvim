-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  -- pack
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.java" },
  { import = "astrocommunity.pack.angular" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.kotlin" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.python" },
  -- import/override with your plugins folder
  { import = "astrocommunity.file-explorer.telescope-file-browser-nvim" },

  -- editing-support
  { import = "astrocommunity.editing-support.todo-comments-nvim" },

  {
    -- workflow
    import = "astrocommunity.workflow.hardtime-nvim",
  },
  -- media
  { import = "astrocommunity.media.vim-wakatime" },
  -- utility
  { import = "astrocommunity.utility.noice-nvim" },

  {
    "noice.nvim",
    opts = {
      routes = {
        {
          filter = {
            event = "msg_show",
            any = {
              { find = "%d+L, %d+B" },
              { find = "; after #%d+" },
              { find = "; before #%d+" },
              { find = "%d fewer lines" },
              { find = "%d more lines" },
            },
          },
          view = "mini",
        },
        {
          filter = {
            event = "msg_show",
            min_height = 20,
          },
          view = "messages",
        },
      },
    },
  },
  -- git
  { import = "astrocommunity.git.neogit" },
  -- scrolling
  { import = "astrocommunity.scrolling.neoscroll-nvim" },
  -- motion
  { import = "astrocommunity.motion.nvim-surround" },
  -- note-talking
  { import = "astrocommunity.note-taking.global-note-nvim" },
  { import = "astrocommunity.note-taking.neorg" },
}
