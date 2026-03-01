return {
    "folke/snacks.nvim",
    event = "VimEnter",
    opts = {
        bigfile = { enabled = true },
        dashboard = { enabled = false },  -- Отключил (минимализм)
        image = { enabled = false },  -- Не нужно
        indent = { enabled = true },
        lazygit = { enabled = true },
        picker = { enabled = true },
        notifier = {
            enabled = true,
            timeout = 2000,
            level = vim.log.levels.WARN,
            icons = {
                error = "",
                warn = "",
                info = "",
                debug = "",
                trace = "✎",
            },
        },
        git = { enabled = true },  -- Подсветка изменений
        quickfile = { enabled = true },
        scope = { enabled = true },
        scroll = { enabled = false },  -- Экономия ресурсов
        scratch = { enabled = false },  -- Не нужно
        statuscolumn = { enabled = true },
        terminal = { enabled = true },
        words = { enabled = true },  -- Навигация по словам
    },
    keys = {
        { "<leader>lg",      function() Snacks.lazygit() end,                                        desc = "[L]azy[G]it" },
        { "<leader>un",      function() Snacks.notifier.hide() end,                                  desc = "Dismiss All Notifications" },
        { "<c-/>",           function() Snacks.terminal() end,                                       desc = "Toggle Terminal",                       mode = { "n", "t" } },
        { "<c-_>",           function() Snacks.terminal() end,                                       desc = "which_key_ignore" },
        { "]]",              function() Snacks.words.jump(vim.v.count1) end,                         desc = "Next Reference",                        mode = { "n", "t" } },
        { "[[",              function() Snacks.words.jump(-vim.v.count1) end,                        desc = "Prev Reference",                        mode = { "n", "t" } },
        { "\\",              function() Snacks.explorer() end,                                       desc = "File Explorer" },
        { "<leader>sf",      function() Snacks.picker.files() end,                                   desc = "[S]earch [F]iles" },
        { "<leader>sg",      function() Snacks.picker.grep() end,                                    desc = "[S]earch by [G]rep" },
        { "<leader>sd",      function() Snacks.picker.diagnostics() end,                             desc = "[S]earch [D]iagnostics" },
        { "<leader>sh",      function() Snacks.picker.help() end,                                    desc = "[S]earch [H]elp" },
        { "<leader>sk",      function() Snacks.picker.keymaps() end,                                 desc = "[S]earch [K]eymaps" },
        { "<leader>sr",      function() Snacks.picker.resume() end,                                  desc = "[S]earch [R]esume" },
        { "<leader>s.",      function() Snacks.picker.recent() end,                                  desc = "[S]earch Recent Files" },
        { "<leader>/",       function() Snacks.picker.lines() end,                                   desc = "[/] Fuzzily search in buffer" },
    }
}
