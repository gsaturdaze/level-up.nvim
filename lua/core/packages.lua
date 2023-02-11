return function(use)
    -- LSP configuration & plugins
    use {
        "neovim/nvim-lspconfig",
        requires = {
            -- Automatically install LSP services to stdpath for neovim
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",

            -- Useful status updates for LSP
            "j-hui/fidget.nvim",

            -- Additional lua configuration
            "folke/neodev.nvim",
        },
    }

    -- Autocompetion
    use {
        "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-nvim-lua",

            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        },
    }

    -- Build syntax tree
    use {
        "nvim-treesitter/nvim-treesitter",
        fun = function()
            pcall(require("nvim-treesitter.install").update{ with_sync = true })
        end,
    }

    -- Additional text objects via treesitter
    use {
        "nvim-treesitter/nvim-treesitter-textobjects",
        after = "nvim-treesitter",
    }

    -- Git plugins
    use "tpope/vim-fugitive"
    use "lewis6991/gitsigns.nvim"

    -- File navigation
    use "theprimeagen/harpoon"

    -- File history tool
    use "mbbill/undotree"

    -- Fuzzy finder
    use {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        requires = {
            "nvim-lua/plenary.nvim"
        }
    }

    -- Fuzzy finder algorithm
    use {
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make",
        cond = vim.fn.executable("make") == 1,
    }

    -- File browser extension
    use "nvim-telescope/telescope-file-browser.nvim"

    -- Theme(s)
    use "navarasu/onedark.nvim"
    use "shaunsingh/nord.nvim"
    use "ellisonleao/gruvbox.nvim"
    use "rose-pine/neovim"

    -- Status bar
    use "nvim-lualine/lualine.nvim"

    -- Indentation guides
    use "lukas-reineke/indent-blankline.nvim"

    -- Comment visual regions & lines
    use "numToStr/Comment.nvim"

    -- Detect tabstop and shiftwidth automatically
    use "tpope/vim-sleuth"

    use "folke/which-key.nvim"

    use "junegunn/goyo.vim"
    use "junegunn/limelight.vim"

    use "xiyaowong/nvim-transparent"

    use 'nvim-tree/nvim-web-devicons'

    use 'christoomey/vim-tmux-navigator'
end
