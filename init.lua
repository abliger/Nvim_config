fn = vim.fn
api = vim.api

is_mac = fn.has("mac") or fn.has("unix") or fn.has('linux')

local myAutoGroup = vim.api.nvim_create_augroup("myAutoGroup", {
  clear = true,
})
api.nvim_command('set nu')
api.nvim_command('set mouse=a')
api.nvim_command('command -nargs=? OpenConfig edit ' .. fn.stdpath('config') .. '/<args>')

---- map
map = vim.api.nvim_set_keymap
vim.g.mapleader = " "
vim.g.maplocalleader = " "
local opt = {noremap = true, silent = true }
map('t','<Esc>','<C-\\><C-N>',opt)
map('t','<C-t>q','<C-\\><C-N>:q<CR>',opt)
map("n", "<leader>t", ":set splitbelow| 5sp | set nosplitbelow | terminal<CR>", opt)
-- 上下滚动浏览
map("n", "<C-j>", "4j", opt)
map("n", "<C-k>", "4k", opt)
-- ctrl u / ctrl + d  只移动9行，默认移动半屏
map("n", "<C-u>", "9k", opt)
map("n", "<C-d>", "9j", opt)
---- map




mode = require('tool/kb-switch')
require('plugin')
require('pluginConfig/nvimTree/index')
