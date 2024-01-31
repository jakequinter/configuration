return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-context",
		},
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"vimdoc",
					"javascript",
					"typescript",
					"c",
					"lua",
					"rust",
					"ocaml",
					"python",
					"eex",
					"elixir",
					"erlang",
					"heex",
				},
				sync_install = false,
				indent = {
					enable = true,
					disable = { "ocaml", "ocaml_interface" },
				},
				autopairs = {
					enable = true,
				},
				autotag = {
					enable = true,
				},
				highlight = {
					enable = true,
				},
			})
		end,
	},
}
