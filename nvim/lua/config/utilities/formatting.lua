vim.api.nvim_create_user_command(
  "Format", 
  function()
  vim.lsp.buf.format({ 
      bufnr = vim.api.nvim_get_current_buf(), 
      timeout_ms = 1000 })
end, {
    desc = "Format current buffer"
  } 
)

