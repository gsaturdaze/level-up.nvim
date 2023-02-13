local M = {}

function M.setup()
    vim.o.guicursor = ''
    vim.o.nu = true
    vim.o.relativenumber = true
    vim.o.tabstop = 4
    vim.o.softtabstop = 4
    vim.o.shiftwidth = 4
    vim.o.expandtab = true
    vim.o.wrap = false
    vim.o.swapfile = false
    vim.o.backup = false
    vim.o.undodir = os.getenv("HOME") .. "/.cache/nvim/undodir"
    vim.o.undofile = true
    vim.o.hlsearch = false
    vim.o.incsearch = true
    vim.o.termguicolors = true
    vim.o.scrolloff = 8
    vim.o.signcolumn = "yes"
    vim.o.isfname = "@-@"
    vim.o.updatetime = 50
    vim.o.colorcolumn = "80"
    vim.o.mouse = 'a'
    vim.o.breakindent = true
    vim.o.completeopt = "menuone,noselect"
    vim.o.spelllang='en'
    vim.o.spellsuggest=best,9
end

return M
