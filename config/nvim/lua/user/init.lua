return {
  -- Plugins
  plugins = {
    -- Desabilita temas padrão do AstroNvim
    { "astrotheme/astrodark", enabled = false },
    { "catppuccin/nvim", enabled = false },
    
    -- Sua configuração do PHP
    {
      "williamboman/mason-lspconfig.nvim",
      opts = {
        ensure_installed = { "phpactor" }
      }
    }
  },

  -- Configuração do LSP
  lsp = {
    servers = {
      "phpactor",
    },
    config = {
      phpactor = function()
        return {
          cmd = { "phpactor", "language-server" },
          filetypes = { "php" },
          root_dir = require("lspconfig.util").root_pattern("composer.json", ".git", ".phpactor.json"),
        }
      end,
    }
  },

}
