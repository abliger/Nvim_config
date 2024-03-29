Fn = vim.fn
Api = vim.api

require 'kbswitch'
require 'plugins'
require 'setting'
require 'color/onedark'
require 'color/treesitter'
require 'lsp/init'
require 'null_ls'
require 'format/init'
require 'autoCommand'
require 'keymap'
require 'cmp/cmp'
require('lorem').setup {
	sentenceLength = 'mixedShort',
	comma = 0.1,
}

-- filetype
-- ftplugin/lua/init
