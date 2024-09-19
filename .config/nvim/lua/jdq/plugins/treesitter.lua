return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-context",
		},
		config = function()
			-- local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
			-- parser_config.ocaml_mlx = {
			-- 	install_info = {
			-- 		url = "https://github.com/ocaml-mlx/tree-sitter-mlx",
			-- 		files = { "src/parser.c", "src/scanner.c" },
			-- 		branch = "master",
			-- 	},
			-- 	filetype = "ocaml.mlx",
			-- }

			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"vimdoc",
					"javascript",
					"typescript",
					"c",
					"lua",
					"rust",
					"ocaml",
					"ocaml_mlx",
					"python",
				},
				sync_install = false,
				indent = {
					enable = true,
					disable = { "ocaml", "ocaml_interface", "ocaml_mlx" },
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
