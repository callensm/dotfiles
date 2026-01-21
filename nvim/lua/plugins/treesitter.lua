---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    opts.auto_install = false
    opts.ensure_installed = {
      "bash",
      "go",
      "gomod",
      "hcl",
      "javascript",
      "json",
      "lua",
      "rust",
      "terraform",
      "toml",
      "tsx",
      "typescript",
      "vim",
      "yaml",
    }
    return opts
  end,
}
