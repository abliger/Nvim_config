local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
map('n', 'gte', '<cmd>Neotree toggle<cr>', opts)
map('n', 'gto', '<cmd>Neotree<cr>', opts)
map('n', '<C-p>', '<cmd>MarkdownPreview<cr>', opts)

-- map('i', '(', '()<ESC>i', opts)
-- map('i', '[', '[]<ESC>i', opts)
-- map('i', '{', '{}<ESC>i', opts)
-- map('i', '<', '<><ESC>i', opts)
-- map('i', '\'', '\'\'<ESC>i', opts)
-- map('i', '"', '""<ESC>i', opts)
