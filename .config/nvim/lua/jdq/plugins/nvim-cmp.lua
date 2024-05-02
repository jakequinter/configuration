return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		cmp.setup({
			completion = {
				completeopt = "menu,menuone,preview,noinsert",
			},
			snippet = { -- configure nvim-cmp with snippets
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
				["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
				["<C-u>"] = cmp.mapping.scroll_docs(4), -- scroll up preview
				["<C-d>"] = cmp.mapping.scroll_docs(-4), -- scroll down preview
				["<C-Space>"] = cmp.mapping.complete({}), -- show completion suggestions
				["<C-c>"] = cmp.mapping.abort(), -- close completion window
				["<CR>"] = cmp.mapping.confirm({ select = true }), -- select suggestion
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" }, -- lsp suggestions
				{ name = "luasnip" }, -- snippets
				{ name = "buffer" }, -- text buffer
				{ name = "path" }, -- fs paths
				{ name = "vim-dadbod-completion" }, -- db completion
			}),
		})
	end,
}
