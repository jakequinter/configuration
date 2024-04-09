return {
	"vuki656/package-info.nvim",
	dependencies = { "MunifTanjim/nui.nvim" },
	config = function()
		require("package-info").setup({
			autostart = false,
		})

		vim.keymap.set({ "n" }, "<LEADER>pi", require("package-info").toggle, { silent = true, noremap = true })
	end,
}
