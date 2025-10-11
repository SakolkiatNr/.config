local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local make_entry = require("telescope.make_entry")
local conf = require("telescope.config").values
local themes = require("telescope.themes")

local M = {}

local live_multigrep = function(opts)
  opts = opts or {}
  opts.cwd = opts.cwd or vim.uv.cwd()

  opts = themes.get_dropdown({
    cwd = opts.cwd,
    prompt_title = "Multi Grep",
    results_title = "Search Results",
    previewer = true,
    preview_cutoff = 1,
    layout_strategy = "horizontal",
    sorting_strategy = "ascending",
    borderchars = { "", "", "", "", "", "", "", "" },
    layout_config = {
      prompt_position = "top",
      height = 100,
      width = 400,
      preview_width = 0.65,
    },
  })

  local finder = finders.new_async_job({
    command_generator = function(prompt)
      if not prompt or prompt == "" then
        return nil
      end

      local pieces = vim.split(prompt, "  ")
      local args = { "rg" }
      if pieces[1] then
        table.insert(args, "-e")
        table.insert(args, pieces[1])
      end

      if pieces[2] then
        table.insert(args, "-g")
        table.insert(args, pieces[2])
      end

      return vim.tbl_flatten({
        args,
        { "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case" },
      })
    end,
    entry_maker = make_entry.gen_from_vimgrep(opts),
    cwd = opts.cwd,
  })

  pickers
      .new(opts, {
        debounce = 100,
        prompt_title = opts.prompt_title,
        finder = finder,
        previewer = conf.grep_previewer(opts),
        sorter = require("telescope.sorters").empty(),
      })
      :find()
end

M.setup = function()
  vim.keymap.set("n", "<leader>fg", live_multigrep)
end

return M
