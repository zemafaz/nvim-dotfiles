return {
    "github/copilot.vim",
    branch = "release",
    keys = {
        { "<leader>cp", "<cmd>Copilot enable<cr>", mode = "n" },
        { "<leader>cd", "<cmd>Copilot disable<cr>", mode = "n" },
    },
    config = function()
        vim.g.copilot_enabled = false
    end
}
