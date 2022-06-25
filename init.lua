fn = vim.fn
api = vim.api

is_mac = fn.has("mac") or fn.has("unix") or fn.has('linux')

-- local myAutoGroup = api.nvim_create_augroup("myAutoGroup", { clear = true, })
api.nvim_command('set nu')
api.nvim_command('set mouse=a')
api.nvim_command('command -nargs=? OpenConfig edit ' .. fn.stdpath('config') .. '/<args>')






require('tool/kb-switch')
require('plugin')
require('pluginConfig/nvimTree/index')
require('pluginConfig/bufferline/index')
require('pluginConfig/telescope/index')
require('keyboard')
require('lsp/index')
require('lsp/cmp')
