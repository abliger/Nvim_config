local map = Api.nvim_set_keymap
local opts = { noremap = true, silent = true }
map('n', 'gte', '<cmd>Neotree toggle<cr>', opts)
map('n', 'gto', '<cmd>Neotree<cr>', opts)
map('n', '<C-p>', '<cmd>MarkdownPreview<cr>', opts)
map('v', '<C-c>', '"+y', opts)
map('v', '<C-x>', '"+c', opts)
local codeMap = {}
function codeMap.map(bufnr)
	local rt = require 'rust-tools'
	-- Hover actions
	vim.keymap.set('n', 'glh', rt.hover_actions.hover_actions, { buffer = bufnr })
	-- Code action groups
	vim.keymap.set('n', 'glg', rt.code_action_group.code_action_group, { buffer = bufnr })
	vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
	vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
	vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
	vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
	vim.keymap.set('n', 'K', vim.lsp.buf.hover)
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation)
	vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help)
	vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder)
	vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder)
	vim.keymap.set('n', '<space>wl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end)
	vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition)
	vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename)
	vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action)
	vim.keymap.set('n', 'gr', vim.lsp.buf.references)
end
return codeMap
-- map('i', '[', '[]<ESC>i', opts)
-- map('i', '{', '{}<ESC>i', opts)
-- map('i', '<', '<><ESC>i', opts)
-- map('i', '\'', '\'\'<ESC>i', opts)
-- map('i', '"', '""<ESC>i', opts)
