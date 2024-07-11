local lspconfig = {}

-- lsp config on attach function
lspconfig.on_attach = function(client, bufnr)
  -- put all the lsp config on attach config here
  -- code actions
  vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
  vim.keymap.set("n", "<leader>K", vim.lsp.buf.hover, {})
  vim.keymap.set("n", "<leader>fmt", function() vim.lsp.buf.format({ async = true }) end,
    { noremap = true, desc = "LSP formatting" })
  vim.keymap.set("n", "<leader>gD", function() vim.lsp.buf.declaration() end, { desc = "LSP declaration" })
  vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "LSP definition" })
  vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "LSP references" })
  vim.keymap.set("n", "<leader>gi", function() vim.lsp.buf.implementation() end, { desc = "LSP implementation" })
  vim.keymap.set("n", "<leader>ls", function() vim.lsp.buf.signature_help() end, { desc = "LSP signature help" })
  vim.keymap.set("n", "<leader>D", function() vim.lsp.buf.type_definition() end, { desc = "LSP definition type" })

  -- code diagnostics
  vim.keymap.set("n", "<leader>lf", function() vim.diagnostic.open_float { border = "rounded" } end,
    { desc = "Floating diagnostic" })
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev({ float = { border = "rounded" } }) end,
    { desc = "Goto prev" })
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next({ float = { border = "rounded" } }) end,
    { desc = "Goto next" })
  vim.keymap.set("n", "<leader>q", function() vim.diagnostic.setloclist() end, { desc = "Diagnostic setloclist" })

  -- workspace related
  vim.keymap.set("n", "<leader>wa", function() vim.lsp.buf.add_workspace_folder() end,
    { desc = "Add workspace folder" })
  vim.keymap.set("n", "<leader>wr", function() vim.lsp.buf.remove_workspace_folder() end,
    { desc = "Remove workspace folder" })
  vim.keymap.set("n", "<leader>wl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
    { desc = "List workspace folders" })


  vim.api.nvim_set_keymap('i', '<C-Space>', 'pumvisible() ? "<C-n>" : "<C-x><C-o>"', { expr = true, noremap = true })
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
  ]] --
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
