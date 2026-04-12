return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = true,
          never_show = { ".git" },
        },
      },
    },
  },

  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local null_ls = require "null-ls"
      local h = require "null-ls.helpers"

      local oxfmt = h.make_builtin {
        name = "oxfmt",
        meta = { url = "https://github.com/aspect-build/rules_lint" },
        method = null_ls.methods.FORMATTING,
        filetypes = {
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
          "css",
          "html",
        },
        generator_opts = {
          command = "oxfmt",
          args = { "--stdin-filepath", "$FILENAME" },
          to_stdin = true,
        },
        factory = h.formatter_factory,
      }

      opts.sources = require("astrocore").list_insert_unique(opts.sources, {
        oxfmt.with {
          condition = function(utils)
            return utils.root_has_file {
              ".oxfmtrc.json",
            }
          end,
        },
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
}
