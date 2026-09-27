local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    c = { "clang-format" },
    haskell = { "fourmolu" },
  },

  formatters = {
    ["clang-format"] = {
      prepend_args = {
        "--style={IndentWidth: 2, ColumnLimit: 80, BinPackArguments: false, BinPackParameters: false, AlignAfterOpenBracket: AlwaysBreak, IndentCaseLabels: true, AllowAllParametersOfDeclarationOnNextLine: false}",
      },
    },
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
