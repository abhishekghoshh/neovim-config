return {
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio"
    },
    config = function()
      require("dapui").setup()
    end
  },
  {
    "mfussenegger/nvim-dap",
    dependency = {
      "rcarriga/nvim-dap-ui"
    },
    init = function()

    end,
    config = function()
      local dap, dapui = require("dap"), require("dapui")
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end

      vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = 'Add breakpoint at line' })
      vim.keymap.set('n', '<leader>dn', '<cmd>DapStepOver<CR>', { desc = 'Go to the next line' })
      vim.keymap.set('n', '<leader>dc', dap.continue, { desc = 'For continuing the flow/go to the next debug point' })
      vim.keymap.set('n', '<leader>dui',
        function()
          local widgets = require('dap.ui.widgets')
          local sidebar = widgets.sidebar(widgets.scopes)
          sidebar.open()
        end,
        { desc = 'Open debugging sidebar' }
      )

      local filename = vim.fn.expand("%:p")
      dap.configurations.java = {
        {
          type = 'java',
          request = 'launch',
          name = "Launch",
          program = filename,
          cwd = '${workspaceFolder}',
          stopOnEntry = false,
          preLaunchTask = "",
          sourceLanguages = { "java" },
          externalConsole = false,
          internalConsoleOptions = "neverOpen",
          rootPath = "${workspaceFolder}",
          classPaths = {},
          libs = {},
          javaHome = "/usr/lib/jvm/java-1.21.0-openjdk-arm64/",
          vmArgs = "-Xmx1024M",
          delegate = {
            port = 5005,
            host = "localhost",
            transport = "socket",
            rootPath = "${workspaceFolder}"
          },
          filters = {}
        }
      }
    end
  }
}
