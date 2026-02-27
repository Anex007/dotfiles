local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

-- our picker function: colors
local M = {
	colors = function(opts)
		opts = opts or {}
		pickers
			.new(opts, {
				prompt_title = "colors",
				finder = finders.new_table({
					results = {
						"auto",
						"16color",
						"ayu_dark",
						"ayu_mirage",
						"base16",
						"codedark",
						"dracula",
						"everforest",
						"gruvbox_dark",
						"gruvbox_light",
						"gruvbox_material",
						"horizon",
						"iceberg_dark",
						"iceberg_light",
						"jellybeans",
						"material",
						"modus-vivendi",
						"molokai",
						"moonfly",
						"nightfly",
						"nord",
						"OceanicNext",
						"palenight",
						"papercolor_dark",
						"powerline",
						"powerline_dark",
						"seoul256",
						"solarized_dark",
						"Tomorrow",
						"wombat",
					},
				}),
				sorter = conf.generic_sorter(opts),
				attach_mappings = function(prompt_bufnr, _)
					actions.select_default:replace(function()
						actions.close(prompt_bufnr)
						local selection = action_state.get_selected_entry()
						-- print(vim.inspect(selection))

						require("lualine").setup({
							options = {
								theme = selection[1],
							},
							sections = {
								lualine_a = { "mode" },
								lualine_b = { "branch", "diff", "diagnostics" },
								lualine_c = { "filename" },
								lualine_x = { "lsp_status", "encoding", "filetype" },
								lualine_y = { "progress" },
								lualine_z = { "location" },
							},
						})
						-- vim.api.nvim_put({ selection[1] }, "", false, true)
					end)
					return true
				end,
			})
			:find()
	end,
}

-- to execute the function
-- colors()

return M
