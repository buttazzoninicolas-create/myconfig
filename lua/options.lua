require "nvchad.options"
-- add yours here!

local opt = vim.opt

opt.timeoutlen = 300  -- El valor está en milisegundos
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = false

opt.list = true
opt.listchars = { tab = '↳ ', trail = '•' }
