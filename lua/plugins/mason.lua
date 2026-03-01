return {
  {
    "neovim/nvim-lspconfig"
  },
  {
    "mason-org/mason.nvim",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
        keymaps = {
          toggle_server_expandability = "<CR>",
          toggle_package_expandability = "<CR>",
        },
      },
    }
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "mason-org/mason.nvim"
    },
    opts = {
      ensure_installed = {
        "lua_ls",
        "pyright",
        "ts_ls",
        "clangd",
        "gopls",
        "html",
        "cssls",
        "jsonls",
        "sqlls",
      },
      automatic_installation = {
        exclude = { "lua_ls" },  -- lua_ls ставим вручную
      },
    }
  }
}
