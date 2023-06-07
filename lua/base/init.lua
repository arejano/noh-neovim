return {
	{ "tpope/vim-sleuth" },
	{ "tpope/vim-repeat" },
	{ "nvim-lua/plenary.nvim" },
	'rebelot/kanagawa.nvim',
	'mfussenegger/nvim-dap',
	'Exafunction/codeium.vim',
	'tribela/vim-transparent',
	-- Git related plugins
	'tpope/vim-fugitive',
	'tpope/vim-rhubarb',
	-- Detect tabstop and shiftwidth automatically
	'tpope/vim-sleuth',
	-- {
	-- 	"folke/persistence.nvim",
	-- 	event = "BufReadPre",
	-- 	opts = { options = { "buffers", "curdir", "tabpages", "winsize", "help" } },
	-- 	-- stylua: ignore
	-- 	keys = {
	-- 		{ "<leader>qs", function() require("persistence").load() end,                desc = "Restore Session" },
	-- 		{ "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
	-- 		{
	-- 			"<leader>qd",
	-- 			function() require("persistence").stop() end,
	-- 			desc =
	-- 			"Don't Save Current Session"
	-- 		},
	-- 	},
	-- },
	{
		'theprimeagen/harpoon',
		config = function()
			local mark = require('harpoon.mark')
			local ui = require('harpoon.ui')

			vim.keymap.set("n", "<A-a>", mark.add_file)
			vim.keymap.set("n", "<A-e>", ui.toggle_quick_menu)

			vim.keymap.set("n", "<A-1>", function() ui.nav_file(1) end)
			vim.keymap.set("n", "<A-2>", function() ui.nav_file(2) end)
			vim.keymap.set("n", "<A-3>", function() ui.nav_file(3) end)
			vim.keymap.set("n", "<A-4>", function() ui.nav_file(4) end)
		end
	},
	{
		-- Autopairs
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end
	},

	{
		'filipdutescu/renamer.nvim',
		config = function()
			vim.keymap.set("n", "<leader>rn", function() require("renamer").rename() end)
		end
	},
	{ "folke/todo-comments.nvim", },
	{
		-- File explorer
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional, for file icons
		},
		tag = 'nightly',          -- optional, updated every week. (see issue #1193)
		config = function()
			require("nvim-tree").setup()

			vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<cr>")
			vim.keymap.set("n", "<leader>o", ":NvimTreeFocus<cr>")
		end
	},

	{
		-- Autocompletion
		'hrsh7th/nvim-cmp',
		dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
	},

	{
		'folke/which-key.nvim',
		event = "VeryLazy",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require('which-key').setup {}
		end,
		opts = {
			defaults = {
				["<leader>g"] = { name = "+Git" },
			},
		},
	},
	{
		-- Adds git releated signs to the gutter, as well as utilities for managing changes
		'lewis6991/gitsigns.nvim',
		config = function()
			-- See `:help gitsigns.txt`
			require('gitsigns').setup {
				signs = {
					add = { text = '+' },
					change = { text = '~' },
					delete = { text = '_' },
					topdelete = { text = '‾' },
					changedelete = { text = '~' },
				},
			}
		end,
	},
	{
		-- Fancier statusline
		'nvim-lualine/lualine.nvim',
		config = function()
			-- Set lualine as statusline
			-- See `:help lualine.txt`
			require('lualine').setup {
				options = {
					icons_enabled = false,
					-- theme = 'rose-pine',
					component_separators = '|',
					section_separators = '',
				},
			}
		end,
	},

	{
		-- Add indentation guides even on blank lines
		'lukas-reineke/indent-blankline.nvim',
		config = function()
			-- Enable `lukas-reineke/indent-blankline.nvim`
			-- See `:help indent_blankline.txt`
			require('indent_blankline').setup {
				char = '┊',
				show_trailing_blankline_indent = false,
			}
		end,
	},
	{
		-- "gc" to comment visual regions/lines
		'numToStr/Comment.nvim',
		config = function()
			local api = require("Comment.api")

			vim.keymap.set("n", "<leader>/",
				function()
					api.toggle.linewise.current()
				end
			)
			vim.keymap.set("v", "<leader>/",
				"<esc><cmd>lua require('Comment.api').toggle.linewise.current(vim.fn.visualmode())<cr>"
			)
			require('Comment').setup()
		end,
	},
	-- Fuzzy Finder (files, lsp, etc)
	{ 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } },

	-- Fuzzy Finder Algorithm which requires local dependencies to be built.
	-- Only load if `make` is available. Make sure you have the system
	-- requirements installed.
	{
		'nvim-telescope/telescope-fzf-native.nvim',
		build = 'make',
		cond = function()
			return vim.fn.executable 'make' == 1
		end,
	},
	{
		-- Highlight, edit, and navigate code
		'nvim-treesitter/nvim-treesitter',
		dependencies = {
			'nvim-treesitter/nvim-treesitter-textobjects',
		},
		config = function()
			pcall(require('nvim-treesitter.install').update { with_sync = true })
		end,
	},
	{
		-- LSP Configuration & Plugins
		'neovim/nvim-lspconfig',
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',

			{
				-- Useful status updates for LSP
				'j-hui/fidget.nvim',
				config = function()
					require('fidget').setup()
				end,
			},

			-- Additional lua configuration, makes nvim stuff amazing!
			'folke/neodev.nvim',
		},
	},
	{
		"Pocco81/true-zen.nvim",
		config = function()
			require("true-zen").setup(
				{
					modes = {
						-- configurations per mode
						ataraxis = {
							shade = "dark", -- if `dark` then dim the padding windows, otherwise if it's `light` it'll brighten said windows
							backdrop = 0, -- percentage by which padding windows should be dimmed/brightened. Must be a number between 0 and 1. Set to 0 to keep the same background color
							minimum_writing_area = {
								-- minimum size of main window
								width = 10,
								height = 44,
							},
							quit_untoggles = true, -- type :q or :qa to quit Ataraxis mode
							padding = {
								-- padding windows
								left = 52,
								right = 52,
								top = 0,
								bottom = 0,
							},
							callbacks = {
								-- run functions when opening/closing Ataraxis mode
								open_pre = nil,
								open_pos = nil,
								close_pre = nil,
								close_pos = nil
							},
						},
						minimalist = {
							ignored_buf_types = { "nofile" }, -- save current options from any window except ones displaying these kinds of buffers
							options = {
								-- options to be disabled when entering Minimalist mode
								number = false,
								relativenumber = false,
								showtabline = 0,
								signcolumn = "no",
								statusline = "",
								cmdheight = 1,
								laststatus = 0,
								showcmd = false,
								showmode = false,
								ruler = false,
								numberwidth = 1
							},
							callbacks = {
								-- run functions when opening/closing Minimalist mode
								open_pre = nil,
								open_pos = nil,
								close_pre = nil,
								close_pos = nil
							},
						},
						narrow = {
							--- change the style of the fold lines. Set it to:
							--- `informative`: to get nice pre-baked folds
							--- `invisible`: hide them
							--- function() end: pass a custom func with your fold lines. See :h foldtext
							folds_style = "informative",
							run_ataraxis = true, -- display narrowed text in a Ataraxis session
							callbacks = {
								-- run functions when opening/closing Narrow mode
								open_pre = nil,
								open_pos = nil,
								close_pre = nil,
								close_pos = nil
							},
						},
						focus = {
							callbacks = {
								-- run functions when opening/closing Focus mode
								open_pre = nil,
								open_pos = nil,
								close_pre = nil,
								close_pos = nil
							},
						}
					},
					integrations = {
						tmux = false, -- hide tmux status bar in (minimalist, ataraxis)
						kitty = {
							enabled = false,
							font = "+3"
						},
						twilight = false, -- enable twilight (ataraxis)
						lualine = false -- hide nvim-lualine (ataraxis)
					},
				}
			)
			-- Reload Source
			vim.keymap.set("n", "<leader>zf", require("true-zen").focus, { noremap = true })
			vim.keymap.set("n", "<leader>zm", require("true-zen").minimalist, { noremap = true })
			vim.keymap.set("n", "<leader>za", require("true-zen").ataraxis, { noremap = true })
		end
	},
	{
		'folke/trouble.nvim',
		config = function()
			require("trouble").setup({
				position = "bottom", -- position of the list can be: bottom, top, left, right
				height = 10,        -- height of the trouble list when position is top or bottom
				width = 50,         -- width of the list when position is left or right
				icons = false,      -- use devicons for filenames
				mode = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
				fold_open = "",  -- icon used for open folds
				fold_closed = "", -- icon used for closed folds
				group = true,       -- group results by file
				padding = true,     -- add an extra new line on top of the list
				action_keys = {
					-- key mappings for actions in the trouble list
					-- map to {} to remove a mapping, for example:
					-- close = {},
					close = "q",       -- close the list
					cancel = "<esc>",  -- cancel the preview and get back to your last window / buffer / cursor
					refresh = "r",     -- manually refresh
					jump = { "<cr>", "<tab>" }, -- jump to the diagnostic or open / close folds
					open_split = { "<c-x>" }, -- open buffer in new split
					open_vsplit = { "<c-v>" }, -- open buffer in new vsplit
					open_tab = { "<c-t>" }, -- open buffer in new tab
					jump_close = { "o" }, -- jump to the diagnostic and close the list
					toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
					toggle_preview = "P", -- toggle auto_preview
					hover = "K",       -- opens a small popup with the full multiline message
					preview = "p",     -- preview the diagnostic location
					close_folds = { "zM", "zm" }, -- close all folds
					open_folds = { "zR", "zr" }, -- open all folds
					toggle_fold = { "zA", "za" }, -- toggle fold of current file
					previous = "k",    -- previous item
					next = "j"         -- next item
				},
				indent_lines = true,   -- add an indent guide below the fold icons
				auto_open = false,     -- automatically open the list when you have diagnostics
				auto_close = false,    -- automatically close the list when you have no diagnostics
				auto_preview = true,   -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
				auto_fold = false,     -- automatically fold a file trouble list at creation
				auto_jump = { "lsp_definitions" }, -- for the given modes, automatically jump if there is only a single result
				signs = {
					-- icons / text used for a diagnostic
					error = "",
					warning = "",
					hint = "",
					information = "",
					other = "﫠"
				},
				use_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
			})

			vim.keymap.set("n", "<F1>", function()
				vim.cmd("TroubleToggle")
			end)
		end
	},
}
