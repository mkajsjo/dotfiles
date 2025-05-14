
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
        'mason-org/mason.nvim',
        -- LSP config
        'neovim/nvim-lspconfig',
        -- lspconfig integration
        {
            'mason-org/mason-lspconfig.nvim',
            opts = {
                ensure_installed = { 'lua_ls' }
            }
        },
        -- Load nvim types for Lua LSP
        {
            'folke/lazydev.nvim',
            ft = 'lua'
        }
    },
    -- better quickfix list
    'kevinhwang91/nvim-bqf',
    -- vim-tmux pane switching
    'christoomey/vim-tmux-navigator',
    -- Treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        opts = {
            ensure_installed = {
                'c',
                'lua',
                'c_sharp',
                'rust',
                'typescript',
                'haskell',
                'erlang',
                'python'
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
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'saadparwaiz1/cmp_luasnip',
        },
        config = function()
            local cmp = require 'cmp'
            cmp.setup {
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },
                completion = {
                    --autocomplete = false,
                    completeopt = 'menu,menuone,noselect',
                },
                mapping = {
                    ['<C-t>'] = cmp.mapping.select_prev_item(),
                    ['<C-n>'] = function()
                        if not cmp.visible() then
                            cmp.complete()
                        end
                        cmp.select_next_item()
                    end,
                    ['<C-e>'] = cmp.mapping.close(),
                    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<CR>'] = cmp.mapping.confirm {
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true
                    },
                },
                sources = {
                    { name = 'luasnip' },
                    { name = 'nvim_lsp' },
                    --{ name = 'path' },
                },
                experimental = {
                    ghost_text = { enabled = true },  -- Enable ghost text for snippets
                },
            }
        end
    },
    -- Change surround commands
    {
        "kylechui/nvim-surround",
        event = "VeryLazy",
    },
    -- Snippets
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        run = "make install_jsregexp"
    },
    -- Git commands
    -- TODO replace? 'tpope/vim-fugitive'
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
