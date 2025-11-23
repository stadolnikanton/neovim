vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = {"*.jinja", "*.jinja2", "*.j2"},
  callback = function() vim.bo.filetype = "jinja" end
})

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = "*.html",
  callback = function()
    -- Если в Django проекте, форсируем htmldjango
    if string.find(vim.fn.getcwd(), 'django') or string.find(vim.fn.getcwd(), 'drf') then
      vim.bo.filetype = "htmldjango"
    end
  end
})
