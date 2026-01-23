-- Настройки редактора
require('core.options')
require('core.keymaps')
require('core.autocmd')

-- LSP
require('core.lsp')

-- Менеджер плагинов
require('config.lazy')


-- Плагины
require('plugins.mason')
require('plugins.colorscheme')
require('plugins.tree')
require('plugins.treesitter')
require('plugins.conform')
require('plugins.emmet')
require('plugins.snacks')
require('plugins.lualine')
require('plugins.noice')
require('plugins.icons')
require('plugins.auto-indent')
require('plugins.auto-pairs')

require('plugins.blink')