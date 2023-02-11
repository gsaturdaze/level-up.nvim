-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	is_bootstrap = true
	vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
	vim.cmd [[packadd packer.nvim]]
end

-- Install nvim plugins
require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	require('core.packages')(use)
	if is_bootstrap then
		require('packer').sync()
	end
end)

if is_bootstrap then
	print '==================================='
	print '    Plugins are being installed	  '
	print '    Wait until Packer completes,	  '
	print '       then restart nvim			  '
	print '==================================='
	return
end

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
	command = 'source <afile> | silent! LspStop | silent! LspStart | PackerCompile',
	group = packer_group,
	pattern = vim.fn.expand '$MYVIMRC',
})

-- Setup core plugins and configs
require("core.small").setup()
require("core.treesitter").setup()
require("core.lsp").setup()
--require("core.completion").setup()
require("core.sets").setup()
require("core.theme").setup()
require("core.remaps").setup()
