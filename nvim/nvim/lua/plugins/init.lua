return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "python", "c", "lua", "vim", "vimdoc" },
      highlight = { enable = true },
    },
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      hijack_cursor = true,
      renderer = { highlight_opened_files = "all" },
    },
  },
}
