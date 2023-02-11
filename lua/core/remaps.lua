local M = {}

function M.setup()
    vim.g.mapleader = ' '
    vim.g.maplocalleader = ' '

    vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

    vim.keymap.set({ 'i', 'v' }, "jk", "<ESC>", { desc = "[J]ust [K]idding and escape" })
    -- vim.keymap.set({ 'n' }, "<leader>pe", vim.cmd.Ex, { desc = "[P]roject [E]xplorer" })
    vim.keymap.set({ 'n' }, "<leader>pe", ":Telescope file_browser<CR>", { desc = "[P]roject [E]xplorer" })
    vim.keymap.set({ 'v' }, 'J', ":m '>+1<CR>gv=gv", { desc = "NoClip visual block up one" })
    vim.keymap.set({ 'v' }, 'K', ":m '<-2<CR>gv=gv", { desc = "NoClip visual block down one" })
    vim.keymap.set({ 'n' }, 'J', "mzJ`z", { desc = "Apply J without moving cursor" })
    vim.keymap.set({ 'n' }, "<C-d>", "<C-d>zz", { desc = "Half page down, but keep cursor centered" })
    vim.keymap.set({ 'n' }, "<C-u>", "<C-u>zz", { desc = "Half page up, but keep cursor centered" })
    vim.keymap.set({ 'n' }, 'n', "nzzzv", { desc = "Next search term, but keep it centered" })
    vim.keymap.set({ 'n' }, 'N', "Nzzzv", { desc = "Previous search term, but keep it centered" })
    vim.keymap.set({ 'n', 'v' }, "<leader>y", "\"+y", { desc = "[y]ank to system clipboard" })
    vim.keymap.set({ 'n' }, "<leader>Y", "\"+Y", { desc = "[Y]ank to system clipboard" })
    vim.keymap.set({ 'x' }, "<leader>p", "\"_dP", { desc = "Send n+1 delete to void register" })
    vim.keymap.set({ 'n', 'v' }, "<leader>d", "\"_d", { desc = "send n+1 [d]elete to void register" })
    vim.keymap.set({ 'n' }, 'Q', "<nop>", { desc = "Avoid Q headaches" })
    vim.keymap.set({ 'n', 'i', 'v' }, '<C-O>', ':TransparentToggle<CR>' )
    vim.keymap.set({ 'n' }, "<C-k>", "<cmd>cnext<CR>zz", { desc = "Quickfix count next" })
    vim.keymap.set({ 'n' }, "<C-j>", "<cmd>cprev<CR>zz", { desc = "Quickfix count prev" })
    vim.keymap.set({ 'n' }, "<leader>k", "<cmd>lnext<CR>zz", { desc ="Quickfix line next" })
    vim.keymap.set({ 'n' }, "<leader>j", "<cmd>lprev<CR>zz", { desc = "Quickfix line prev" })
    vim.keymap.set({ 'n' }, "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "[S]ubstitute on current word" })
    vim.keymap.set({ 'n' }, "gf", ":edit <cfile><CR>", { desc = "[G]o to [F]ile" })
    vim.keymap.set({ 'n' }, "<leader>x", ":!xdg-open %<CR><CR>", { desc = "Open this buffer with [X]dg-open" })
    vim.keymap.set({ 'n' }, "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", { desc = "[F]ind tmux project" })
    vim.keymap.set('n', "<leader>xxx", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make e[X]exutable" })

    -- See `:help telescope.builtin`
    vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
    vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
    vim.keymap.set('n', '<leader>/', function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
    })
    end, { desc = '[/] Fuzzily search in current buffer]' })

    vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
    vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

    -- Diagnostic keymaps
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
    vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
    vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

    -- Remap for dealing with word wrap
    vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
    vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

    -- Set undo dir
    vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

    -- Harpoon remaps
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")

    vim.keymap.set("n", "<leader>ma", function() mark.add_file() end)
    vim.keymap.set("n", "<C-e>", function() ui.toggle_quick_menu() end)

    vim.keymap.set("n", "<leader>h", function() ui.nav_file(1) end)
    vim.keymap.set("n", "<leader>j", function() ui.nav_file(2) end)
    vim.keymap.set("n", "<leader>k", function() ui.nav_file(3) end)
    vim.keymap.set("n", "<leader>l", function() ui.nav_file(4) end)
    end

return M
