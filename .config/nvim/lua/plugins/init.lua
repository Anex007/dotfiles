return {

	{
		"nvim-telescope/telescope.nvim",
		version = "*",
		dependencies = {
			"nvim-lua/plenary.nvim",
			-- optional but recommended
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		-- config = function()
		-- 	require("telescope").setup {
		-- 		defaults = {
		--
		-- 		}
		-- 	}
		-- end,
	},

	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		dependencies = { "rafamadriz/friendly-snippets" },
		build = "make install_jsregexp",
	},

	--- Copilot may need to be removed
	-- {
	-- 	"zbirenbaum/copilot.lua",
	-- 	dependencies = {
	-- 		"copilotlsp-nvim/copilot-lsp", -- (optional) for NES functionality
	-- 	},
	-- 	cmd = "Copilot",
	-- 	event = "InsertEnter",
	-- 	config = function()
	-- 		require("copilot").setup({
	-- 			nes = {
	-- 				enabled = true,
	-- 				keymap = {
	-- 					accept_and_goto = "<leader>p",
	-- 					accept = false,
	-- 					dismiss = "<Esc>",
	-- 				},
	-- 			},
	-- 		})
	-- 	end,
	-- },

	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },

	{ "folke/tokyonight.nvim", priority = 1000 },

	-- { "frenzyexists/aquarium-vim", priority = 1000 },

	-- { "max2000warlord/bearded-arc.nvim", priority = 1000 },

	{ "Mofiqul/dracula.nvim", priority = 1000 },

	{ "Everblush/nvim", name = "everblush" },

	{
		"neanias/everforest-nvim",
		version = false,
		priority = 1000, -- make sure to load this before all the other start plugins
	},

	{
		"rebelot/kanagawa.nvim",
		priority = 1000,
	},

	{ "ellisonleao/gruvbox.nvim", priority = 1000 },
	{ "EdenEast/nightfox.nvim", priority = 1000 },
	{ "shaunsingh/nord.nvim", priority = 1000 },

	-- {
	-- 	"navarasu/onedark.nvim",
	-- 	priority = 1000, -- make sure to load this before all the other start plugins
	-- 	config = function()
	-- 		require("onedark").setup({
	-- 			style = "darker", -- dark, darker, cool, warm, deep, warmer
	-- 		})
	-- 		require("onedark").load()
	-- 	end,
	-- },

	-- {
	-- 	"deparr/tairiki.nvim",
	-- 	lazy = false,
	-- 	priority = 1000, -- recommended if you use tairiki as your default theme
	-- },
	-- {
	-- 	"Tsuzat/NeoSolarized.nvim",
	-- 	priority = 1000, -- make sure to load this before all the other start plugins
	-- },
	-- lua/plugins/rose-pine.lua
	-- {
	-- 	"rose-pine/neovim",
	-- 	name = "rose-pine",
	-- },
	{
		"Allianaab2m/penumbra.nvim",
		priority = 1000,
	},

	{ "drewtempelmeyer/palenight.vim", priority = 1000 },

	{ "folke/which-key.nvim", lazy = true },

	{ "nvim-tree/nvim-web-devicons", lazy = true },

	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},

	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		-- enabled = false,
		config = function()
			require("lualine").setup({
				options = {
					theme = "material",
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
		end,
	},

	-- { 'crazyhulk/cmp-sign' },
	{
		"nvim-mini/mini.nvim",
		version = "*",
		-- enabled = false
		config = function()
			-- local statusline = require("mini.statusline")
			-- statusline.setup({ use_icons = true })
			-- local tabline = require("mini.tabline")
			-- tabline.setup({
			-- 	show_icons = true,
			-- })
			local comment = require("mini.comment")
			comment.setup({
				options = {
					-- Function to compute custom 'commentstring' (optional)
					custom_commentstring = nil,
					-- Whether to ignore blank lines when commenting
					ignore_blank_line = false,
					-- Whether to ignore blank lines in actions and textobject
					start_of_line = false,
					-- Whether to force single space inner padding for comment parts
					pad_comment_parts = true,
				},
				-- Module mappings. Use `''` (empty string) to disable one.
				mappings = {
					-- Toggle comment (like `gcip` - comment inner paragraph) for both
					-- Normal and Visual modes
					comment = "",
					-- Toggle comment on current line
					comment_line = "<leader>/",
					-- Toggle comment on visual selection
					comment_visual = "<leader>/",
					-- Define 'comment' textobject (like `dgc` - delete whole comment block)
					-- Works also in Visual mode if mapping differs from `comment_visual`
					textobject = "gc",
				},

				-- Hook functions to be executed at certain stage of commenting
				hooks = {
					-- Before successful commenting. Does nothing by default.
					pre = function() end,
					-- After successful commenting. Does nothing by default.
					post = function() end,
				},
			})
		end,
	},

	{
		"kylechui/nvim-surround",
		version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},
	{
		"saghen/blink.cmp",
		-- optional: provides snippets for the snippet source
		-- dependencies = { "rafamadriz/friendly-snippets" },
		dependencies = { "L3MON4D3/LuaSnip", version = "v2.*" },

		-- use a release tag to download pre-built binaries
		version = "1.*",
		-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
		-- build = 'cargo build --release',
		-- If you use nix, you can build from source using latest nightly rust with:
		-- build = 'nix run .#build-plugin',

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
			-- 'super-tab' for mappings similar to vscode (tab to accept)
			-- 'enter' for enter to accept
			-- 'none' for no mappings
			--
			-- All presets have the following mappings:
			-- C-space: Open menu or open docs if already open
			-- C-n/C-p or Up/Down: Select next/previous item
			-- C-e: Hide menu
			-- C-k: Toggle signature help (if signature.enabled = true)
			--
			-- See :h blink-cmp-config-keymap for defining your own keymap
			keymap = { preset = "default", ["<C-Space>"] = { "select_and_accept", "fallback" } },

			appearance = {
				-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
				-- Adjusts spacing to ensure icons are aligned
				nerd_font_variant = "mono",
			},
			snippets = { preset = "luasnip" },

			-- (Default) Only show the documentation popup when manually triggered
			completion = {
				-- documentation = { auto_show = false }
				ghost_text = {
					enabled = true,
				},
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 200,
					window = {
						border = "rounded",
						winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
					},
				},
				menu = {
					border = "rounded",
					draw = { gap = 2 },
					winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
				},
			},

			-- Default list of enabled providers defined so that you can extend it
			-- elsewhere in your config, without redefining it, due to `opts_extend`
			sources = {
				default = { "lazydev", "lsp", "path", "snippets", "buffer" },
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						-- make lazydev completions top priority (see `:h blink.cmp`)
						score_offset = 100,
					},
				},
			},

			-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
			-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
			-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
			--
			-- See the fuzzy documentation for more information
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},

	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},

	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
		lazy = false,
		-- event = { "LazyFile", "VeryLazy" },
		cmd = { "TSUpdate", "TSInstall", "TSLog", "TSUninstall" },
		opts_extend = { "ensure_installed" },
		opts = {
			ensure_installed = {
				"bash",
				"html",
				"javascript",
				"json",
				"lua",
				"markdown",
				"markdown_inline",
				"python",
				"query",
				"regex",
				"vim",
				"yaml",
				"rust",
				"go",
			},
			highlight = {
				enable = true,
			},
		},
	},

	{ "ThePrimeagen/harpoon" },
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},

	{ "mbbill/undotree" },

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"folke/lazydev.nvim",
		},
	},

	{
		"mason-org/mason.nvim",
		opts = {},
	},

	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			-- fix after closing: https://github.com/folke/lazydev.nvim/issues/136
			-- ensure_installed = { "lua_ls@3.16.4", "rust_analyzer", "clangd", "pylsp", "cmake", "gopls", "zls" },
			ensure_installed = { "lua_ls@3.16.4", "rust_analyzer", "gopls" },
		},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},

	-- {
	-- 	"xzbdmw/colorful-menu.nvim",
	-- 	config = function()
	-- 		-- You don't need to set these options.
	-- 		require("colorful-menu").setup({
	-- 			ls = {
	-- 				lua_ls = {
	-- 					-- Maybe you want to dim arguments a bit.
	-- 					arguments_hl = "@comment",
	-- 				},
	-- 				gopls = {
	-- 					-- By default, we render variable/function's type in the right most side,
	-- 					-- to make them not to crowd together with the original label.
	--
	-- 					-- when true:
	-- 					-- foo             *Foo
	-- 					-- ast         "go/ast"
	--
	-- 					-- when false:
	-- 					-- foo *Foo
	-- 					-- ast "go/ast"
	-- 					align_type_to_right = true,
	-- 					-- When true, label for field and variable will format like "foo: Foo"
	-- 					-- instead of go's original syntax "foo Foo". If align_type_to_right is
	-- 					-- true, this option has no effect.
	-- 					add_colon_before_type = false,
	-- 					-- See https://github.com/xzbdmw/colorful-menu.nvim/pull/36
	-- 					preserve_type_when_truncate = true,
	-- 				},
	-- 				-- for lsp_config or typescript-tools
	-- 				ts_ls = {
	-- 					-- false means do not include any extra info,
	-- 					-- see https://github.com/xzbdmw/colorful-menu.nvim/issues/42
	-- 					extra_info_hl = "@comment",
	-- 				},
	-- 				vtsls = {
	-- 					-- false means do not include any extra info,
	-- 					-- see https://github.com/xzbdmw/colorful-menu.nvim/issues/42
	-- 					extra_info_hl = "@comment",
	-- 				},
	-- 				["rust-analyzer"] = {
	-- 					-- Such as (as Iterator), (use std::io).
	-- 					extra_info_hl = "@comment",
	-- 					-- Similar to the same setting of gopls.
	-- 					align_type_to_right = true,
	-- 					-- See https://github.com/xzbdmw/colorful-menu.nvim/pull/36
	-- 					preserve_type_when_truncate = true,
	-- 					-- NOTE!!: This is for rust-analyzer work properly in this laptop
	-- 					cargo = {
	-- 						target = "x86_64-unknown-linux-gnu",
	-- 					},
	-- 				},
	-- 				clangd = {
	-- 					-- Such as "From <stdio.h>".
	-- 					extra_info_hl = "@comment",
	-- 					-- Similar to the same setting of gopls.
	-- 					align_type_to_right = true,
	-- 					-- the hl group of leading dot of "•std::filesystem::permissions(..)"
	-- 					import_dot_hl = "@comment",
	-- 					-- See https://github.com/xzbdmw/colorful-menu.nvim/pull/36
	-- 					preserve_type_when_truncate = true,
	-- 				},
	-- 				zls = {
	-- 					-- Similar to the same setting of gopls.
	-- 					align_type_to_right = true,
	-- 				},
	-- 				roslyn = {
	-- 					extra_info_hl = "@comment",
	-- 				},
	-- 				dartls = {
	-- 					extra_info_hl = "@comment",
	-- 				},
	-- 				-- The same applies to pyright/pylance
	-- 				basedpyright = {
	-- 					-- It is usually import path such as "os"
	-- 					extra_info_hl = "@comment",
	-- 				},
	-- 				pylsp = {
	-- 					extra_info_hl = "@comment",
	-- 					-- Dim the function argument area, which is the main
	-- 					-- difference with pyright.
	-- 					arguments_hl = "@comment",
	-- 				},
	-- 				-- If true, try to highlight "not supported" languages.
	-- 				fallback = true,
	-- 				-- this will be applied to label description for unsupport languages
	-- 				fallback_extra_info_hl = "@comment",
	-- 			},
	-- 			-- If the built-in logic fails to find a suitable highlight group for a label,
	-- 			-- this highlight is applied to the label.
	-- 			fallback_highlight = "@variable",
	-- 			-- If provided, the plugin truncates the final displayed text to
	-- 			-- this width (measured in display cells). Any highlights that extend
	-- 			-- beyond the truncation point are ignored. When set to a float
	-- 			-- between 0 and 1, it'll be treated as percentage of the width of
	-- 			-- the window: math.floor(max_width * vim.api.nvim_win_get_width(0))
	-- 			-- Default 60.
	-- 			max_width = 60,
	-- 		})
	-- 		require("blink.cmp").setup({
	-- 			completion = {
	-- 				menu = {
	-- 					draw = {
	-- 						-- We don't need label_description now because label and label_description are already
	-- 						-- combined together in label by colorful-menu.nvim.
	-- 						columns = { { "kind_icon" }, { "label", gap = 1 } },
	-- 						components = {
	-- 							label = {
	-- 								width = { fill = true, max = 60 },
	-- 								text = function(ctx)
	-- 									local highlights_info = require("colorful-menu").blink_highlights(ctx)
	-- 									if highlights_info ~= nil then
	-- 										-- Or you want to add more item to label
	-- 										return highlights_info.label
	-- 									else
	-- 										return ctx.label
	-- 									end
	-- 								end,
	-- 								highlight = function(ctx)
	-- 									local highlights = {}
	-- 									local highlights_info = require("colorful-menu").blink_highlights(ctx)
	-- 									if highlights_info ~= nil then
	-- 										highlights = highlights_info.highlights
	-- 									end
	-- 									for _, idx in ipairs(ctx.label_matched_indices) do
	-- 										table.insert(highlights, { idx, idx + 1, group = "BlinkCmpLabelMatch" })
	-- 									end
	-- 									-- Do something else
	-- 									return highlights
	-- 								end,
	-- 							},
	-- 						},
	-- 					},
	-- 				},
	-- 			},
	-- 		})
	-- 	end,
	-- },

	{
		"stevearc/conform.nvim",
		opts = {},
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					-- Conform will run multiple formatters sequentially
					-- python = { "isort", "black" },
					-- You can customize some of the format options for the filetype (:help conform.format)
					rust = { "rustfmt", lsp_format = "fallback" },
					-- Conform will run the first available formatter
					-- javascript = { "prettierd", "prettier", stop_after_first = true },
					go = { "gofmt" },
					-- zig = { "zigfmt" },
				},
			})
		end,
	},

	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		-- use opts = {} for passing setup options
		-- this is equivalent to setup({}) function
	},

	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				signs = {
					add = { text = "┃" },
					change = { text = "┃" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
					untracked = { text = "┆" },
				},
				signs_staged = {
					add = { text = "┃" },
					change = { text = "┃" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
					untracked = { text = "┆" },
				},
				signs_staged_enable = true,
				signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
				numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
				linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
				word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
				watch_gitdir = {
					follow_files = true,
				},
				auto_attach = true,
				attach_to_untracked = false,
				current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
				current_line_blame_opts = {
					virt_text = true,
					virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
					delay = 1000,
					ignore_whitespace = false,
					virt_text_priority = 100,
					use_focus = true,
				},
				current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
				sign_priority = 6,
				update_debounce = 100,
				status_formatter = nil, -- Use default
				max_file_length = 40000, -- Disable if file is longer than this (in lines)
				preview_config = {
					-- Options passed to nvim_open_win
					style = "minimal",
					relative = "cursor",
					row = 0,
					col = 1,
				},
			})
		end,
	},

	{
		"romgrk/barbar.nvim",
		dependencies = {
			"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
			"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
		},
		init = function()
			vim.g.barbar_auto_setup = false
		end,
		opts = {
			-- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
			-- animation = true,
			-- insert_at_start = true,
			-- …etc.
		},
		version = "^1.0.0", -- optional: only update when a new 1.x version is released
	},
}
