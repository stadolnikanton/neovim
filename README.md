# 📋 NVIM ШПАРГАЛКА

## 📦 УСТАНОВКА:

### macOS:
```bash
# Через Homebrew
brew install neovim

# Проверка версии
nvim --version
```

### Debian/Ubuntu:
```bash
# Обновить репозитории
sudo apt update

# Установить Neovim
sudo apt install -y neovim

# Проверка версии
nvim --version
```

### Установка конфига:
```bash
# Клонируйте конфиг в ~/.config/nvim
git clone https://github.com/stadolnikanton/neovim.git ~/.config/nvim

# Запустите Neovim для установки плагинов
nvim
```

---

## 📋 ТРЕБОВАНИЯ И ЗАВИСИМОСТИ:

### Минимальные требования:
- **Neovim** ≥ 0.9.0
- **git** — для клонирования и LazyGit
- **Node.js** ≥ 18 — для некоторых плагинов

### Зависимости для языков:

#### Python:
```bash
# macOS
brew install python3

# Debian/Ubuntu
sudo apt install -y python3 python3-pip
```

#### JavaScript/TypeScript:
```bash
# macOS
brew install node

# Debian/Ubuntu
sudo apt install -y nodejs npm
```

#### C/C++:
```bash
# macOS
brew install llvm

# Debian/Ubuntu
sudo apt install -y clangd
```

#### Go:
```bash
# macOS
brew install go

# Debian/Ubuntu
sudo apt install -y golang-go
```

#### Lua:
```bash
# macOS
brew install lua

# Debian/Ubuntu
sudo apt install -y lua5.4
```

### Установка Node.js (рекомендуется):
```bash
# macOS
brew install node

# Debian/Ubuntu
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs
```

---

## 🎯 Настроенные языки:

| Язык | LSP | Форматтер | Статус |
|------|-----|-----------|--------|
| Python | pyright | black, isort | ✅ |
| JavaScript | ts_ls | prettier | ✅ |
| TypeScript | ts_ls | prettier | ✅ |
| C/C++ | clangd | - | ✅ |
| Go | gopls | gofumpt | ✅ |
| Lua | lua_ls | stylua | ✅ |
| HTML | html | prettier | ✅ |
| CSS | cssls | prettier | ✅ |
| JSON | jsonls | prettier | ✅ |
| SQL | sqlls | - | ✅ |

---

## ⌨️ HOTKEYS:

### 📖 Документация (LSP):
```
K         - Показать документацию (hover)
<leader>K - Параметры функции (signature help)
gd        - Перейти к определению
gr        - Найти все использования
gD        - Перейти к объявлению
gi        - Перейти к реализации
gt        - Перейти к типу
```

### Файлы и поиск:
```
<leader>ff  - Найти файл
<leader>fg  - Grep поиск
<leader>fb  - Буферы
<leader>fh  - Справка
<leader>fs  - LSP символы
<leader>/   - Поиск в текущем файле
```

### Редактирование:
```
<leader>rn  - Переименовать символ
<leader>ca  - Code action (исправить/улучшить)
[d        - Предыдущая ошибка
]d        - Следующая ошибка
<leader>d  - Показать диагностику строки
```

### Терминал:
```
<C-/>     - Переключить терминал
<C-_>     - Альтернатива
```

### Навигация:
```
]]        - Следующая ссылка
[[        - Предыдущая ссылка
```

### Git:
```
<leader>lg - LazyGit
```

### Уведомления:
```
<leader>un - Скрыть уведомления
```

---

## 🚀 КОМАНДЫ:

```vim
:Mason              - Менеджер LSP
:ConformInfo        - Информация о форматтере
:LspInfo            - Информация о LSP
:Lazy               - Менеджер плагинов
:Telescope          - Поиск
```

---

## 📦 ПЛАГИНЫ:

| Плагин | Зачем |
|--------|-------|
| blink.cmp | Автодополнение |
| conform.nvim | Форматирование |
| telescope.nvim | Поиск файлов |
| which-key.nvim | Подсказки хоткеев |
| snacks.nvim | Git, уведомления, explorer |
| lualine.nvim | Статусная строка |
| nvim-tree.lua | Файловое дерево |
| treesitter | Подсветка синтаксиса |
| mini.pairs | Авто-скобки |
| guess-indent | Авто-отступы |

---

## 🔧 УСТАНОВКА LSP:

```vim
:MasonInstall <package>
```

Доступные:
- pyright (Python)
- clangd (C/C++)
- gopls (Go)
- typescript-language-server (JS/TS)
- lua_ls (Lua)
- html (HTML)
- cssls (CSS)
- jsonls (JSON)
- sqlls (SQL)

---

## 🎨 ТЕМА:

Gruvbox Dark - вся система в одном стиле.

---

## ⚙️ ОПТИМИЗАЦИЯ:

- Отключена автопроверка обновлений
- Отключена change detection
- Минимальные разделители в lualine
- Убраны лишние плагины (codeium, noice, emmet)

---

## 🐛 ЕСЛИ ЧТО-ТО НЕ РАБОТАЕТ:

```bash
# Перезапустить nvim
nvim -u NONE  # Без конфига
nvim          # С конфигом

# Переустановить плагины
:Lazy sync

# Переустановить LSP
:MasonInstall <package>
:MasonUninstall <package>
:MasonInstall <package>

# Проверить LSP
:LspInfo
```

---

## 📁 СТРУКТУРА:

```
~/.config/nvim/
├── init.lua          # Главный конфиг
├── lazy-lock.json    # Версии плагинов
├── lua/
│   ├── core/
│   │   ├── options.lua
│   │   ├── keymaps.lua
│   │   ├── lsp.lua
│   │   └── autocmd.lua
│   ├── config/
│   │   └── lazy.lua
│   └── plugins/
│       ├── mason.lua
│       ├── telescope.lua
│       ├── which-key.lua
│       ├── snacks.lua
│       ├── conform.lua
│       ├── lualine.lua
│       └── ...
```
