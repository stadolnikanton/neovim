return {
    "nmac427/guess-indent.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
        exclude_filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    }
}
