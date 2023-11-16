local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)

    local bufopts = {buffer = bufnr, remap = false}

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
        "pyright",
        "bashls",
        "lua_ls",
    },
    handlers = {
        lsp_zero.default_setup,
        jdtls = lsp_zero.noop
    }
})

local cmp = require('cmp')
local cmp_mappings = lsp_zero.defaults.cmp_mappings({})

-- disable completion with tab
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

-- disable Enter to confirm
cmp_mappings['<CR>'] = nil

cmp.setup({
    sources={
        {name='nvim_lsp'},
        {name='nvim_lua'},
        {name='path'},
    },
    formatting = lsp_zero.cmp_format(),
    mapping = cmp_mappings,
    preselect = cmp.PreselectMode.None
})

-- lsp_zero.nvim_workspace()
