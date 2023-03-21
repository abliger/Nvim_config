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
