vim.o.wrap = true

local function nnoremap(lhs, rhs, opts)
	opts = vim.tbl_extend("force",
			{noremap=true},
            opts or {}
	)
	vim.keymap.set("n", lhs, rhs, opts)
end

nnoremap("<leader>p", "<cmd>PasteImg<cr>")
