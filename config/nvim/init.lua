vim.opt.compatible = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.syntax = "on"
vim.opt.fileencodings = {"utf-8", "gbk", "gb18030", "gb2312", "cp936", "usc-bom", "euc-jp"}
vim.opt.encoding = "utf-8"
vim.opt.hlsearch = true
vim.opt.cmdheight = 1
vim.opt.hidden = true

-- allow backspacing over everything in insert mode
vim.opt.backspace = {"indent", "eol", "start"}
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
vim.opt.guicursor = {"n-v-c-sm-i:block", "ci-ve:ver25", "r-cr-o:hor20"}

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
-- 小于 99 层(shiftwidth)的嵌套都会直接被压成一层
vim.opt.foldlevel = 99

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd(
    { "InsertLeave" },
    { pattern = "*", command = "set nopaste" }
)

-- work with vim quickfix list
vim.cmd("packadd! cfilter")

vim.wo.signcolumn = "yes"

-- fzf preview window size 
vim.g.fzf_preview_window = {"up:40%", "ctrl-/"}

-- set stop for specific filetype 
local function set_stop(setting_table)
    for filetype, stop_num in pairs(setting_table) do
        vim.api.nvim_create_autocmd(
            { "FileType " },
            { pattern = filetype, command = "setlocal tabstop=" .. stop_num }
        )
        vim.api.nvim_create_autocmd(
            { "FileType " },
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
    lua = 2
})

local xbase_config = {
  --- Log level. Set it to ERROR to ignore everything
  log_level = vim.log.levels.DEBUG,
  --- Options to be passed to lspconfig.nvim's sourcekit setup function.
  --- Setting this to {} is sufficient, However, it is strongly recommended to use on_attach key to setup custom mappings
  --- {
  --- cmd = { "sourcekit-lsp", "--log-level", "error" },
  --- filetypes = { "swift" },
  --- root_dir = pattern("Package.swift", ".git", "project.yml", "Project.swift"),
  --- }
  sourcekit = nil, -- Disabled by default (xbase will not call it for you)
  --- Statusline provider configurations
  statusline = {
    watching = { icon = "", color = "#1abc9c" },
    device_running = { icon = "", color = "#4a6edb" },
    success = { icon = "", color = "#1abc9c" },
    failure = { icon = "", color = "#db4b4b" },
  },
  --- Simulators to only include.
  --- run `xcrun simctl list` to get a full list of available simulator
  --- If the list is empty then all simulator available  will be included
  simctl = {
    iOS = {
      -- "iPhone 13 Pro", --- only use this devices
    },
    watchOS = {}, -- all available devices
    tvOS = {}, -- all available devices
  },
  --- Log buffer configurations
  log_buffer = {
    --- Whether toggling the buffer should auto focus to it?
    focus = true,
    --- Split Log buffer height
    height = 20,
    --- Vsplit Log buffer width
    width = 75,
    --- Default log buffer direction: { "horizontal", "vertical" }
    default_direction = "horizontal",
  },
  --- Mappings
  mappings = {
    --- Whether xbase mapping should be disabled.
    enable = true,
    --- Open build picker. showing targets and configuration.
    build_picker = "<leader>b", --- set to 0 to disable
    --- Open run picker. showing targets, devices and configuration
    run_picker = "<leader>r", --- set to 0 to disable
    --- Open watch picker. showing run or build, targets, devices and configuration
    watch_picker = "<leader>s", --- set to 0 to disable
    --- A list of all the previous pickers
    all_picker = "<leader>ef", --- set to 0 to disable
    --- horizontal toggle log buffer
    toggle_split_log_buffer = "<leader>ls",
    --- vertical toggle log buffer
    toggle_vsplit_log_buffer = "<leader>lv",
  },
}

vim.cmd([[
lang en_US.UTF-8
filetype plugin indent on
exec "nohlsearch"
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)

" Imports
runtime ./plug.vim
runtime ./macos.vim
runtime ./maps.vim
runtime ./colors/color.vim
]])

require("lsp")
require"xbase".setup(xbase_config)
