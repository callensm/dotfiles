return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          never_show = { ".git" },
        },
      },
    },
  },

  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local null_ls = require "null-ls"
      opts.sources = require("astrocore").list_insert_unique(opts.sources, {
        null_ls.builtins.formatting.prettier.with {
          condition = function(utils)
            return utils.root_has_file {
              ".prettierrc",
              ".prettierrc.js",
              ".prettierrc.json",
              ".prettierrc.toml",
              ".prettierrc.yaml",
              ".prettierrc.yml",
            }
          end,
        },
      })
      return opts
    end,
  },

  {
    "nvim-mini/mini.move",
    event = "VeryLazy",
    opts = {
      mappings = {
        -- Visual mode
        left = "",
        right = "",
        down = "<A-j>",
        up = "<A-k>",
        -- Normal mode
        line_left = "",
        line_right = "",
        line_up = "<A-k>",
        line_down = "<A-j>",
      },
    },
  },

  {
    "Isrothy/neominimap.nvim",
    lazy = true,
    keys = {
      { "<leader>m", "<cmd>Neominimap Toggle<cr>", desc = "Toggle Global Minimap" },
    },
    init = function()
      -- The following options are recommended when layout == "float"
      vim.opt.wrap = false
      vim.opt.sidescrolloff = 36

      --- Put your configuration here
      vim.g.neominimap = {
        auto_enable = false,
      }
    end,
  },
}
