local null_ls = require("null-ls")
local sources = {
	null_ls.builtins.formatting.prettier.with({
		filetypes = {
			"css",
			"graphql",
			"html",
			"javascript",
			"javascriptreact",
			"json",
			"less",
			"markdown",
			"scss",
			"typescript",
			"typescriptreact",
			"yaml",
		},
		check_package_json = true,
		runtime_condition = function(params)
			-- return false to skip running prettier
			return true
		end,
		timeout = 5000,
	}),
	null_ls.builtins.formatting.stylua,
	null_ls.builtins.code_actions.gitsigns,
}
null_ls.setup({
	sources = sources,
	on_attach = function(client)
		if client.server_capabilities.documentFormattingProvider then
			vim.cmd([[
					augroup LspFormatting
							autocmd! * <buffer>
							autocmd BufWritePre <buffer> lua vim.lsp.buf.format()
					augroup END
				]])
		end
	end,
})
require("mason-null-ls").setup({
	ensure_installed = nil,
	automatic_installation = true,
	automatic_setup = false,
})
