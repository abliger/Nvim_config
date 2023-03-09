fn = vim.fn
api = vim.api

vim.o.path = vim.o.path .. './lua'
require 'kbswitch'
require 'plugins'
require 'setting'
require 'autoCommand'


