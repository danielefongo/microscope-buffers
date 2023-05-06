local highlight = require("microscope.api.highlight")
local parsers = {}

function parsers.buffer(data)
  local elements = vim.split(data.text, ": ", {})

  data.buffer = tonumber(elements[1]) + 0
  data.highlights =
    highlight.new(data.highlights, data.text):hl_match(highlight.color.color1, "(%d+:)(.*)", 1):get_highlights()

  return data
end

return parsers
