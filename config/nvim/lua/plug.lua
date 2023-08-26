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
  {
    "rhysd/vim-color-spring-night",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme spring-night]])
    end
  },

  "tpope/vim-fugitive",
  "tpope/vim-commentary",

  require("nerdtree"),

  "junegunn/fzf",
  "junegunn/fzf.vim",

  "nvim-lua/plenary.nvim",
  "vim-airline/vim-airline",
  "jiangmiao/auto-pairs",

  { "folke/neodev.nvim", ft = "lua" },

  { "rust-lang/rust.vim", ft = "rust" },
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && yarn install",
    ft = "markdown"
  },
  require("lsp"),
  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    event = "LspAttach",
    config = function ()
      require("fidget").setup {}
    end
  },
  require("completion"),
  require("xbaseConfig"),
  require("ranger")
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
