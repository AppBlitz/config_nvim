-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
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
  -- { import = "astrocommunity.workflow.hardtime-nvim" },
  { import = "astrocommunity.utility.noice-nvim" },
  { import = "astrocommunity.editing-support.todo-comments-nvim" },
  { import = "astrocommunity.completion.copilot-lua-cmp" },
}
