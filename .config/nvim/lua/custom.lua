vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if not client then
			return
		end

		if
			vim.bo.filetype == "lua"
			or vim.bo.filetype == "rust"
			or vim.bo.filetype == "go"
			or vim.bo.filetype == "zig"
		then
			vim.api.nvim_create_autocmd("BufWritePre", {
				buffer = args.buf,
				callback = function()
					-- vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
					require("conform").format({ bufnr = args.buf })
				end,
			})
		end
	end,
})

-- Copilot settings
vim.api.nvim_create_autocmd("User", {
	pattern = "BlinkCmpMenuOpen",
	callback = function()
		vim.b.copilot_suggestion_hidden = true
	end,
})

vim.api.nvim_create_autocmd("User", {
	pattern = "BlinkCmpMenuClose",
	callback = function()
		vim.b.copilot_suggestion_hidden = false
	end,
})
