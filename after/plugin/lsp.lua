local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    local bufopts = { buffer = bufnr, remap = false }

    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
    vim.keymap.set('i', "<C-h>", function() vim.lsp.buf.signature_help() end, bufopts)

    vim.keymap.set('n', '<space>ef', vim.diagnostic.open_float, bufopts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, bufopts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, bufopts)
    vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, bufopts)
end)

require("mason").setup({})
require("mason-lspconfig").setup({
    ensure_installed = {
        "pylsp",
        "bashls",
        "lua_ls",
    },
    handlers = {
        lsp_zero.default_setup,
        jdtls = lsp_zero.noop,
        lua_ls = function()
            require('lspconfig').lua_ls.setup({
                on_init = function(client)
                    local path = client.workspace_folders[1].name
                    if not vim.loop.fs_stat(path .. '/.luarc.json') and not vim.loop.fs_stat(path .. '/.luarc.jsonc') then
                        client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
                            Lua = {
                                runtime = {
                                    -- Tell the language server which version of Lua you're using
                                    -- (most likely LuaJIT in the case of Neovim)
                                    version = 'LuaJIT'
                                },
                                -- Make the server aware of Neovim runtime files
                                workspace = {
                                    checkThirdParty = false,
                                    library = {
                                        vim.env.VIMRUNTIME
                                        -- "${3rd}/luv/library"
                                        -- "${3rd}/busted/library",
                                    }
                                    -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                                    -- library = vim.api.nvim_get_runtime_file("", true)
                                }
                            }
                        })

                        client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
                    end
                    return true
                end
            })
        end,
        pylsp = function ()

            local opts = {
                settings = {
                    pylsp = {
                        plugins = {
                            pycodestyle = {
                                enabled = true,
                                maxLineLength = 140
                            },
                            jedi = {
                                extra_paths = {}
                            }
                        }
                    }
                }
            }

            -- Changing settings per project
            local workspace_path = vim.fn.getcwd()
            local onegpm_path = os.getenv("ONEGPM_WORKSPACE")
            if workspace_path == onegpm_path then
                opts.settings.pylsp.plugins.jedi.extra_paths = {onegpm_path .. "/assets/libraries/onegpm_common_lib"}
            end

            require("lspconfig").pylsp.setup(opts)
        end
    }
})
--
-- Terraform
vim.api.nvim_create_autocmd({"BufWritePre"}, {
  pattern = {"*.tf", "*.tfvars"},
  callback = function()
    vim.lsp.buf.format()
  end,
})

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = {"*.tfvars"},
  callback = function()
    vim.cmd("set filetype=terraform")
  end,
})



local cmp = require('cmp')
local cmp_mappings = lsp_zero.defaults.cmp_mappings({})

-- disable completion with tab
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

-- disable Enter to confirm
cmp_mappings['<CR>'] = nil

-- SQL completions
cmp.setup.filetype({'sql', 'mysql', 'plsql'}, {
    sources={
        {name='vim-dadbod-completion'},
    },
    formatting = lsp_zero.cmp_format(),
    mapping = cmp_mappings,
    preselect = cmp.PreselectMode.None
})

cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'path' },
    },
    formatting = lsp_zero.cmp_format(),
    mapping = cmp_mappings,
    preselect = cmp.PreselectMode.None
})

-- lsp_zero.nvim_workspace()
