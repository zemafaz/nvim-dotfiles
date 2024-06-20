return {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
        { "github/copilot.vim" },
        { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    keys = {
        {
            "<leader>cc",
            function()
                local chat = require("CopilotChat")
                chat.toggle({
                    layout = "replace"
                })
            end,
            mode = "n"
        },
    },
    opts = {
        debug = true
    }
}
