return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "leoluz/nvim-dap-go",
    "nvim-neotest/nvim-nio"
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    require("dapui").setup()
    require("dap-go").setup()

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

    vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, {})
    vim.keymap.set("n", "<Leader>dc", dap.continue, {})

    vim.keymap.set("n", "<F5>", dap.continue, { desc = "DAP Continue" })
    vim.keymap.set("n", "<F10>", dap.step_over, { desc = "DAP Step Over" })
    vim.keymap.set("n", "<F11>", dap.step_into, { desc = "DAP Step Into" })
    vim.keymap.set("n", "<F12>", dap.step_out, { desc = "DAP Step Out" })
    vim.keymap.set("n", "<Leader>b", dap.toggle_breakpoint, { desc = "DAP Toggle Breakpoint" })
    vim.keymap.set("n", "<Leader>B", function()
      dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
    end, { desc = "DAP Set Conditional Breakpoint" })
    vim.keymap.set("n", "<Leader>dr", dap.repl.open, { desc = "DAP REPL Open" })
    vim.keymap.set("n", "<Leader>dl", dap.run_last, { desc = "DAP Run Last" })

  end,
}