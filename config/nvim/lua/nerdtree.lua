return {
  "scrooloose/nerdtree",
  config = function ()
    vim.keymap.set({"n", "v"},  "<C-e>",  ":NERDTreeToggle<CR>", {})
    vim.keymap.set({"n", "v"},  "<leader>e",":NERDTreeFind<CR>", {})
    vim.g.NERDTreeShowHidden = 1
    vim.g.NERDTreeWinPos = "right"
    vim.g.NERDTreeMinialMenu = 0
    vim.g.NERDTreeDirArrowExpandable = " "
    vim.g.NERDTreeDirArrowCollapsible = " "
  end
}
