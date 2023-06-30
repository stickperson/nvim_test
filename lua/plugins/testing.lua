return {
  {
    "folke/edgy.nvim",
    event = "VeryLazy",
    opts = {
      animate = {
        enabled = false,
      },
      exit_when_last = true,
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
        { ft = "spectre_panel", size = { height = 0.4 } },
      },
      left = {
        -- Neo-tree filesystem always takes half the screen height
        {
          title = "NvimTree",
          ft = "NvimTree",
          size = { height = 0.5 },
        },
      },
    },
  },
}
