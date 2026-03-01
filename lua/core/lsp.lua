-- Включаем LSP серверы
vim.lsp.enable({
    "lua_ls",
    "pyright",
    "ts_ls",
    "clangd",
    "gopls",
    "html",
    "cssls",
    "jsonls",
    "sqlls",
})

-- Настройка диагностик (минимализм + информативность)
vim.diagnostic.config({
    virtual_text = {
        severity = {
            min = vim.diagnostic.severity.WARN,
        },
        prefix = "●",
        source = "if_many",  -- Показывать только если много проблем
    },
    virtual_lines = false,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.INFO] = "",
            [vim.diagnostic.severity.HINT] = "",
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
            [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
            [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
            [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
        },
    },
})

-- Улучшенные границы для LSP окон
local _border = "rounded"

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover, {
        border = _border
    }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
    vim.lsp.handlers.signature_help, {
        border = _border
    }
)

vim.diagnostic.open_float = function(opts)
    opts = opts or {}
    opts.border = opts.border or _border
    return vim.diagnostic.open_float(opts)
end

-- Настройка LSP для конкретных языков (загружается после установки плагинов)
local ok, lspconfig = pcall(require, 'lspconfig')
if not ok then
    return
end

-- Python (pyright)
lspconfig.pyright.setup({
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "basic",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = 'openFilesOnly',
            },
        },
    },
})

-- TypeScript/JavaScript (ts_ls)
lspconfig.ts_ls.setup({
    settings = {
        typescript = {
            inlayHints = {
                includeInlayParameterNameHints = "none",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = false,
                includeInlayVariableTypeHints = false,
                includeInlayPropertyDeclarationTypeHints = false,
                includeInlayFunctionLikeReturnTypeHints = false,
                includeInlayEnumMemberValueHints = false,
            },
        },
        javascript = {
            inlayHints = {
                includeInlayParameterNameHints = "none",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayVariableTypeHints = false,
                includeInlayFunctionLikeReturnTypeHints = false,
            },
        },
    },
})

-- C/C++ (clangd)
lspconfig.clangd.setup({
    cmd = { "/opt/homebrew/opt/llvm/bin/clangd" },
    capabilities = {
        offsetEncoding = "utf-8",
    },
})

-- Go (gopls)
lspconfig.gopls.setup({
    settings = {
        gopls = {
            gofumpt = true,
            usePlaceholders = true,
            staticcheck = true,
            semanticTokens = true,
        },
    },
})

-- Lua
lspconfig.lua_ls.setup({
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
            telemetry = {
                enable = false,
            },
        },
    },
})

-- HTML
lspconfig.html.setup({
    filetypes = { "html", "templ", "gohtml" },
})

-- CSS
lspconfig.cssls.setup({})

-- JSON
lspconfig.jsonls.setup({})

-- SQL
lspconfig.sqlls.setup({})
