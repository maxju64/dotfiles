-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<Esc>", function()
  if vim.v.hlsearch == 1 then
    vim.cmd("nohlsearch")
    return ""
  end
  return "<Esc>"
end, { expr = true })

vim.keymap.set({ "x" }, "y", '"+y', { desc = "Copy to system clipboard" })
