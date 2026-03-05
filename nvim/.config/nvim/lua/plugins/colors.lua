local function enable_transparency()
    vim.api.nvim_set_hl(0, "Normal", { bg = "none"})
end
return { 
    {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
	vim.cmd([[colorscheme catppuccin-mocha]])
    end
    }
}
-- return {
--     {
-- 	"folke/tokyonight.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 	    vim.cmd.colorscheme "tokyonight-night"
-- 	end
--     },
--     {
-- 	"nvim-lualine/lualine.nvim",
-- 	dependencies = {
-- 	    "nvim-tree/nvim-web-devicons",
-- 	},
-- 	opts = {
-- 	    theme = 'tokyonight',
-- 	}
--     }
-- }
