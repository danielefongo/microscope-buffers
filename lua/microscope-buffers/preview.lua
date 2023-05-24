local highlight = require("microscope.utils.highlight")

return function(data, window)
  local lines = vim.api.nvim_buf_get_lines(data.buffer, 0, -1, false)
  local row = vim.fn.getbufinfo(data.buffer)[1].lnum

  window:write(lines)
  highlight(data.file, window.buf)
  window:set_cursor({ row, 0 })
end
