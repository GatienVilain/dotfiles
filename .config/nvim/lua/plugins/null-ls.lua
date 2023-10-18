return {

  -- Enable Linters and Formatters
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "jay-babu/mason-null-ls.nvim",
    },
    opts = function()
      local null_ls = require("null-ls")

      return {
        sources = {
          null_ls.builtins.diagnostics.mypy,
          null_ls.builtins.diagnostics.ruff,
        }
      }
    end,
  },

  -- Install necessary Linters and Formatters using Mason
  {
    "jay-babu/mason-null-ls.nvim",
    cmd = { "LspInstall" },
    dependencies = {
      "williamboman/mason.nvim",
    },
    opts = {
      ensure_installed = {
        "mypy",
        "ruff",
      },
    },
  },

}