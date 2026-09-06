require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- map("n", ";", ":", { desc = "CMD enter command mode" })

-- Navigation between terminal panes
map("i", "jk", "<ESC>")
map("t", "<C-h>", "<C-\\><C-N><C-w>h", { desc = "window left" })
map("t", "<C-j>", "<C-\\><C-N><C-w>j", { desc = "window down" })
map("t", "<C-k>", "<C-\\><C-N><C-w>k", { desc = "window up" })
map("t", "<C-l>", "<C-\\><C-N><C-w>l", { desc = "window right" })

-- Show documentation in a floating window over the word under the cursor
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Show documentation' })
vim.keymap.set('n', '<leader>th', ':split | terminal<CR>', { desc = 'Terminal Horizontal' })

map("t", "<C-x>", "<C-\\><C-N>:q\r", { desc = "terminal close" })
map("t", "<C-e>", "<C-\\><C-N>", { desc = "terminal escape insert mode" })
map({ "n", "t" }, "<F5>", function()
 require("nvchad.term").runner {
    pos = "sp",
    size = 0.2,
    cmd = "make",
    id = "ekk",
    clear_cmd = false
 }
end)
map({ "n", "t" }, "<F6>", function()
 require("nvchad.term").runner {
    pos = "sp",
    size = 0.2,
    cmd = "make run",
    id = "ekk",
    clear_cmd = false
 }
end)

-- load the session for the current directory
vim.keymap.set("n", "<leader>qs", function() require("persistence").load() end)

-- select a session to load
vim.keymap.set("n", "<leader>qS", function() require("persistence").select() end)

-- load the last session
vim.keymap.set("n", "<leader>ql", function() require("persistence").load({ last = true }) end)

-- stop Persistence => session won't be saved on exit
vim.keymap.set("n", "<leader>qd", function() require("persistence").stop() end)
