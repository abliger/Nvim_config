local cmp = require 'cmp'

cmp.setup {
	mapping = cmp.mapping.preset.insert {
		-- Tab Completion.
		-- See: https://github.com/hrsh7th/nvim-cmp/discussions/783.
		['<Tab>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
		['<S-Tab>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
		['<Enter>'] = cmp.mapping.confirm { select = false },
		['<c-q>'] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		},
	},
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	sources = cmp.config.sources {
		{ name = 'nvim_lsp' },
		{ name = 'nvim_lsp_signature_help' },
		{ name = 'nvim_lua' },
		{ name = 'luasnip' },
		{ name = 'path' },
		{ name = 'buffer', keyword_length = 3 },
	},
	completion = {
		completeopt = 'menu,menuone,noinsert',
	},
	-- sorting = {
	-- 	-- TODO: Would be cool to add stuff like "See variable names before method names" in rust, or something like that.
	-- 	comparators = {
	-- 		cmp.config.compare.offset,
	-- 		cmp.config.compare.exact,
	-- 		cmp.config.compare.score,

	-- 		-- copied from cmp-under, but I don't think I need the plugin for this.
	-- 		-- I might add some more of my own.
	-- 		function(entry1, entry2)
	-- 			local _, entry1_under = entry1.completion_item.label:find '^_+'
	-- 			local _, entry2_under = entry2.completion_item.label:find '^_+'
	-- 			entry1_under = entry1_under or 0
	-- 			entry2_under = entry2_under or 0
	-- 			if entry1_under > entry2_under then
	-- 				return false
	-- 			elseif entry1_under < entry2_under then
	-- 				return true
	-- 			end
	-- 		end,

	-- 		cmp.config.compare.kind,
	-- 		cmp.config.compare.sort_text,
	-- 		cmp.config.compare.length,
	-- 		cmp.config.compare.order,
	-- 	},
	-- },
	formatting = {
		-- Youtube: How to set up nice formatting for your sources.
		format = require('lspkind').cmp_format {
			with_text = true,
			menu = {
				buffer = '[buf]',
				nvim_lsp = '[LSP]',
				path = '[path]',
				vsnip = '[snip]',
			},
		},
	},
	--	experimental = {
	--		native_menu = false,
	--
	--		ghost_text = true,
	--	},
}

cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		{ name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
	}, {
		{ name = 'buffer' },
	}),
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' },
	},
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' },
	}, {
		{ name = 'cmdline' },
	}),
})

-- Setup buffer-local keymaps / options for LSP buffers
-- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- local lsp_attach = function(client, buf)
-- 	-- Example maps, set your own with vim.api.nvim_buf_set_keymap(buf, "n", <lhs>, <rhs>, { desc = <desc> })
-- 	-- or a plugin like which-key.nvim
-- 	-- <lhs>        <rhs>                        <desc>
-- 	-- "K"          vim.lsp.buf.hover            "Hover Info"
-- 	-- "<leader>qf" vim.diagnostic.setqflist     "Quickfix Diagnostics"
-- 	-- "[d"         vim.diagnostic.goto_prev     "Previous Diagnostic"
-- 	-- "]d"         vim.diagnostic.goto_next     "Next Diagnostic"
-- 	-- "<leader>e"  vim.diagnostic.open_float    "Explain Diagnostic"
-- 	-- "<leader>ca" vim.lsp.buf.code_action      "Code Action"
-- 	-- "<leader>cr" vim.lsp.buf.rename           "Rename Symbol"
-- 	-- "<leader>fs" vim.lsp.buf.document_symbol  "Document Symbols"
-- 	-- "<leader>fS" vim.lsp.buf.workspace_symbol "Workspace Symbols"
-- 	-- "<leader>gq" vim.lsp.buf.formatting_sync  "Format File"
--
-- 	vim.api.nvim_buf_set_option(buf, 'formatexpr', 'v:lua.vim.lsp.formatexpr()')
-- 	vim.api.nvim_buf_set_option(buf, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
-- 	vim.api.nvim_buf_set_option(buf, 'tagfunc', 'v:lua.vim.lsp.tagfunc')
-- end
