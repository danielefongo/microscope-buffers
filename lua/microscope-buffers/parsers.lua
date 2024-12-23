local highlight = require("microscope.api.highlight")
local parsers = {}

local function relative_path(path)
  local current_path = vim.fn.getcwd():gsub("[%-%.%+%[%]%(%)%$%^%%%?%*]", "%%%1") .. "/"
  return string.gsub(path, current_path, "")
end

function parsers.buffer(data)
  local elements = vim.split(data.text, ": ", {})
  local limited_path = relative_path(data.text)
  print(vim.inspect({ full = data.text, relative = limited_path }))

  return {
    text = limited_path,
    highlights = highlight
      .new(data.highlights, limited_path)
      :hl_match(highlight.color.color1, "(%d+:)(.*)", 1)
      :get_highlights(),
    buffer = tonumber(elements[1]) + 0,
    file = elements[2],
  }
end

return parsers
