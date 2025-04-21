math.randomseed(os.time())

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
	"slate",
	"unokai",

}
random_theme = prettiest_themes[math.random(#prettiest_themes)]
vim.cmd("colorscheme " .. random_theme)
