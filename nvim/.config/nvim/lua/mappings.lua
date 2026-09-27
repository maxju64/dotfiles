require "nvchad.mappings"

local map = vim.keymap.set

-- Navigation between terminal panes
map("i", "jk", "<ESC>")
map("t", "<C-h>", "<C-\\><C-N><C-w>h", { desc = "window left" })
map("t", "<C-j>", "<C-\\><C-N><C-w>j", { desc = "window down" })
map("t", "<C-k>", "<C-\\><C-N><C-w>k", { desc = "window up" })
map("t", "<C-l>", "<C-\\><C-N><C-w>l", { desc = "window right" })

-- Show documentation in a floating window over the word under the cursor
map("n", "K", vim.lsp.buf.hover, { desc = "Show documentation" })
map("n", "<leader>th", ":split | terminal<CR>", { desc = "Terminal Horizontal" })
local builtin = require "telescope.builtin"

--Telescope Binds
map("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
map("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
map("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
map("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
map({ "n", "v" }, "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
map("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
map("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
map("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
map("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
map("n", "<leader>sc", builtin.commands, { desc = "[S]earch [C]ommands" })
map("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

map("n", "<leader>nc", ":NvCheatsheet\r", { desc = "NvChad Cheatsheet" })
map("t", "<C-x>", "<C-\\><C-N>:q\r", { desc = "terminal close" })
map("t", "<C-e>", "<C-\\><C-N>", { desc = "terminal escape insert mode" })
map("n", "<F2>", function()
  vim.cmd "wall"
end, { desc = "Write all buffers to file." })

local function run_code(command, position, size)
  require("nvchad.term").runner {
    pos = position,
    size = size,
    cmd = command,
    id = "ekk",
    clear_cmd = false,
  }
end

map({ "n", "t" }, "<F5>", function()
  vim.cmd "w"
  run_code("make", "sp", 0.2)
end, { desc = "Run make" })

map({ "n", "t" }, "<F6>", function()
  vim.cmd "w"
  vim.cmd "wincmd j"
  run_code("make run", "sp", 0.4)
end, { desc = "Run make run in spawned terminal" })

map({ "n", "t" }, "<F7>", function()
  vim.cmd "w"
  vim.cmd "wincmd l"
  run_code("make debug", "vsp", 0.3)
end, { desc = "Run make debug in spawned terminal" })

-- load the session for the current directory
vim.keymap.set("n", "<leader>qs", function()
  require("persistence").load()
end)

-- select a session to load
vim.keymap.set("n", "<leader>qS", function()
  require("persistence").select()
end)

-- load the last session
vim.keymap.set("n", "<leader>ql", function()
  require("persistence").load { last = true }
end)

-- stop Persistence => session won't be saved on exit
vim.keymap.set("n", "<leader>qd", function()
  require("persistence").stop()
end)
