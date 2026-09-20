vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "
vim.opt.termguicolors = true

-- Ancho visual del carácter Tab (\t)
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

-- Ancho de indentación al usar comandos como >> o <<
vim.opt.shiftwidth = 4

-- CRUCIAL: Desactivar conversión a espacios (inserta el carácter \t real)
vim.opt.expandtab = false

-- Mostrar caracteres invisibles (útil para ver si hay espacios indeseados)
vim.opt.list = true
vim.opt.listchars = { tab = '↳ ', trail = '•' }

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end
vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },
  { import = "plugins" },
}, lazy_config)

dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "autocmds"

vim.schedule(function()
  require "mappings"
end)
