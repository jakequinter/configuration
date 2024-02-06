return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"yamatsum/nvim-nonicons",
		"kyazdani42/nvim-web-devicons",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")
		local icons = require("nvim-nonicons")

		telescope.setup({
			defaults = {
				prompt_prefix = "  " .. icons.get("telescope") .. "  ",
				selection_caret = " ❯ ",
				entry_prefix = "   ",
			},
		})

		vim.keymap.set("n", "<leader>df", builtin.git_files, {})
		vim.keymap.set("n", "<C-p>", builtin.find_files, {})
		vim.keymap.set("n", "<leader>fs", function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end)
	end,
}
