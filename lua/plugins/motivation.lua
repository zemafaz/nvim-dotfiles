return {
    "zemafaz/motivation.nvim",
    -- dir = "/home/ctw03319/Private/Projects/motivation.nvim",
    config = function()
        require("motivation").setup({
            file = os.getenv("HOME") .. "/.motivation.txt",
            oneline = false,
        })
        vim.keymap.set("n", "<leader>im", "<cmd>InspireMe<cr>", { silent = true })
    end
}
