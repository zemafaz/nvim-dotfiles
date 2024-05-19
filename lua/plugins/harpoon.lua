return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    requires = {
        "nvim-lua/plenary.nvim",
    },
    keys = {
        { "<leader>a", function() require("harpoon"):list():add() end,                                    mode = "n" },
        { "<C-e>",     function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, mode = "n" },
        { "<M-1>",     function() require("harpoon"):list():select(1) end,                                mode = "n" },
        { "<M-2>",     function() require("harpoon"):list():select(2) end,                                mode = "n" },
        { "<M-3>",     function() require("harpoon"):list():select(3) end,                                mode = "n" },
        { "<M-4>",     function() require("harpoon"):list():select(4) end,                                mode = "n" },
        { "<M-5>",     function() require("harpoon"):list():select(5) end,                                mode = "n" },
        { "<M-6>",     function() require("harpoon"):list():select(6) end,                                mode = "n" },
        { "<M-7>",     function() require("harpoon"):list():select(7) end,                                mode = "n" },
        { "<M-8>",     function() require("harpoon"):list():select(8) end,                                mode = "n" },
        { "<M-9>",     function() require("harpoon"):list():select(9) end,                                mode = "n" },
        { "<M-0>",     function() require("harpoon"):list():select(0) end,                                mode = "n" },
    },
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup()
    end
}
