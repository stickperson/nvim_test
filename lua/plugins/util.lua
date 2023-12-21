return {
  -- session management
  { "rmagatti/auto-session", lazy = false, opts = { auto_session_enable_last_session = true } },

  -- library used by other plugins
  { "nvim-lua/plenary.nvim", lazy = true },

  -- makes some plugins dot-repeatable like leap
  { "tpope/vim-repeat", event = "VeryLazy" },

  {
    "phaazon/mind.nvim",
    branch = "v2.2",
    cmd = { "MindOpenMain", "MindClose" },
    keys = {
      { "<leader>mo", "<cmd> MindOpenMain <cr>", "open mind" },
      { "<leader>mc", "<cmd> MindClose <cr>", "close mind" },
    },
    config = true,
  },
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    keys = {
      { "<leader>ni", "<cmd> Neorg index <cr>", "Neorg index" },
    },
    opts = {
      load = {
        ["core.export"] = {},
        ["core.qol.todo_items"] = {
          config = {
            create_todo_items = true,
            create_todo_parents = true,
          },
        },
        ["core.completion"] = {
          config = {
            engine = "nvim-cmp",
          },
        },
        ["core.defaults"] = {},
        ["core.concealer"] = {
          config = {
            icon_preset = "diamond",
          },
        }, -- Adds pretty icons to your documents
        ["core.dirman"] = { -- Manages Neorg workspaces
          config = {
            default_workspace = "notes",
            workspaces = {
              notes = "~/notes",
            },
          },
        },
      },
    },
    dependencies = { { "nvim-lua/plenary.nvim" } },
  },
}
