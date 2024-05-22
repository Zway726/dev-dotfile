vim.opt.compatible = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.syntax = "on"
vim.opt.fileencodings = { "utf-8", "gbk", "gb18030", "gb2312", "cp936", "usc-bom", "euc-jp" }
vim.opt.encoding = "utf-8"
vim.opt.hlsearch = true
vim.opt.cmdheight = 1
vim.opt.hidden = true

-- allow backspacing over everything in insert mode
vim.opt.backspace = { "indent", "eol", "start" }
-- show the cursor position all the time
vim.opt.ruler = true
-- display incomplete comands
vim.opt.showcmd = true
-- Dont wait so long for the next keypress
vim.opt.timeoutlen = 500

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.wrap = true
vim.opt.pumheight = 15

-- signle line status bar
vim.opt.laststatus = 3

vim.opt.autoread = true
vim.opt.spell = false
vim.opt.mouse = "a"

-- neovim
vim.opt.clipboard:append("unnamedplus")

-- reserve 5 line while scrolling the page
vim.opt.scrolloff = 5
vim.opt.guicursor = { "n-v-c-sm-i:block", "ci-ve:ver25", "r-cr-o:hor20" }

-- Backup files
vim.opt.directory = "/tmp/.swp//"
vim.opt.backupdir = "/tmp/.bckup//"
vim.opt.undofile = true
vim.opt.undodir = "/tmp/.undo//"

-- Finding files - Search down into subfolders
vim.opt.path:append("**")
vim.opt.wildignore:append("*/node_modules/*")

-- fold the content with same indent
vim.opt.foldmethod = "indent"
vim.opt.foldenable = false
vim.opt.foldlevel = 99

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd(
  { "InsertLeave" },
  { pattern = "*", command = "set nopaste" }
)

-- work with vim quickfix list
vim.cmd("packadd! cfilter")

vim.wo.signcolumn = "yes"

-- set stop for specific filetype
local function set_stop(setting_table)
  for filetype, stop_num in pairs(setting_table) do
    vim.api.nvim_create_autocmd(
      { "FileType" },
      { pattern = filetype, command = "setlocal tabstop=" .. stop_num }
    )
    vim.api.nvim_create_autocmd(
      { "FileType" },
      { pattern = filetype, command = "setlocal shiftwidth=" .. stop_num }
    )
  end
end

set_stop({
  javascript = 2,
  typescript = 2,
  html = 2,
  css = 2,
  swift = 2,
  json = 2,
  objc = 4,
  lua = 2,
  proto = 2,
})

vim.cmd([[runtime ./maps.vim]])

require("plug")

vim.cmd([[
lang en_US.UTF-8
filetype plugin indent on
exec "nohlsearch"

" Imports
runtime ./colors/color.vim
]])

-- disable semantic highlight
-- https://www.reddit.com/r/neovim/comments/12gvms4/this_is_why_your_higlights_look_different_in_90/
for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
  vim.api.nvim_set_hl(0, group, {})
end
