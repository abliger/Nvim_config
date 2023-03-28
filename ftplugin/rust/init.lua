local augroup = Api.nvim_create_augroup('RustFormatting', {})
Api.nvim_create_autocmd('BufWritePost', {
	group = augroup,
	pattern = { '*.rs' },
	callback = function()
		local filename = Fn.expand '%:p'
		Fn.system('rustfmt ' .. filename)
		Api.nvim_command 'checktime'
	end,
})

local function openHir()
	local filename = Fn.expand '%:p'
	local rand = Fn.system 'echo $RANDOM'
	local tempfile = '/var/folders/2x/v0w93vq55n7_vzjksyxts_kc0000gn/T/nvim.fengsixue/test' .. rand  
	Fn.system('rustc -Z unpretty=hir ' .. filename .. ' >' .. tempfile)
	Api.nvim_command('e ' .. tempfile)
end
vim.keymap.set('n', 'ghir', openHir)
