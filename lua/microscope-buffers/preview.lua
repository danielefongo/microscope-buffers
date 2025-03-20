local treesitter = require("microscope.api.treesitter")

return function(data, window)
  local lines = vim.api.nvim_buf_get_lines(data.buffer, 0, -1, false)
  local row = vim.fn.getbufinfo(data.buffer)[1].lnum

  window:write(lines)
  local hls = treesitter.for_buffer(window.buf, vim.filetype.match({ filename = data.file, buf = window.buf }))
  window:clear_buf_hls()
  window:set_buf_hls(hls)
  window:set_cursor({ row, 0 })
end
