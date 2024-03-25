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

	{
		"tyrannicaltoucan/vim-deep-space",
		lazy = false,
		priority = 1000,
		config = function()
			require("colorizer").setup()
			vim.api.nvim_set_option("background", "dark")
			vim.cmd("colorscheme deep-space")
		end,
	},

	-- {
	-- 	"tjdevries/colorbuddy.vim",
	-- 	config = function()
	-- 		local colorbuddy = require("colorbuddy")
	--
	-- 		local Color = colorbuddy.Color
	-- 		local colors = colorbuddy.colors
	-- 		local Group = colorbuddy.Group
	-- 		local groups = colorbuddy.groups
	-- 		local styles = colorbuddy.styles
	--
	-- 		-- Color.new("background", "#282c34")
	-- 		-- Color.new("red", "#cc6666")
	-- 		-- Color.new("green", "#99cc99")
	-- 		-- Color.new("yellow", "#f0c674")
	--
	-- 		Group.new("@variable", colors.superwhite, nil)
	--
	-- 		Group.new("TSPunctBracket", colors.orange:light():light())
	--
	-- 		-- Group.new("StatuslineError1", colors.red:light():light(), groups.Statusline)
	-- 		-- Group.new("StatuslineError2", colors.red:light(), groups.Statusline)
	-- 		-- Group.new("StatuslineError3", colors.red, groups.Statusline)
	-- 		-- Group.new("StatuslineError3", colors.red:dark(), groups.Statusline)
	-- 		-- Group.new("StatuslineError3", colors.red:dark():dark(), groups.Statusline)
	--
	-- 		-- Group.new("pythonTSType", c.red)
	-- 		-- Group.new("goTSType", g.Type.fg:dark(), nil, g.Type)
	--
	-- 		Group.new("WinSeparator", nil, nil)
	--
	-- 		Group.new("TSTitle", colors.blue)
	--
	-- 		-- Group.new("InjectedLanguage", nil, g.Normal.bg:dark())
	--
	-- 		Group.new("LspParameter", nil, nil, styles.italic)
	-- 		Group.new("LspDeprecated", nil, nil, styles.strikethrough)
	-- 		-- Group.new("@function.bracket", groups.Normal, groups.Normal)
	-- 		-- Group.new("@variable.builtin", colors.purple:light():light(), groups.Normal)
	--
	-- 		Group.new("VirtNonText", colors.gray3:dark(), nil, styles.italic)
	--
	-- 		-- Group.new("TreesitterContext", nil, groups.Normal.bg:light())
	-- 		Group.new("TreesitterContextLineNumber", colors.blue)
	--
	-- 		Group.new("@property", colors.blue)
	-- 		Group.new("@punctuation.bracket.rapper", colors.gray3, nil, styles.none)
	-- 		Group.new("@rapper_argument", colors.red, nil, styles.italic)
	-- 		Group.new("@rapper_return", colors.orange:light(), nil, styles.italic)
	-- 		Group.new("@constructor.ocaml", colors.orange:light(), nil, styles.none)
	-- 		Group.new("constant", colors.orange, nil, styles.none)
	--
	-- 		Group.new("@keyword", colors.violet, nil, styles.none)
	-- 		-- Group.new("@keyword.faded", groups.nontext.fg:light(), nil, styles.none)
	--
	-- 		Group.new("Function", colors.yellow, nil, styles.none)
	--
	-- 		vim.cmd([[
	--        hi link @function.call.lua LuaFunctionCall
	--        hi link @lsp.type.variable.lua variable
	--        hi link @lsp.type.variable.ocaml variable
	--        hi link @lsp.type.variable.rust variable
	--        hi link @lsp.type.namespace @namespace
	--        hi link @punctuation.bracket.rapper @text.literal
	--        hi link @normal Normal
	--        hi link @tag.attribute.html type
	--        hi link @tag.delimiter.html @namespace
	--      ]])
	--
	-- 		Group.new("Normal", colors.superwhite, colors.gray0)
	-- 	end,
	-- },
}
