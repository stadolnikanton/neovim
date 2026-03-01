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
require('plugins.snacks')
require('plugins.lualine')
require('plugins.icons')
require('plugins.auto-indent')
require('plugins.auto-pairs')
require('plugins.blink')
require('plugins.telescope')
require('plugins.which-key')