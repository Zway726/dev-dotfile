local util = require('util')
local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local function sourcekit_cmd(filetype)
  local cmd = { "sourcekit-lsp" }
  -- disable header auto include in objc file
  if filetype == "objc" or filetype == "objc++" then
    cmd = util.merge_table(cmd, {
      "-Xclangd", "--header-insertion=never"
    })
  end
  return cmd
end

lspconfig.sourcekit.setup {
  on_new_config = function (new_config, _)
    new_config.cmd = sourcekit_cmd(vim.bo.filetype)
  end,
  capabilities = capabilities,
  cmd = {
    'sourcekit-lsp',
  },
  filetypes = { "swift", "c", "cpp", "objective-c", "objective-cpp", "objc", "objc++" },
  root_dir = lspconfig.util.root_pattern("Package.swift", ".git", "buildServer.json", "compile_commands.json")
}

