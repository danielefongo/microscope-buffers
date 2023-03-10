return function(data, win, _)
  vim.api.nvim_win_set_buf(win, data.buffer)
end
