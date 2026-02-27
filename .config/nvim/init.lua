require("config.lazy")

require("mappings")
require("custom")

vim.diagnostic.config({
	virtual_text = true, -- show inline messages
	signs = true, -- show signs in the gutter
	underline = true, -- underline problematic text
	update_in_insert = false, -- don't update diagnostics while typing
	severity_sort = true, -- sort diagnostics by severity
})

-- vim.lsp.on_attach(function(client, bufnr)
-- 	local opts = {buffer = bufnr, remap = false}
-- 	vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
--
-- end)
-- vim.lsp.setup()

vim.cmd.colorscheme("catppuccin")

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.colorcolumn = "120"

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true

vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 8
vim.opt.updatetime = 50

require("luasnip.loaders.from_vscode").lazy_load()
