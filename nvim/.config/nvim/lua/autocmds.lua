require "nvchad.autocmds"

vim.api.nvim_create_autocmd({ "TermOpen" }, {
  pattern = "*",
  callback = function()
    vim.cmd "startinsert"
  end,
})

vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
  pattern = "term://*",
  callback = function()
    if vim.bo.buftype == "terminal" then
      vim.cmd "startinsert"
    end
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.hs",
  callback = function()
    if vim.bo.buftype == "" then
      vim.cmd "w"
      vim.fn.chansend(3, ":r\n")
    end
  end,
})
