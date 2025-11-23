return {
    cmd = {"ruff-lsp"},
    filetypes = {"python"},
    settings = {
        ignore = {
        "F4",
        "E2",
        "E3",
        "E1",
        "W",
        "C9",
        "B",
      },
        fixAll = true,
        organizeImports = true,
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
