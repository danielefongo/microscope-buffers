local preview = require("microscope-buffers.preview")
local open = require("microscope-buffers.open")
local buffers_steps = require("microscope-buffers.steps")
local steps = require("microscope.steps")

return {
  buffer = {
    open = open,
    preview = preview,
    chain = function(text)
      return { buffers_steps.listed(), steps.fzf(text) }
    end,
  },
}
