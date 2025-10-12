return {
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
}
