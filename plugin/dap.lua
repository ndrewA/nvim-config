local dap = require('dap')
local dap_project_config = require'user.utils.dap_project_config'

dap.adapters.codelldb = {
    type = 'server',
    port = "${port}",
    executable = {
        command = 'C:/tools/codelldb-x86_64-windows/extension/adapter/codelldb.exe',
        args = {"--port", "${port}"},
            detached = false,
    }
}

dap.configurations.cpp = {
    {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
            local executable_path = dap_project_config.find_executable()
            if not executable_path then
                executable_path = vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end
            return executable_path
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
    },
}

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap('n', '<leader>ds', ':lua require("dap").continue(); require("dapui").open()<CR>', opts) -- start
keymap('n', '<leader>dq', ':lua require("dap").close(); require("dapui").close()<CR>', opts) -- stop
keymap('n', '<leader>dr', ':lua require("dap").restart()<CR>', opts) -- restart

keymap('n', '<leader>dn', ':lua require("dap").step_over()<CR>', opts) -- step over
keymap('n', '<leader>di', ':lua require("dap").step_into()<CR>', opts) -- step into
keymap('n', '<leader>do', ':lua require("dap").step_out()<CR>', opts) -- step out

keymap('n', '<leader>db', ':lua require("dap").toggle_breakpoint()<CR>', opts) -- toggle breakpoint
keymap('n', '<leader>dX', ':lua require("dap").clear_breakpoints()<CR>', opts) -- clear breakpoints
keymap('n', '<leader>dc', ':lua require("dap").continue()<CR>', opts) -- go to next breakpoint
