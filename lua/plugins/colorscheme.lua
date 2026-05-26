return {
    {
        "rebelot/kanagawa.nvim",
        priority = 1000,
        config = function()
            require("kanagawa").setup({
                theme = "dragon",   -- Переключаем на строгую нуарную тему
                background = { dark = "dragon" },
                transparent = true, -- Включаем полную прозрачность нативного бэкграунда

                -- Тонкая подстройка элементов интерфейса, чтобы они не были цветными
                overrides = function(colors)
                    local theme = colors.theme
                    return {
                        -- Делаем границы сплитов тонкими и графитовыми
                        WinSeparator = { fg = "#5A5A5A", bg = "NONE" },
                        -- Убираем цветной фон у плавающих окон и подсказок
                        NormalFloat = { bg = "none" },
                        FloatBorder = { fg = "#5A5A5A", bg = "none" },

                        -- Полностью прозрачный LineNr (номера строк) без выделяющегося фона
                        LineNr = { bg = "none" },
                        CursorLineNr = { fg = "#B0B8C0", bold = true, bg = "none" },
                    }
                end,
            })

            -- Загружаем именно dragon-версию
            vim.cmd.colorscheme "kanagawa-dragon"

            -- Твои кастомные монохромные хайлайты для netrw (сохранены полностью)
            vim.api.nvim_set_hl(0, "netrwDir", { fg = "#B0B8C0" })
            vim.api.nvim_set_hl(0, "netrwClassify", { fg = "#5A5A5A" })
            vim.api.nvim_set_hl(0, "netrwLink", { fg = "#8A8A8A" })
            vim.api.nvim_set_hl(0, "netrwSymLink", { fg = "#8A8A8A" })
            vim.api.nvim_set_hl(0, "netrwExe", { fg = "#E8E8E8", bold = true })
            vim.api.nvim_set_hl(0, "netrwComment", { fg = "#3A3A3A", italic = true })
            vim.api.nvim_set_hl(0, "netrwList", { fg = "#5A5A5A" })
        end
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        opts = {
            options = {
                -- Автоматически подстроит lualine под тему kanagawa-dragon
                theme = "kanagawa",
                -- Делаем строку lualine плоской и прозрачной, без эффекта «выреза»
                component_separators = { left = '│', right = '│' },
                section_separators = { left = '', right = '' },
            }
        }
    },
}
