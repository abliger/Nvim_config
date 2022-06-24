local fn = vim.fn
local api = vim.api

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

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local paccker_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
  vim.notify("正在安装Pakcer.nvim，请稍后...")
  paccker_bootstrap = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    -- "https://gitcode.net/mirrors/wbthomason/packer.nvim",
    install_path,
  })

  -- https://github.com/wbthomason/packer.nvim/issues/750
  local rtp_addition = vim.fn.stdpath("data") .. "/site/pack/*/start/*"
  if not string.find(vim.o.runtimepath, rtp_addition) then
    vim.o.runtimepath = rtp_addition .. "," .. vim.o.runtimepath
  end
  vim.notify("Pakcer.nvim 安装完毕")
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.notify("没有安装 packer.nvim")
  return
end

mode = require('tool/kb-switch')
