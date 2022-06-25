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


map("n", "<C-h>", ":NvimTreeToggle<cr>" ,opt)
-- 左右Tab切换
map("n", "]b", ":BufferLineCyclePrev<CR>", opt)
map("n", "[b", ":BufferLineCycleNext<CR>", opt)
-- 关闭
--"moll/vim-bbye"
map("n", "<leader>q", ":Bdelete!<CR>", opt)
map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
map("n", "<leader>bc", ":BufferLinePickClose<CR>", opt)
