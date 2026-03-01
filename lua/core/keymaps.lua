-- Установка пробела как лидера
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local shortcut = vim.keymap.set

-- Быстрое сохранение файла
shortcut('n', '<leader>s', ':w<cr>', { desc = 'Save' })

-- Быстрое закрытие окна
shortcut('n', '<leader>q', ':q<cr>', { desc = 'Exit without save' })

-- Открытие/Закрытие файлового дерева
shortcut('n', '<leader>e', ':NvimTreeToggle<cr>', { desc = '[E]xplorer toggle' })

-- ===== LSP ДОКУМЕНТАЦИЯ =====
-- Hover (документация под курсором)
shortcut('n', 'K', vim.lsp.buf.hover, { desc = '📖 Документация' })

-- Signature help (параметры функции)
shortcut('n', '<leader>K', vim.lsp.buf.signature_help, { desc = '📝 Параметры' })

-- Переходы
shortcut('n', 'gd', vim.lsp.buf.definition, { desc = '🔍 К определению' })
shortcut('n', 'gr', vim.lsp.buf.references, { desc = '🔎 Использования' })
shortcut('n', 'gD', vim.lsp.buf.declaration, { desc = '📜 К объявлению' })
shortcut('n', 'gi', vim.lsp.buf.implementation, { desc = '⚙️ К реализации' })
shortcut('n', 'gt', vim.lsp.buf.type_definition, { desc = '🏷️ К типу' })

-- Переименовать
shortcut('n', '<leader>rn', vim.lsp.buf.rename, { desc = '✏️ Переименовать' })

-- Диагностки
shortcut('n', '<leader>ca', vim.lsp.buf.code_action, { desc = '💡 Исправить' })
shortcut('n', '[d', vim.diagnostic.goto_prev, { desc = '⬆️ Пред. ошибка' })
shortcut('n', ']d', vim.diagnostic.goto_next, { desc = '⬇️ След. ошибка' })
shortcut('n', '<leader>d', vim.diagnostic.open_float, { desc = '❗ Ошибки строки' })

-- Навигация между окнами
local function setup_window_navigation()
    local opts = { noremap = true, silent = true }


    -- Основные комбинации
    shortcut('n', '<leader>h', '<C-w>h', opts)
    shortcut('n', '<leader>j', '<C-w>j', opts)
    shortcut('n', '<leader>k', '<C-w>k', opts)
    shortcut('n', '<leader>l', '<C-w>l', opts)


    -- Дополнительные удобства
    shortcut('n', '<leader>H', '<C-w>H', opts) -- Переместить окно влево
    shortcut('n', '<leader>J', '<C-w>J', opts) -- Переместить окно вниз
    shortcut('n', '<leader>K', '<C-w>K', opts) -- Переместить окно вверх
    shortcut('n', '<leader>L', '<C-w>L', opts) -- Переместить окно вправо
end


setup_window_navigation()
