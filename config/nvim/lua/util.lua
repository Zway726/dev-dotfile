local M = {}

unpack = unpack or table.unpack

-- this function would not produce any crash or error if module not exists
function M.require(module_name)
  -- Temporarily redirect error output to suppress require error messages
  local original_error = io.stderr
  io.stderr = io.open("/dev/null", "w")

  local success, result = pcall(require, module_name)

  -- Restore original error output
  io.stderr:close()
  io.stderr = original_error

  if success then
    return true, result
  else
    return false, nil
  end
end

function M.merge_table(table1, table2)
  for key, value in pairs(table2) do
    table1[key] = value
  end
  return table1
end

return M
