return function(data, request)
  vim.api.nvim_win_set_buf(request.win, data.buffer)
end
