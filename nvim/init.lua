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
vim.opt.listchars = { tab = '→ ', trail = '•' }

-- Bootstrap de lazy.nvim
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
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
