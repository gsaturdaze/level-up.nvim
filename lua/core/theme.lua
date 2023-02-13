local M = {}

local theme = 'onedark'

function M.setup()
  require('lualine').setup {
    options = {
      icons_enabled = false,
      theme = theme,
      component_separators = '|',
      section_separators = '',
    },
  }

  require('indent_blankline').setup {
    char = '┊',
    show_trailing_blankline_indent = false,
  }

  require('gitsigns').setup {
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
  }

  vim.cmd.colorscheme(theme)
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  -- @TODO add fix for adding transparency back to NormalFloat when existing
  -- transparency mode ie. :TransparentDisable
end

return M
