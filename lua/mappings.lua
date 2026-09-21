-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jj", "<ESC>", { desc = "Escape con jj" })
map("t", "<Esc>", [[<C-\><C-n>]], { desc = "Salir del modo terminal" })
map("t", "jj", [[<C-\><C-n>]], { desc = "Salir del modo terminal con jj" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
