local plugins = {
    -- Colorscheme
    {
        'folke/tokyonight.nvim',
        lazy = false,
        priority = 1000,
        init = function()
            vim.cmd 'colorscheme tokyonight-storm'
        end,
    },
    -- Fuzzy finder
    {
        'ibhagwan/fzf-lua',
        lazy = false,
        opts = {
            winopts = {
                preview = {
                    layout = 'vertical',
                    vertical = 'right:60%',
                    horizontal = 'up:70%',
                },
            },
            quickfix = {
                winopts = {
                    preview = {
                        layout = 'horizontal',
                    },
                },
            },
        },
        config = function()
            local fzf = require 'fzf-lua'
            fzf.setup {}
            fzf.register_ui_select()
        end,
    },
    -- LSP
    {
        -- LSP installer
        {
            'mason-org/mason.nvim',
            opts = {}
        },
        -- LSP config
        'neovim/nvim-lspconfig',
        -- Load nvim types for Lua LSP
        {
            'folke/lazydev.nvim',
            ft = 'lua',
            opts = {}
        }
    },
    -- better quickfix list
    'kevinhwang91/nvim-bqf',
    -- vim-tmux pane switching
    {
        'christoomey/vim-tmux-navigator',
        event = "VimEnter",
    },
    -- Treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        version = false,
        opts = {
            sync_install = false,
            ensure_installed = {
                'c',
                'lua',
                'c_sharp',
                'rust',
                'typescript',
                'haskell',
                'erlang',
                'python',
                'markdown',
                'vimdoc',
            },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = {
                enable = true,
            },
            autotag = {
                enable = true,
            },
        },
        config = function(_, opts)
            local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
            parser_config.fsharp = {
                install_info = {
                    url = 'https://github.com/ionide/tree-sitter-fsharp',
                    branch = 'main',
                    files = { 'src/scanner.c', 'src/parser.c' },
                    location = "fsharp"
                },
                requires_generate_from_grammar = false,
                filetype = 'fsharp',
            }

            require("nvim-treesitter.configs").setup(opts)
        end,
    },
    -- Autocompletion engine
    {
        'saghen/blink.cmp',
        version = '1.*',
        dependencies = { 'L3MON4D3/LuaSnip', version = 'v2.*' },
        opts = {
            keymap = {
                ['<C-t>'] = { 'insert_prev', 'fallback' },
                ['<C-n>'] = { 'show', 'insert_next', 'fallback', },
                ['<C-e>'] = { 'cancel', 'fallback' },
                ['<Tab>'] = { 'accept', 'fallback' },
                ['<S-Tab>'] = { 'fallback' },
            },
            snippets = { preset = 'luasnip' },
            sources = {
                default = { 'snippets', 'lazydev', 'lsp' },
                providers = {
                    lazydev = {
                        name = 'LazyDev',
                        module = 'lazydev.integrations.blink',
                        priority = 1000
                    },
                },
            },
            -- Displays a preview of the selected item on the current line
            completion = {
                ghost_text = {
                    enabled = true,
                    show_without_selection = true,
                },
                menu = { auto_show = false },
            },
        },
    },
    -- Change surround commands
    {
        "kylechui/nvim-surround",
        opts = {}
    },
    -- Snippets
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        run = "make install_jsregexp",
        opts = {
            history = true
        },
        init = function()
            for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/snippets/*.lua", true)) do
                loadfile(ft_path)()
            end

            vim.api.nvim_create_user_command('Snippets', function()
                vim.cmd('vsplit ' .. vim.fn.stdpath('config') .. '/lua/snippets/' .. vim.bo.filetype .. '.lua')
            end, {})
        end,
    },
    -- Split/Join language constructs
    {
        'Wansmer/treesj',
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
    },
    -- Git integration
    {
        'lewis6991/gitsigns.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim'
        },
        lazy = false,
        opts = {
            signs = {
                add = { text = "┃" },
                change = { text = "┃" },
                delete = { text = "▁" },
                topdelete = { text = "▔" },
                changedelete = { text = "┃" },
                untracked = { text = "┃" },
            }
        },
    },
    -- Default very magic search & better highlight
    -- TODO do I need anything from this anymore? 'wincent/loupe'
}

require('lazy').setup {
    spec = plugins,
    -- Don't automatically check for plugin updates
    checker = { enabled = false },
    -- colorscheme that will be used when installing plugins.
    install = { colorscheme = { 'tokyonight-storm' } },
}
