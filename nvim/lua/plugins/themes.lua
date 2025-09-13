return {
  {
    "vague2k/vague.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("vague").setup({
        -- optional configurations
        style = {
          comments = "none",
          strings = "none",
        },
      })
    end
  },

  "rebelot/kanagawa.nvim",

}
