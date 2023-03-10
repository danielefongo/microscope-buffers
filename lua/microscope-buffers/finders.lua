local preview = require("microscope-buffers.preview")
local open = require("microscope-buffers.open")
local buffers_lists = require("microscope-buffers.lists")
local lists = require("microscope.lists")

return {
  buffer = {
    open = open,
    preview = preview,
    chain = function(text)
      return { buffers_lists.listed(), lists.fzf(text) }
    end,
  },
}
