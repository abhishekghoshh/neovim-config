local lspconfig = {}

-- lsp config on attach function
lspconfig.on_attach = function(client, bufnr)
  -- put all the lsp config on attach config here
end

-- lsp config capabilities function
lspconfig.capabilities = vim.lsp.protocol.make_client_capabilities()
lspconfig.capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}


return lspconfig
