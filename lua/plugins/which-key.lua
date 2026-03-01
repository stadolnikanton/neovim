-- Which-key - подсказки хоткеев
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    plugins = { spelling = true },
    defaults = {},
    win = {
      border = "single",
      padding = { 1, 2 },
      title = true,
      title_pos = "center",
    },
    layout = {
      height = { min = 4, max = 25 },
      width = { min = 20, max = 50 },
      spacing = 3,
      align = "left",
    },
    ignore_missing = false,
    show_help = true,
    show_keys = true,
    triggers = {
      { "<auto>", mode = "nixs" },
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    
    -- Группировка хоткеев (минималистично)
    wk.add({
      { "<leader>b", group = "buffer" },
      { "<leader>c", group = "code" },
      { "<leader>d", group = "debug" },
      { "<leader>f", group = "file/find" },
      { "<leader>g", group = "git" },
      { "<leader>h", group = "hunks" },
      { "<leader>l", group = "lsp" },
      { "<leader>s", group = "search" },
      { "<leader>t", group = "terminal" },
      { "<leader>w", group = "window" },
      { "<leader>x", group = "diagnostics" },
      { "<leader>z", group = "plugins" },
    })
  end,
}
