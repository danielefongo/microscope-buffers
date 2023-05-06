local preview = require("microscope-buffers.preview")
local open = require("microscope-buffers.open")
local buffers_lenses = require("microscope-buffers.lenses")
local lenses = require("microscope.builtin.lenses")
local buffers_parsers = require("microscope-buffers.parsers")
local parsers = require("microscope.builtin.parsers")

return {
  buffer = {
    lens = lenses.fzf(lenses.cache(buffers_lenses.listed())),
    parsers = { buffers_parsers.buffer, parsers.fuzzy },
    open = open,
    preview = preview,
  },
}
