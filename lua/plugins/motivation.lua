return {
    "zemafaz/motivation.nvim",
    config = function()
        require("motivation").setup({
            file = os.getenv("HOME") .. "/Private/Notes/motivation.txt"
        })
        vim.keymap.set("n", "<leader>im", "<cmd>InspireMe<cr>", { silent = true })
    end
}
