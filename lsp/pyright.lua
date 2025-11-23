return {
    cmd = {"pyright-langserver", "--stdio"},
    filetypes = {"python"},
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "off",
                diagnosticMode = "openFilesOnly",
                reportMissingTypeStubs = false,
                reportUnannotatedClassAttribute = false,
            },

        }
    },
    on_attach = function(client, bufnr)
        -- Автоформатирование при сохранении
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format({
                    async = false,
                    filter = function(format_client)
                        -- Форматируем только если LSP поддерживает форматирование
                        return format_client.supports_method("textDocument/formatting")
                    end
                })
            end,
        })
    end
}
