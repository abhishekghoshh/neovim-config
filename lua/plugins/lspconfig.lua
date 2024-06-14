return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup({
        auto_install = true,
        ensure_installed = {
          "lua-language-server",
          "stylua",
          "css-lsp",
          "html-lsp",
          "typescript-language-server",
          "deno",
          "prettier",
          "clangd",
          "clang-format",
          "pyre",
          "gopls",
          "rust-analyzer",
          "java-test",
          "java-debug-adapter",
        },
        indent = {
          enable = true,
        },
      })
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
      ensure_installed = {
        "lua_ls",
        "tsserver",
        "jdtls",
      },
      indent = { enable = true, },
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
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

      local lspconfig = require("lspconfig")
      local lsp_config_util = require("utils.lspconfig")

      -- on attach function
      local on_attach = lsp_config_util.on_attach
      -- capabilities function
      local capabilities = lsp_config_util.capabilities

      -- lua ls setup
      lspconfig.lua_ls.setup {
        on_attach = on_attach,
        capabilities = capabilities,
      }
      lspconfig.gopls.setup {
        -- In your nvim-lspconfig configuration
        on_attach = function(client, bufnr)
          --- Auto commands before writing
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
              --- auto format on save
              vim.lsp.buf.format({ bufnr = bufnr })
              --- Auto import on save
              local params = vim.lsp.util.make_range_params(nil, "utf-16")
              params.context = { only = { "source.organizeImports" } }
              local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
              for _, res in pairs(result or {}) do
                for _, r in pairs(res.result or {}) do
                  if r.edit then
                    vim.lsp.util.apply_workspace_edit(r.edit, "utf-16")
                  else
                    vim.lsp.buf.execute_command(r.command)
                  end
                end
              end
            end,
          })
        end,
        capabilities = capabilities,
        cmd = { "gopls" },
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
        settings = {
          gopls = {
            completeUnimported = true,
            usePlaceholders = true,
            analyses = {
              unusedparams = true,
            },
            staticcheck = true, -- Enable staticcheck analysis
            gofumpt = true,     -- Enable gofmt formatting (optional)
          },
        },
      }
    end,
  }
}
