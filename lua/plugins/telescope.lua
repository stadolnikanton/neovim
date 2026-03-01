-- Telescope - поиск файлов и grep
return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      enabled = true,
    },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        -- Минималистичный UI
        prompt_prefix = "   ",
        selection_caret = "  ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
          },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
        -- Цвета (gruvbox совместимые)
        border = true,
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        color_devicons = true,
        set_env = { ["COLORTERM"] = "truecolor" },
        -- mappings
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-c>"] = actions.close,
            ["<CR>"] = actions.select_default,
            ["<C-s>"] = actions.select_horizontal,
            ["<C-v>"] = actions.select_vertical,
            ["<C-t>"] = actions.select_tab,
            ["<C-u>"] = actions.preview_scrolling_up,
            ["<C-d>"] = actions.preview_scrolling_down,
          },
          n = {
            ["q"] = actions.close,
            ["j"] = actions.move_selection_next,
            ["k"] = actions.move_selection_previous,
            ["<CR>"] = actions.select_default,
            ["s"] = actions.select_horizontal,
            ["v"] = actions.select_vertical,
            ["t"] = actions.select_tab,
          },
        },
        file_ignore_patterns = {
          "node_modules",
          ".git/",
          "__pycache__",
          "*.pyc",
          "venv/",
          ".venv/",
          "vendor/",
        },
      },
      pickers = {
        find_files = {
          hidden = true,
          find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*" },
        },
        live_grep = {
          additional_args = function()
            return { "--hidden", "--glob", "!.git/*" }
          end,
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
    })

    telescope.load_extension("fzf")

    -- Хоткеи (твои, не меняю)
    local map = vim.keymap.set
    map("n", "<leader>ff", require("telescope.builtin").find_files, { desc = "Find files" })
    map("n", "<leader>fg", require("telescope.builtin").live_grep, { desc = "Live grep" })
    map("n", "<leader>fb", require("telescope.builtin").buffers, { desc = "Buffers" })
    map("n", "<leader>fh", require("telescope.builtin").help_tags, { desc = "Help tags" })
    map("n", "<leader>fs", require("telescope.builtin").lsp_document_symbols, { desc = "LSP symbols" })
  end,
}
