api.nvim_command('command -nargs=? OpenConfig edit ' .. fn.stdpath('config') .. '/<args>')
filename = api.nvim_command('files')
-- print(filename)
