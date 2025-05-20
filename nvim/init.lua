
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

function theme(type)
	if type == oled or type == "oled" then
		chosen_theme_name = oled_themes[math.random(#oled_themes)]
	else
		chosen_theme_name = pretty_themes[math.random(#pretty_themes)]
	end
	vim.cmd("colorscheme " .. chosen_theme_name)
end

vim.cmd("colorscheme " .. "unokai")

------------
-- uganda --
------------
vim.o.shortmess = vim.o.shortmess .. "I"
