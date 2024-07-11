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
          "delve", "gotests", "golangci-lint", "gofumpt", "goimports", "golangci-lint-langserver", "impl", "gomodifytags",
          "iferr", "gotestsum",
          "rust-analyzer",
          "java-test", "java-debug-adapter",
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
      local lspconfig = require("lspconfig")
      local lsp_config_util = require("utils.lsp-config")

      -- on attach function
      local on_attach = lsp_config_util.on_attach
      -- capabilities function
      local capabilities = lsp_config_util.capabilities

      -- lua ls setup
      lspconfig.lua_ls.setup {
        on_attach = on_attach,
        capabilities = capabilities,
      }


      local go_custom_on_attach = function(client, bufnr)
        on_attach(client, bufnr)
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
      end

      -- golang lsp setup
      lspconfig.gopls.setup {
        -- In your nvim-lspconfig configuration
        on_attach = go_custom_on_attach,
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
