return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      require("telescope").setup({
        pickers = {
          find_files = {
            theme = "ivy",
            -- theme = "cursor",
            -- theme = "dropdown",
          },
        },
        extensions = {
          fzf = {},
        },
      })

      require("telescope").load_extension("fzf")

      vim.keymap.set("n", "<leader>ff", ":Telescope<CR>", { desc = "Open Telescope" })
      vim.keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags, { desc = "Search help" })
      vim.keymap.set("n", "<leader>fd", require("telescope.builtin").find_files, { desc = "Search directories" })
      vim.keymap.set("n", "<leader>fb", require("telescope.builtin").buffers, { desc = "Search active buffers" })
      vim.keymap.set("n", "<leader>km", require("telescope.builtin").keymaps, { desc = "Search keymaps" })

      -- open ~/.config
      vim.keymap.set("n", "<space>en", function()
        require("telescope.builtin").find_files({
          cwd = vim.fn.stdpath("config"),
        })
      end)

      -- find
      vim.keymap.set("n", "<space>ep", function()
        require("telescope.builtin").find_files({
          cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy"),
        })
      end)

      -- close buffer

      require("config.telescope.multigrep").setup()
    end,
  },
}
