return {
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("ibl").setup({
        indent = {
          char = "│",
          highlight = "Comment",
        },
        scope = {
          enabled = false,
        },
      })
    end,
  },
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
