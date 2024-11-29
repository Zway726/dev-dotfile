local M = {}

local util = require('util')
_, M.plugs = util.require('untracked_config.plugs')
_, M.cmp_sources = util.require('untracked_config.cmp-sources')

function M.settings()
  util.require('untracked_config.settings')
end

return M
