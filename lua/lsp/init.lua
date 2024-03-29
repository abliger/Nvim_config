require('mason').setup()
require('mason-lspconfig').setup {
	ensure_installed = { 'rust_analyzer', 'lua_ls' },
}
local opts = require 'lsp/rust'
require('mason-lspconfig').setup_handlers {
	-- The first entry (without a key) will be the default handler
	-- and will be called for each installed server that doesn't have
	-- a dedicated handler.
	function(server_name) -- default handler (optional)
		require('lspconfig')[server_name].setup {}
	end,
	-- Next, you can provide a dedicated handler for specific servers.
	-- For example, a handler override for the `rust_analyzer`:
	['rust_analyzer'] = function()
		require('rust-tools').setup(opts)
	end,
	['lua_ls'] = function()
		require('lspconfig').lua_ls.setup(require 'lsp/lua')
	end,
	['html'] = function()
		require('lspconfig').html.setup(require 'lsp/vscode_lsp_config')
	end,
	['cssls'] = function()
		require('lspconfig').cssls.setup(require 'lsp/vscode_lsp_config')
	end,
}
