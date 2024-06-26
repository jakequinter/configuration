return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "j-hui/fidget.nvim", tag = "legacy" },
	},
	config = function()
		local lspconfig = require("lspconfig")
		local configs = require("lspconfig.configs")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local on_attach = function(client, bufner)
			local opts = { buffer = bufner, remap = false }
			vim.keymap.set("n", "gd", function()
				vim.lsp.buf.definition()
			end, opts)
			vim.keymap.set("n", "K", function()
				vim.lsp.buf.hover()
			end, opts)
			vim.keymap.set("n", "<leader>vws", function()
				vim.lsp.buf.workspace_symbol()
			end, opts)
			vim.keymap.set("n", "<leader>vd", function()
				vim.diagnostic.open_float()
			end, opts)
			vim.keymap.set("n", "[d", function()
				vim.diagnostic.goto_next()
			end, opts)
			vim.keymap.set("n", "]d", function()
				vim.diagnostic.goto_prev()
			end, opts)
			vim.keymap.set("n", "<leader>vca", function()
				vim.lsp.buf.code_action()
			end, opts)
			vim.keymap.set("n", "<leader>vrr", function()
				vim.lsp.buf.references()
			end, opts)
			vim.keymap.set("n", "<leader>vrn", function()
				vim.lsp.buf.rename()
			end, opts)
			-- vim.keymap.set("i", "<C-h>", function()
			-- 	vim.lsp.buf.signature_help()
			-- end, opts)
		end

		local capabilities = cmp_nvim_lsp.default_capabilities()

		local lexical_config = {
			filetypes = { "elixir", "eelixir", "heex" },
			cmd = { vim.fn.expand("~/Developer/oss/lexical/_build/dev/package/lexical/bin/start_lexical.sh") },
			-- cmd = { "/my/home/projects/_build/dev/package/lexical/bin/start_lexical.sh" },
			settings = {},
		}

		if not configs.lexical then
			configs.lexical = {
				default_config = {
					filetypes = lexical_config.filetypes,
					cmd = lexical_config.cmd,
					root_dir = function(fname)
						return lspconfig.util.root_pattern("mix.exs", ".git")(fname) or vim.loop.os_homedir()
					end,
					-- optional settings
					settings = lexical_config.settings,
				},
			}
		end

		lspconfig.lexical.setup({})

		lspconfig["cssls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- lspconfig["elixirls"].setup({
		-- 	cmd = { os.getenv("HOME") .. "/.local/share/nvim/mason/bin/elixir-ls" },
		-- 	capabilities = capabilities,
		-- 	on_attach = on_attach,
		-- })

		lspconfig["html"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})

		lspconfig["ocamllsp"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["pyright"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["rescriptls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["tailwindcss"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes_include = { "heex" },
			init_options = {
				userLanguages = {
					elixir = "html-eex",
					eelixir = "html-eex",
					heex = "html-eex",
				},
			},
		})

		lspconfig["tsserver"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})
	end,
}
