local categories = { "CODING", "PROGRAMMING", "STOP" }

local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local themes = require("telescope.themes")
local action_state = require("telescope.actions.state")

local function select_category()
  pickers
    .new(
      themes.get_dropdown({
        layout_config = {
          width = 0.35,
          height = 0.4,
          prompt_position = "bottom",
        },
      }),
      {
        prompt_title = "Session",
        finder = finders.new_table({
          results = categories,
        }),
        sorter = conf.generic_sorter({}),
        attach_mappings = function(prompt_bufnr)
          actions.select_default:replace(function()
            local selection = action_state.get_selected_entry()
            actions.close(prompt_bufnr)

            if selection[1] == "STOP" then
              -- Stop Timewarrior and clear tmux status
              vim.fn.system("timew stop")
              vim.fn.system("tmux set-option -g status-right '%H:%M'")
            else
              -- Start Timewarrior with category
              vim.fn.system("timew start " .. selection[1])

              -- Update tmux every 10 mins
              vim.fn.system("tmux set-option -g status-interval 600")

              -- Show category + elapsed time
              local cmd = string.format(
                [[tmux set-option -g status-right '%s #(timew | grep -o "[0-9]\+:[0-9]\+")']],
                selection[1]
              )

              -- vim.fn.system("tmux set-option -g status-right '" .. selection[1] .. "'")
              vim.fn.system(cmd)
            end
          end)
          return true
        end,
      }
    )
    :find()
end

-- vim.keymap.set("n", "<leader>t", select_category, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>t", select_category, { desc = "Time tracking" })
