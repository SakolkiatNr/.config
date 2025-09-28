return {
  "tpope/vim-fugitive",

  opts = {
    vim.keymap.set("n", "<leader>gl", ":G log<CR>", { desc = "Git log" }),
  },
}
