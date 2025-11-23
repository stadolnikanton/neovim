return {
  cmd = {'vscode-html-language-server', '--stdio'},
  filetypes = {'html'},
  settings = {
    html = {
      validate = true,
      autoClosingTags = true
    }
  }
}
