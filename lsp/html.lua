return {
  cmd = {'vscode-html-language-server', '--stdio'},
  filetypes = {'html', 'jinja', 'jinja2', 'htmldjango'},  -- добавил htmldjango
  settings = {
    html = {
      validate = true,
      autoclosingTags = true,
      format = { enable = true }
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
