local install_path = Fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if Fn.empty(Fn.glob(install_path)) > 0 then
	vim.notify '正在安装Pakcer.nvim，请稍后...'
	Fn.system {
		'git',
		'clone',
		'--depth',
		'1',
		'https://github.com/wbthomason/packer.nvim',
		-- "https://gitcode.net/mirrors/wbthomason/packer.nvim",
		install_path,
	}

	-- https://github.com/wbthomason/packer.nvim/issues/750
	local rtp_addition = vim.Fn.stdpath 'data' .. '/site/pack/*/start/*'
	if not string.find(vim.o.runtimepath, rtp_addition) then
		vim.o.runtimepath = rtp_addition .. ',' .. vim.o.runtimepath
	end
	vim.notify 'Pakcer.nvim 安装完毕'
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')

packer.startup(function(use)
	use 'wbthomason/packer.nvim'

	-- change nvim structures
	use {
		'nvim-neo-tree/neo-tree.nvim',
		branch = 'v2.x',
		requires = require('tree').req,
		config = require('tree').config,
	}

	-- color
	use 'navarasu/onedark.nvim' -- 代码样式
	use 'nvim-treesitter/nvim-treesitter' -- 区分关键字

	-- lint
	use 'jose-elias-alvarez/null-ls.nvim'
	use 'jay-babu/mason-null-ls.nvim'

	-- lsp
	use 'neovim/nvim-lspconfig'
	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig.nvim'

	-- Completion engine
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-nvim-lua'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-nvim-lsp-signature-help'
	use 'hrsh7th/cmp-path'
	use 'neovim/nvim-lspconfig'
	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'

	-- rust
	use 'simrat39/rust-tools.nvim'

	-- Debugging

	-- markdown
	use {
		'iamcco/markdown-preview.nvim',
		run = 'cd app && npm install',
		setup = function()
			vim.g.mkdp_filetypes = { 'markdown' }
		end,
		ft = { 'markdown' },
	}

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	-- if status_ok then
	-- require('packer').sync()
	-- end
end)
if not status_ok then
	vim.notify '没有安装 packer.nvim'
	return
end
