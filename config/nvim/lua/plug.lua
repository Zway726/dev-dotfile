-- lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "git@github.com:folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- colorscheme
  require('colorscheme-config'),
  "tpope/vim-fugitive",
  "tpope/vim-commentary",
  { "vimjas/vim-python-pep8-indent", ft = "python", },

  require("nerdtree"),
  require("telescope-config"),

  "nvim-lua/plenary.nvim",
  { "NMAC427/guess-indent.nvim", config = true },

  -- { "folke/neodev.nvim",  ft = "lua" },
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        {
          vim.env.VIMRUNTIME,
          "${3rd}/luv/library"
        }
      }
    }
  },

  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && yarn install",
    ft = "markdown"
  },
  { "lewis6991/gitsigns.nvim", config = true },
  require("lsp"),
  -- fidget may spam the screen when bunch of messages coming out, so I just replace it
  -- {
  --   "j-hui/fidget.nvim",
  --   tag = "legacy",
  --   event = "LspAttach",
  --   config = function()
  --     require("fidget").setup {}
  --   end
  -- },
  require("completion"),
  require("lualine-config"),
  require('untracked-config').plugs,
}, {
  git = {
    url_format = "git@github.com:%s.git"
  },
  ui = {
    icons = {
      cmd = "",
      config = "",
      event = "",
      ft = "",
      init = "",
      import = "",
      keys = "",
      lazy = "",
      loaded = "●",
      not_loaded = "○",
      plugin = "",
      runtime = "",
      source = "",
      start = "",
      task = "✔ ",
      list = {
        "●",
        "➜",
        "★",
        "‒",
      },
    }
  }
})
