--------------------------------
-- sync clipboard with system --
--------------------------------
vim.opt.clipboard = "unnamedplus"

------------------
-- line numbers --
------------------
vim.opt.number = true
vim.opt.relativenumber = true


-----------
-- theme --
-----------
vim.opt.termguicolors = true

local prettiest_themes = {
	"koehler",
	"lunaperche",
	"sorbet",
	"wildcharm",
}
vim.cmd("colorscheme " .. prettiest_themes[3])
