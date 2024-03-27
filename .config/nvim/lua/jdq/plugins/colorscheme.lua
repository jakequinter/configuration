function ColorMyPencils(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

	vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
	vim.cmd("hi LineNr guibg=NONE ctermbg=NONE")
end

return {
	-- {
	-- 	"rose-pine/neovim",
	-- 	name = "rose-pine",
	-- 	config = function()
	-- 		require("rose-pine").setup({
	-- 			styles = {
	-- 				transparency = true,
	-- 				italic = false,
	-- 			},
	-- 		})
	--
	-- 		ColorMyPencils()
	-- 	end,
	-- },

	-- {
	-- 	"tyrannicaltoucan/vim-deep-space",
	-- 	lazy = false,
	-- 	priority = 1000,
	-- 	config = function()
	-- 		require("colorizer").setup()
	-- 		vim.api.nvim_set_option("background", "dark")
	-- 		vim.cmd("colorscheme deep-space")
	-- 	end,
	-- },

	{
		"tjdevries/colorbuddy.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			local colorbuddy = require("colorbuddy")
			local Color = colorbuddy.Color
			local colors = colorbuddy.colors
			local Group = colorbuddy.Group
			-- local groups = colorbuddy.groups
			-- local styles = colorbuddy.styles

			Color.new("NvimLightYellow", "#F8FE7A")
			Color.new("NvimCyan", "#FABD2F")
			Color.new("NvimLightCyan", "#FABD2F")

			Group.new("@tag.attribute.tsx", colors.violet)
			Group.new("WinSeparator", nil, nil)

			vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
			vim.cmd("hi LineNr guibg=NONE ctermbg=NONE")
			vim.cmd.colorscheme("gruvbuddy")
		end,
	},
}
