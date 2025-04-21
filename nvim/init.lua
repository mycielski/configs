
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

local pretty_themes = {
	"sorbet",
	"slate",
	"unokai",
}
local oled_themes = {
	"koehler",
	"lunaperche",
	"wildcharm",
}
-- random_theme = pretty_themes[math.random(#pretty_themes)]
vim.cmd("colorscheme " .. "unokai")
