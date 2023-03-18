local highlight = require("microscope.highlight")
local constants = require("microscope.constants")
local steps = {}

function steps.listed()
  return {
    fun = function(on_data)
      local bufs = {}
      local buf_ids = vim.api.nvim_list_bufs()
      for _, id in ipairs(buf_ids) do
        if vim.fn.buflisted(id) == 1 then
          table.insert(bufs, id .. ": " .. vim.api.nvim_buf_get_name(id))
        end
      end
      on_data(bufs)
    end,
    parser = function(data)
      local elements = vim.split(data.text, ":", {})

      local highlights =
        highlight.new(data.highlights, data.text):hl_match(constants.color.color1, "(%d+:)(.*)", 1):get_highlights()

      return {
        text = data.text,
        highlights = highlights,
        buffer = tonumber(elements[1]) + 0,
      }
    end,
  }
end

return steps
