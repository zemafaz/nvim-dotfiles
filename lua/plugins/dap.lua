return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",
        'williamboman/mason.nvim',
    },
    keys = {
        { "<F5>",       function() require("dap").continue() end,                                                    mode = "n" },
        { "<F9>",       function() require("dap").terminate() end,                                                   mode = "n" },
        { "<F10>",      function() require("dap").step_over() end,                                                   mode = "n" },
        { "<F11>",      function() require("dap").step_into() end,                                                   mode = "n" },
        { "<F12>",      function() require("dap").step_out() end,                                                    mode = "n" },
        { "<Leader>b",  function() require("dap").toggle_breakpoint() end,                                           mode = "n" },
        { "<Leader>B",  function() require("dap").set_breakpoint() end,                                              mode = "n" },
        { "<Leader>lp", function() require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end, mode = "n" },
        { "<Leader>dr", function() require("dap").repl.open() end,                                                   mode = "n" },
        { "<Leader>dl", function() require("dap").run_last() end,                                                    mode = "n" },
        { "<Leader>dh", function() require("dap.ui.widgets").hover() end,                                            mode = { "n", "v" } },
        { "<Leader>dp", function() require("dap.ui.widgets").preview() end,                                          mode = { "n", "v" } },
        {
            "<Leader>df",
            function()
                local widgets = require("dap.ui.widgets")
                widgets.centered_float(widgets.frames)
            end,
            mode = "n"
        },
        {
            "<Leader>ds",
            function()
                local widgets = require("dap.ui.widgets")
                widgets.centered_float(widgets.scopes)
            end,
            mode = "n"
        },

    },
    config = function()
        -- DAP-UI
        require("dapui").setup()
        local dap, dapui = require("dap"), require("dapui")
        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
        end

        -- Javascript/Typescript (Node)
        require("dap").adapters["pwa-node"] = {
            type = "server",
            host = "localhost",
            port = "${port}",
            executable = {
                command = os.getenv("HOME") .. "/.local/share/nvim/mason/bin/js-debug-adapter",
                args = { "${port}" }
            }
        }

        require("dap").configurations.javascript = {
            {
                type = "pwa-node",
                request = "launch",
                name = "Launch file",
                program = "${file}",
                cwd = "${workspaceFolder}",
            },
        }

        require("dap").configurations.typescript = {
            {
                type = "pwa-node",
                request = "launch",
                name = "Launch file",
                program = "${file}",
                cwd = "${workspaceFolder}",
                runtimeExecutable = "ts-node",
            },
        }

        -- Python
        require("dap").adapters.python = function(cb, config)
            if config.request == 'attach' then
                ---@diagnostic disable-next-line: undefined-field
                local port = (config.connect or config).port
                ---@diagnostic disable-next-line: undefined-field
                local host = (config.connect or config).host or '127.0.0.1'
                cb({
                    type = 'server',
                    port = assert(port, '`connect.port` is required for a python `attach` configuration'),
                    host = host,
                    options = {
                        source_filetype = 'python',
                    },
                })
            else
                cb({
                    type = 'executable',
                    command = os.getenv("HOME") .. '/.local/share/nvim/mason/packages/debugpy/debugpy-adapter',
                    args = {},
                    options = {
                        source_filetype = 'python',
                    },
                })
            end
        end

        require("dap").configurations.python = {
            {
                -- The first three options are required by nvim-dap
                type = 'python', -- the type here established the link to the adapter definition: `dap.adapters.python`
                request = 'launch',
                name = "Launch file",

                -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

                program = "${file}", -- This configuration will launch the current file if used.
                pythonPath = function()
                    -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
                    -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
                    -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
                    local cwd = vim.fn.getcwd()
                    if vim.fn.executable(cwd .. '/venv/bin/python3') == 1 then
                        return cwd .. '/venv/bin/python3'
                    elseif vim.fn.executable(cwd .. '/.venv/bin/python3') == 1 then
                        return cwd .. '/.venv/bin/python3'
                    else
                        return '/usr/bin/python3'
                    end
                end,
            },
            {
                type = "python",
                request = "attach",
                name = "Launch remote (docker)",
                connect = {
                    port = 5678
                },
            },
        }
    end
}
