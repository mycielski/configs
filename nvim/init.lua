
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


-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- add your plugins here
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
