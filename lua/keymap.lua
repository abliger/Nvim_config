local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
map('n', 'gte', '<cmd>Neotree toggle<cr>', opts)
map('n', 'gto', '<cmd>Neotree<cr>', opts)
map('n', '<C-p>', '<cmd>MarkdownPreview<cr>', opts)
local codeMap = {}
function codeMap.map(bufnr)
	local rt = require 'rust-tools'
	-- Hover actions
	vim.keymap.set('n', 'glh', rt.hover_actions.hover_actions, { buffer = bufnr })
	-- Code action groups
	vim.keymap.set('n', 'glg', rt.code_action_group.code_action_group, { buffer = bufnr })
end
return codeMap
-- map('i', '(', '()<ESC>i', opts)
-- map('i', '[', '[]<ESC>i', opts)
-- map('i', '{', '{}<ESC>i', opts)
-- map('i', '<', '<><ESC>i', opts)
-- map('i', '\'', '\'\'<ESC>i', opts)
-- map('i', '"', '""<ESC>i', opts)
