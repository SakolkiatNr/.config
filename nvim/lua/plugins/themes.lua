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

        colors = {
          bg = "#000000",
        },
      })
      vim.cmd(":hi statusline guibg=NONE")
    end,
  },

  {
    "rebelot/kanagawa.nvim",
  },

  {
    "thesimonho/kanagawa-paper.nvim",
    lazy = false,
    priority = 1000,
    -- opts = {},
  },
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_enable_italic = true
      vim.g.gruvbox_material_background = "hard"
      -- vim.cmd.colorscheme("gruvbox-material")
    end,
  },
  {
    "yazeed1s/oh-lucy.nvim",
  },
}
