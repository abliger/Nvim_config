local autocmd = vim.api.nvim_create_autocmd
local mode = {}
-- 中英文切换
mode.default_mode = 'com.apple.keylayout.ABC'
mode.current_mode = ''
local myAutoGroup = vim.api.nvim_create_augroup('myAutoGroup', {
	clear = true,
})
local is_mac = fn.has 'mac' or fn.has 'unix' or fn.has 'linux'
if is_mac then
	local windowsInsertLeave = function()
		vim.cmd ':silent :!~/.config/nvim/im-select.exe 1033'
	end
	autocmd('InsertLeave', {
		group = myAutoGroup,
		callback = windowsInsertLeave,
	})
else
	local macInsertLeave = function()
		vim.cmd(':silent :!im-select' .. ' ' .. mode.default_mode)
	end
	local macInsertEnter = function()
		if mode.current_mode then
			vim.cmd(':silent :!im-select' .. ' ' .. mode.current_mode)
		end
	end

	autocmd('InsertLeave', {
		group = myAutoGroup,
		callback = macInsertLeave,
	})
	autocmd('InsertEnter', {
		group = myAutoGroup,
		callback = macInsertEnter,
	})
end
-- 中英文切换
return mode
