local util = require('util')
local function telescope_cmd(cmd)
  local theme = require 'telescope.themes'.get_ivy()
  theme['layout_config']['height'] = math.floor(vim.o.lines * 0.4)
  local builtin = require 'telescope.builtin'
  local cmd_2_title = {
    live_grep = 'Live Grep',
    find_files = 'Find Files'
  }
  local cmd_2_func = {
    live_grep = builtin.live_grep,
    find_files = builtin.find_files
  }
  theme['cache_picker'] = {
    num_pickers = 4,
    limit_entries = 1000
  }
  local cached_picker = require('telescope.state').get_global_key 'cached_pickers' or {}
  local result_index = -1
  for index, value in ipairs(cached_picker) do
    if value ~= nil and value.prompt_title == cmd_2_title[cmd] then
      result_index = index
    end
  end
  if result_index ~= -1 then
    builtin.resume { cache_index = result_index }
  else
    cmd_2_func[cmd](theme)
  end
end

return
{
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  config = function()
    vim.keymap.set("n", "<C-f>", function() telescope_cmd("live_grep") end, {})
    vim.keymap.set("n", "<C-o>", function() telescope_cmd("find_files") end, {})
    require("telescope").setup({
      pickers = {
        find_files = {
          no_ignore = true
        },
        live_grep = {
          additional_args = { "--no-ignore" }
        }
      }
    })
  end
}
