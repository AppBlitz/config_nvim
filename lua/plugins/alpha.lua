return {
  {
    "goolord/alpha-nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "nvim-lua/plenary.nvim",
    },
    main = "luffy.alpha.alpha",
    config = true,
    --[[ config = function ()
        require'alpha'.setup(require'alpha.themes.theta'.config)
    end ]]
  },
}
