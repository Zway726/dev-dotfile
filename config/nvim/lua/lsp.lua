local _config = function ()
  -- Setup language servers.
  local lspconfig = require('lspconfig')
  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  lspconfig.pyright.setup {
    capabilities = capabilities
  }
  lspconfig.ts_ls.setup {
    capabilities = capabilities
  }

  -- require("neodev").setup({})
  lspconfig.lua_ls.setup {
    capabilities = capabilities,
    settings = {
      Lua = {
        diagnostics = {
          disable = {"missing-fields", "incomplete-signature-doc"}
        },
        completion = {
          callSnippet = "Replace"
        }
      }
    }
  }
  lspconfig.rust_analyzer.setup {
    -- Server-specific settings. See `:help lspconfig-setup`
    capabilities = capabilities,
    settings = {
      ['rust-analyzer'] = {
        formatOnType = true,
        cargo = {
          buildScripts = {
            enable = true
          }
        }
      },
    },
  }
  lspconfig.sourcekit.setup {
    capabilities = capabilities,
    cmd = { 'sourcekit-lsp' },
    filetypes = { "swift", "c", "cpp", "objective-c", "objective-cpp", "objc" },
    root_dir = lspconfig.util.root_pattern("Package.swift", ".git", "buildServer.json")
  }
  lspconfig.ruby_lsp.setup {
    capabilities = capabilities,
    init_options = {
      -- enabled_features = {
      --   code_action = true,
      --   completion = true,
      --   definition = true,
      --   diagnostics = true,
      --   hover = true,
      --   type_hierarchy = true,
      --   workspace_symbol = true,
      -- },
      formatter = 'standard',
      linters = { 'standard' },
    }
  }


  -- Global mappings.
  -- See `:help vim.diagnostic.*` for documentation on any of the below functions
  -- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
  -- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

  -- Use LspAttach autocommand to only map the following keys
  -- after the language server attaches to the current buffer
  vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
      -- Enable completion triggered by <c-x><c-o>
      vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

      -- Buffer local mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      local opts = { buffer = ev.buf }
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
      -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
      -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
      -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
      -- vim.keymap.set('n', '<space>wl', function()
      --  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      -- end, opts)
      vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
      vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
      vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
      vim.keymap.set('n', ';f', function()
        vim.lsp.buf.format { async = true }
      end, opts)
    end,
  })

end

return {
  "neovim/nvim-lspconfig",
  config = _config
}

