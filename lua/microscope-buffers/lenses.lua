local lenses = {}

function lenses.listed()
  return {
    fun = function(flow)
      flow.consume(flow.cmd.fn(function()
        local bufs = {}
        local buf_ids = vim.api.nvim_list_bufs()

        for _, id in ipairs(buf_ids) do
          if vim.fn.buflisted(id) == 1 then
            table.insert(bufs, id .. ": " .. vim.api.nvim_buf_get_name(id))
          end
        end

        return bufs
      end))
    end,
  }
end

return lenses
