local function telescope_cmd(cmd)
  local theme = require'telescope.themes'.get_ivy()
  theme['layout_config']['height'] = math.floor(vim.o.lines * 0.4)
  local builtin = require'telescope.builtin'
  if cmd == 'find_files' then
    builtin.find_files(theme)
  elseif cmd == 'live_grep' then
    builtin.live_grep(theme)
  end
end

return
{
  "nvim-telescope/telescope.nvim",
  tag = "0.1.2",
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  config = function()
    vim.keymap.set("n", "<C-f>", function () telescope_cmd("live_grep") end , {})
    vim.keymap.set("n", "<C-o>", function () telescope_cmd("find_files") end , {})
  end
}
