-- LSP Configuration & Plugins
return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			{
				"j-hui/fidget.nvim",
				tag = "legacy",
				event = "LspAttach",
			},
			"folke/neodev.nvim",
			"hrsh7th/cmp-nvim-lsp",
		},
        event = "BufReadPre",
		config = function()
            --
			-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

			-- This gets run when an LSP connects to a particular buffer.
			local on_attach = function(client, bufnr)
				local lsp_map = require("helpers.keys").lsp_map

				lsp_map("<leader>vrn", vim.lsp.buf.rename, bufnr, "Rename symbol")
				lsp_map("<leader>vca", vim.lsp.buf.code_action, bufnr, "Code action")
				lsp_map("<leader>vtd", vim.lsp.buf.type_definition, bufnr, "Type definition")
				lsp_map("<leader>vws", require("telescope.builtin").lsp_document_symbols, bufnr, "Document symbols")

				lsp_map("gd", vim.lsp.buf.definition, bufnr, "Goto Definition")
				lsp_map("gr", require("telescope.builtin").lsp_references, bufnr, "Goto References")
				lsp_map("gI", vim.lsp.buf.implementation, bufnr, "Goto Implementation")
				lsp_map("K", vim.lsp.buf.hover, bufnr, "Hover Documentation")
				lsp_map("gD", vim.lsp.buf.declaration, bufnr, "Goto Declaration")

				-- Create a command `:Format` local to the LSP buffer
				vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
					vim.lsp.buf.format()
				end, { desc = "Format current buffer with LSP" })

				lsp_map("<leader>ff", "<cmd>Format<cr>", bufnr, "Format")
                -- diagnostic keymaps
                lsp_map("]d", vim.diagnostic.goto_next, bufnr, "diagnostic next")
                lsp_map("[d", vim.diagnostic.goto_prev, bufnr, "diagnostic prev")
                lsp_map("<leader>vd", vim.diagnostic.open_float, bufnr, "diagnostic prev")
			end

			-- Set up Mason before anything else
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"pylsp",
                    "rust_analyzer",
                    "clangd",
                    "gopls",
                    "templ",
                    "html",
                    "emmet_language_server",
				},
				automatic_installation = true,
                handlers = {
                    function(server_name) -- default handler (optional)
                        require("lspconfig")[server_name].setup {
                            capabilities = capabilities,
                            on_attach = on_attach,
                        }
                    end,
                    -- Lua
                    ["lua_ls"] = function ()
                        require("lspconfig").lua_ls.setup({
                            on_attach = on_attach,
                            capabilities = capabilities,
                            settings = {
                                Lua = {
                                    completion = {
                                        callSnippet = "Replace",
                                    },
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
                    end
                }
			})

			-- Quick access via keymap
			require("helpers.keys").map("n", "<leader>M", "<cmd>Mason<cr>", "Show Mason")

			-- Neodev setup before LSP config
			require("neodev").setup()

			-- Turn on LSP status information
			require("fidget").setup {
				window = {
					blend = 0,
					relative = "editor",
				},
			}

			-- Set up cool signs for diagnostics
		    local signs = { Error = "E", Warn = "W", Hint = "H", Info = "I" }
            local signs_color ={ Error = "red", Warn = "green", Hint = "yellow", Info = "white" }
			 for type, icon in pairs(signs) do
			 	local hl = "DiagnosticSign" .. type
                local color = signs_color[type]
			 	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
                vim.api.nvim_set_hl(0, hl, { fg=color, bg="none" })
			 end

			-- Diagnostic config
			local diagnostic_opts = {
				virtual_text = true,
				signs = {
					active = signs,
				},
				update_in_insert = true,
				underline = true,
				severity_sort = true,
				float = {
					focusable = true,
					style = "minimal",
					border = "rounded",
					source = "always",
					header = "",
					prefix = "",
				},
			}
			vim.diagnostic.config(diagnostic_opts)
		end,
	},
}
