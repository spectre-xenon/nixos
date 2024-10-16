return {
  "stevearc/conform.nvim",
  lazy = true,
  event = { "BufWritePre" },
  cmd = "ConformInfo",
  ---@type conform.setupOpts
  opts = {
    default_format_opts = {
      timeout_ms = 3000,
      async = false, -- not recommended to change
      quiet = false, -- not recommended to change
      lsp_format = "fallback", -- not recommended to change
    },
    formatters_by_ft = {
      lua = { "stylua" },
      nix = { "alejandra" },
      -- Web
      javascript = { "prettierd" },
      typescript = { "prettierd" },
      javascriptreact = { "prettierd" },
      typescriptreact = { "prettierd" },
      ["*"] = { "injected" },
    },
    format_on_save = {
      lsp_format = "fallback",
      timeout_ms = 500,
    },
    formatters = {
      injected = { options = { ignore_errors = true } },
    },
  },
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({ async = false, quiet = false, timeout_ms = 3000, lsp_format = "fallback" })
      end,
      mode = { "n", "v" },
      desc = "Format Injected Langs",
    },
  },
}
