local lsp_attach = function(client, bufnr)
	local opts = { buffer = bufnr }

	-- LSP keymaps
	vim.keymap.set("n", "<leader>gt", function()
		vim.lsp.buf.definition()
	end, opts)
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover()
	end, opts)
	vim.keymap.set("n", "<leader>cws", function()
		vim.lsp.buf.workspace_symbol()
	end, opts)
	vim.keymap.set("n", "<leader>cc", function()
		vim.lsp.buf.code_action()
	end, opts)
	vim.keymap.set("v", "<leader>cb", "<leader>cc5<CR>", opts)
	vim.keymap.set("n", "<leader>rf", function()
		vim.lsp.buf.references()
	end, opts)
	vim.keymap.set("n", "<leader>crn", function()
		vim.lsp.buf.rename()
	end, opts)
	vim.keymap.set("n", "<leader>ci", function()
		vim.lsp.buf.implementation()
	end, opts)
	vim.keymap.set("i", "<C-h>", function()
		vim.lsp.buf.signature_help()
	end, opts)
	vim.keymap.set("n", "<leader>e", function()
		vim.diagnostic.open_float()
	end, opts)
end

-- Configure diagnostic signs
vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "✘",
			[vim.diagnostic.severity.WARN] = "▲",
			[vim.diagnostic.severity.HINT] = "⚑",
			[vim.diagnostic.severity.INFO] = "",
		},
	},
	float = {
		border = "rounded",
	},
})

-- Custom handler for 'textDocument/definition'
-- The problem is that when I jump on a PHP class definition,
-- I get two results: one for the class and one for the constructor
local function goto_definition(_, result, ctx, _)
	if result == nil or vim.tbl_isempty(result) then
		vim.notify("[LSP] Definition not found", vim.log.levels.INFO)
		return nil
	end

	-- If multiple results, check if they are in the same file
	if vim.tbl_islist(result) then
		local first_uri = result[1].uri or result[1].targetUri
		local same_file = true

		for _, location in ipairs(result) do
			local uri = location.uri or location.targetUri
			if uri ~= first_uri then
				same_file = false
				break
			end
		end

		if same_file then
			-- Jump to the first location if all are in the same file
			vim.lsp.util.jump_to_location(result[1], "utf-8")
		else
			-- Show all locations if they are in different files
			vim.lsp.handlers["textDocument/definition"](_, result, ctx, _)
		end
	else
		-- Single result, jump directly
		vim.lsp.util.jump_to_location(result, "utf-8")
	end
end

-- Get default capabilities and merge with cmp capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

require("mason").setup({})
require("mason-lspconfig").setup({
	handlers = {
		function(server_name)
			require("lspconfig")[server_name].setup({
				capabilities = capabilities,
				on_attach = lsp_attach,
			})
		end,
		-- By default tailwindcss is enabled on php files. We explicitly
		-- set the filetypes it should be enabled on.
		["tailwindcss"] = function()
			require("lspconfig").tailwindcss.setup({
				capabilities = capabilities,
				on_attach = lsp_attach,
				filetypes = {
					"html",
					"blade",
					"css",
					"scss",
					"less",
					"javascriptreact",
					"typescriptreact",
					"vue",
					"svelte",
				},
			})
		end,
		-- Avoid having the lua language server complain about
		-- the 'vim' global variable being not defined
		["lua_ls"] = function()
			require("lspconfig").lua_ls.setup({
				capabilities = capabilities,
				on_attach = lsp_attach,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})
		end,
		["intelephense"] = function()
			require("lspconfig").intelephense.setup({
				capabilities = capabilities,
				on_attach = lsp_attach,
				handlers = {
					["textDocument/definition"] = goto_definition,
				},
			})
		end,
	},
})

-- Setup typescript-tools
require("typescript-tools").setup({
	capabilities = capabilities,
	on_attach = lsp_attach,
})

-- Optional: Configure LSP handlers globally
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
