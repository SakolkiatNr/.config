local state = {
  floating = {
    buf = -1,
    win = -1,
  },
}

local function create_floating_win(opts)
  opts = opts or {}

  local width = math.floor(opts.width or vim.o.columns * 0.99)
  local height = math.floor(opts.height or vim.o.lines * 0.5)

  -- Float center
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  -- Create a new buffer
  local buf
  if opts.buf and type(opts.buf) == "number" and vim.api.nvim_buf_is_valid(opts.buf) then
    buf = opts.buf
  else
    buf = vim.api.nvim_create_buf(false, true)
  end

  -- Define window configuration
  local win_config = {
    relative = "editor",
    width = width,
    height = height,

    -- TERMINAL POSITION
    -- Center
    -- row = row,
    -- col = co

    -- Top right
    -- row = 0,
    -- col = vim.o.columns - width,

    -- Top left
    -- row = 0,
    -- col = 0,

    -- Bottom right
    row = vim.o.lines - height - 2, -- bottom
    col = vim.o.columns - width,    -- right

    -- Bottom left
    -- row = vim.o.lines - height - 2,
    -- col = 0,

    style = "minimal",
    border = "rounded",
  }

  local win = vim.api.nvim_open_win(buf, true, win_config)

  return { buf = buf, win = win }
end

local toggle_terminal = function()
  if not vim.api.nvim_win_is_valid(state.floating.win) then
    state.floating = create_floating_win(state.floating)
    vim.cmd.startinsert()

    -- if buffer is not already a terminal, start one
    if vim.bo[state.floating.buf].buftype ~= "terminal" then
      vim.cmd.term()
      vim.cmd.startinsert()
    end
  else
    vim.api.nvim_win_hide(state.floating.win)
  end
end

vim.api.nvim_create_user_command("Floaterminal", toggle_terminal, {})
vim.keymap.set({ "n", "t" }, "<space>j", toggle_terminal, { desc = "Toggle terminal" })
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")
