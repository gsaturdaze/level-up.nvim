local M = {}

function M.setup()
  -- Add quick line and block comment support
  require('Comment').setup()

  -- Configure telescope
  require('telescope').setup {
    defaults = {
      layout_strategy = 'flex',
      layout_config = {
        flex = { flip_columns = 200 },
      },
      mappings = {
        i = {
          ['<C-u>'] = false,
          ['<C-d>'] = false,
        },
      },
    },
    extensions = {
      file_browser = {
        -- theme = "ivy",
        hijack_netrw = true,
        mappings = {
          ['i'] = {
          },
          ['n'] = {
          },
        }
      }
    }
  }

  -- Enable telescope fzf native, if installed
  pcall(require('telescope').load_extension, 'fzf')
  pcall(require('telescope').load_extension, 'file_browser')

  require('which-key').setup()

  require('harpoon').setup()

  require('nvim-web-devicons').setup()

  require('transparent').setup {
    enable = false,
    extra_groups = { 'NormalFloat' },
    exclude = { },
  }

  require('fidget').setup {
    window = { blend = 0 },
  }
  -- Auto commands can go under here --

  -- Highlight on yank
  local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
  vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
      vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
  })

  -- Trim trailing whitespace
  local autoformat = vim.api.nvim_create_augroup('AutoFormat', { clear = true })
  vim.api.nvim_create_autocmd('BufWritePre', {
    group = autoformat,
    pattern = '*',
    command = [[%s/\s\+$//e]],
  })
end

return M
