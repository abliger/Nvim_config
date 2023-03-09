-- if lua file is in nvim config folder , using 'gf' go to setting file.
local filename = vim.fn.expand('%:p:h')
if string.find(filename,fn.stdpath('config')) and not string.find(vim.o.path,'./lua,') then
vim.o.path = vim.o.path .. './lua,' 
end
