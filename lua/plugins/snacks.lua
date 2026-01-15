return {
    "folke/snacks.nvim",
    event = "VimEnter",
    opts = {
        bigfile = { enabled = true },
        dashboard = {
            enabled = true,
            preset = {
            },
            sections = {
                { section = 'header' },
                { section = "keys",   indent = 1, gap = 1, padding = 1 },
                { section = "startup" },
            },
        },
        image = { enabled = true },
        indent = { enabled = true },
        lazygit = { enabled = true },
        picker = { enabled = true },
        notifier = { enabled = true },
        git = { enabled = true },
        quickfile = { enabled = true },
        scope = { enabled = true },
        scroll = { enabled = true },
        scratch = { enabled = true },
        statuscolumn = { enabled = true },
        terminal = { enabled = true },
    },
    keys = {                                                                                                                                                                -- Привязки клавиш
        { "<leader>lg",      function() Snacks.lazygit() end,                                        desc = "[L]azy[G]it" },                                                -- Открыть LazyGit
        { "<leader>un",      function() Snacks.notifier.hide() end,                                  desc = "Dismiss All Notifications" },                                  -- Закрыть все уведомления
        { "<c-/>",           function() Snacks.terminal() end,                                       desc = "Toggle Terminal",                       mode = { "n", "t" } }, -- Переключить терминал
        { "<c-_>",           function() Snacks.terminal() end,                                       desc = "which_key_ignore" },                                           -- Альтернативная клавиша для терминала
        { "]]",              function() Snacks.words.jump(vim.v.count1) end,                         desc = "Next Reference",                        mode = { "n", "t" } }, -- Следующая ссылка
        { "[[",              function() Snacks.words.jump(-vim.v.count1) end,                        desc = "Prev Reference",                        mode = { "n", "t" } }, -- Предыдущая ссылка

        { "\\",              function() Snacks.explorer() end,                                       desc = "File Explorer" },                                              -- Файловый эксплорер
        { "<leader><space>", function() Snacks.picker.smart() end,                                   desc = "Smart Find Files" },                                           -- Умный поиск файлов
        { "<leader>ss",      function() Snacks.picker.buffers() end,                                 desc = "[ ] Find existing buffers" },                                  -- Поиск открытых буферов
        { "<leader>sg",      function() Snacks.picker.grep() end,                                    desc = "[S]earch by [G]rep" },                                         -- Поиск через grep
        { "<leader>sn",      function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "[S]earch [N]eovim files" },                                    -- Поиск файлов конфигурации Neovim
        { "<leader>sf",      function() Snacks.picker.files() end,                                   desc = "[S]earch [F]iles" },                                           -- Поиск файлов
        { "<leader>sp",      function() Snacks.picker.pickers() end,                                 desc = "[S]earch [P]ickers" },                                         -- Поиск пикеров
        { "<leader>s.",      function() Snacks.picker.recent() end,                                  desc = "[S]earch Recent Files ('.' for repeat)" },                     -- Поиск недавних файлов
        { "<leader>sk",      function() Snacks.picker.keymaps() end,                                 desc = "[S]earch [K]eymaps" },                                         -- Поиск горячих клавиш
        { "<leader>sw",      function() Snacks.picker.grep_word() end,                               desc = "[S]earch current [W]ord",               mode = { "n", "x" } }, -- Поиск текущего слова
        { "<leader>sr",      function() Snacks.picker.resume() end,                                  desc = "[S]earch [R]esume" },                                          -- Возобновить предыдущий поиск
        { "<leader>sh",      function() Snacks.picker.help() end,                                    desc = "[S]earch [H]elp" },                                            -- Поиск в справке
        { "<leader>sd",      function() Snacks.picker.diagnostics() end,                             desc = "[S]earch [D]iagnostics" },                                     -- Поиск диагностик
        { "<leader>s/",      function() Snacks.picker.grep_buffers() end,                            desc = "[S]earch [/] in Open Files" },                                 -- Поиск в открытых файлах
        {
            "<leader>/",
            function()
                Snacks.picker.lines({
                    layout = {
                        preset = "select",
                    },
                })
            end,
            desc = "[/] Fuzzily search in current buffer"
        },
    }
}
