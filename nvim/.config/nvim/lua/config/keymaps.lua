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

-- Send command to the pane below and run it
vim.keymap.set("n", "<leader>m", function()
  vim.fn.system("tmux send-keys -t '{down-of}' 'make run' Enter")
end, { desc = "Run make in pane below" })

vim.keymap.set({ "x" }, "y", '"+y', { desc = "Copy to system clipboard" })
