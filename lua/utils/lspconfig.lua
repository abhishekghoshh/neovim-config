local lspconfig = {}

-- lsp config on attach function
lspconfig.on_attach = function(client, bufnr)
  -- put all the lsp config on attach config here
end

-- lsp config capabilities function
-- lspconfig.capabilities = vim.lsp.protocol.make_client_capabilities()
lspconfig.capabilities = require('cmp_nvim_lsp').default_capabilities()
lspconfig.capabilities.textDocument.completion = {
  dynamicRegistration = true,
  --[[
  completionItemKind = {
    'Text',
    'Method',
    'Function',
    'Constructor',
    'Field',
    'Variable',
    'Class',
    'Interface',
    'Module',
    'Property',
    'Unit',
    'Value',
    'Constant',
    'Enum',
    'EnumMember',
    'Keyword',
    'Snippet',
    'Color',
    'File',
    'Reference',
    'Folder',
    'EnumMember',
    'Function',
    'Method',
  },
  ]]--
  completionItem = {
    labelDetails = {
      detail = {
        'Hover',
        'Rename',
      },
    },
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
}


return lspconfig
