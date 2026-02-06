---@type LazySpec
return {
  -- use mason-tool-installer for automatically installing Mason packages
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- overrides `require("mason-tool-installer").setup(...)`
    opts = {
      ensure_installed = {
        -- Language servers
        "bash-language-server",
        "docker-language-server",
        "gh-actions-language-server",
        "gopls",
        "json-lsp",
        "lua-language-server",
        "postgres-language-server",
        "rust-analyzer",
        "terraform-ls",
        "typescript-language-server",

        -- Formatters
        "shfmt",
        "stylua",
        "taplo",
        "tflint",

        -- Utilities
        "tree-sitter-cli",
      },
    },
  },
}
