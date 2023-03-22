local autocmd = Api.nvim_create_autocmd
local mode = {}
-- 中英文切换
mode.default_mode = 'com.apple.keylayout.ABC'
mode.current_mode = ''

local myAutoGroup = Api.nvim_create_augroup('myAutoGroup', {
	clear = true,
})
local is_mac = Fn.has 'mac' or Fn.has 'unix' or Fn.has 'linux'
if not is_mac then
	local windowsInsertLeave = function()
		vim.cmd ':silent :!~/.config/nvim/im-select.exe 1033'
	end
	autocmd('InsertLeave', {
		group = myAutoGroup,
		callback = windowsInsertLeave,
	})
else
	local macInsertLeave = function()
		mode.current_mode = Fn.system 'im-select'
		vim.cmd(':silent :!im-select' .. ' ' .. mode.default_mode)
	end
	local macInsertEnter = function()
		if mode.current_mode then
			vim.cmd(':silent :!im-select' .. ' ' .. mode.current_mode)
		end
	end

	autocmd({ 'InsertLeave', 'VimLeave' }, {
		group = myAutoGroup,
		callback = macInsertLeave,
	})
	autocmd({ 'InsertEnter', 'VimEnter' }, {
		group = myAutoGroup,
		callback = macInsertEnter,
	})
end
-- 中英文切换
return mode
