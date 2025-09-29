return {
  {
    "numToStr/Comment.nvim",
    opts = {
      -- add any options here
    },
    config = function(_, opts)
      require("Comment").setup(opts)
      vim.keymap.set("n", "<leader>/", require("Comment.api").toggle.linewise.current, { desc = "Toggle comment" })
    end,
  },
}
