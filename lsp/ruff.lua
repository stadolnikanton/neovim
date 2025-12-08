return {
    cmd = {"ruff-lsp"},
    filetypes = {"python"},
    init_options = {
        settings = {
            select = "ALL",
            ignore = {
                "F401",  -- unused imports
                "F841",  -- unused variables
                "E402",
            },
            lineLength = 79,
        }
    },
    on_attach = function(client, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format({ async = false })
            end,
        })
    end
}
