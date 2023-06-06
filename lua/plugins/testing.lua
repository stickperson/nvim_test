return {
  {
    "folke/edgy.nvim",
    -- event = "VeryLazy",
    opts = {
      bottom = {
        -- toggleterm / lazyterm at the bottom with a height of 40% of the screen
        { ft = "toggleterm", size = { height = 0.25 } },
        {
          ft = "lazyterm",
          title = "LazyTerm",
          size = { height = 0.25 },
          filter = function(buf)
            return not vim.b[buf].lazyterm_cmd
          end,
        },
        "Trouble",
        { ft = "qf", title = "QuickFix" },
        {
          ft = "help",
          size = { height = 20 },
          -- only show help buffers
          filter = function(buf)
            return vim.bo[buf].buftype == "help"
          end,
        },
        { ft = "spectre_panel", size = { height = 0.4 } },
      },
      left = {
        -- Neo-tree filesystem always takes half the screen height
        {
          title = "Neo-Tree",
          ft = "neo-tree",
          filter = function(buf)
            return vim.b[buf].neo_tree_source == "filesystem"
          end,
          size = { height = 0.5 },
        },
        {
          ft = "Outline",
          pinned = true,
          open = "SymbolsOutline",
        },
        {
          ft = "aerial",
          -- pinned = true,
          -- open = "SymbolsOutline",
        },
      },
    },
  },
  {
    "simrat39/symbols-outline.nvim",
    config = true,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
  },
}
