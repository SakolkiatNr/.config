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

          builtin = {
            layout_strategy = "horizontal",
            sorting_strategy = "ascending",
            borderchars = { "", "", "", "", "", "", "", "" },
            path_displays = "smart",

            layout_config = {
              prompt_position = "top",
              height = 100,
              width = 500,
              preview_width = 0.6,
            },
          },

          find_files = {
            layout_strategy = "horizontal",
            sorting_strategy = "ascending",
            borderchars = { "", "", "", "", "", "", "", "" },
            path_displays = "smart",

            layout_config = {
              prompt_position = "top",
              height = 100,
              width = 500,
              preview_width = 0.6,
            },
          },

          buffers = {
            layout_strategy = "horizontal",
            sorting_strategy = "ascending",
            borderchars = { "", "", "", "", "", "", "", "" },

            layout_config = {
              prompt_position = "top",
              height = 100,
              width = 500,
              preview_width = 0.65,
            },
          },

          help_tags = {
            layout_strategy = "horizontal",
            borderchars = { "", "", "", "", "", "", "", "" },
            layout_config = {
              prompt_position = "bottom",
              height = 100,
              width = 500,
              preview_width = 0.65,
            },
          },
        },

        extensions = {
          fzf = {},
        },
      })

      require("telescope").load_extension("fzf")

      -- open ~/.config
      vim.keymap.set("n", "<space>en", function()
        require("telescope.builtin").find_files({
          cwd = vim.fn.stdpath("config"),
          prompt_title = "Neovim Configuration",
        })
      end, { desc = "Open Neovim configuration" })

      -- find
      vim.keymap.set("n", "<space>ep", function()
        require("telescope.builtin").find_files({
          cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy"),
          prompt_title = "Lazy Plugins",
        })
      end, { desc = "Search Lazy" })

      -- close buffer

      require("config.telescope.multigrep").setup()
    end,
  },
}
