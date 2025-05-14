local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd 'packadd packer.nvim'
end

require('packer').startup(function(use)
    -- Package manager
    use 'wbthomason/packer.nvim'
    -- Color scheme
    use {
        'folke/tokyonight.nvim',
        config = function()
            vim.g.tokyonight_style = 'storm'
            vim.cmd [[ colorscheme tokyonight ]]
        end
    }
    -- Cache stuff for faster startup
    use 'lewis6991/impatient.nvim'
    -- fzf
    use {
        "junegunn/fzf",
        run = ":call fzf#install()"
    }
    -- Fuzzy finder viewer
    use 'ibhagwan/fzf-lua'
    -- LSP
    use {
        'mason-org/mason.nvim',
        config = function()
            require('mason').setup()
        end,
    }
    use {
        'mason-org/mason-lspconfig.nvim',
        config = function()
            require("mason-lspconfig").setup {
                ensure_installed = { "lua_ls" },
            }
        end
    }
    -- Load nvim types for Lua LSP
    use {
        'folke/lazydev.nvim',
        ft = 'lua'
    }
    use 'neovim/nvim-lspconfig'
    -- better quickfix list
    use 'kevinhwang91/nvim-bqf'
    -- Treesitter
    use 'nvim-treesitter/nvim-treesitter'
    -- vim-tmux pane switching
    use 'christoomey/vim-tmux-navigator'
    -- Autocompletion engine
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'saadparwaiz1/cmp_luasnip',
        },
        config = function()
            local cmp = require('cmp')
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
                --sorting = {
                --    comparators = {
                --        function(entry1, entry2)
                --            local types = require('cmp.types')

                --            local variable = types.lsp.CompletionItemKind.Text
                --            local kind1 = entry1:get_kind() --- @type lsp.CompletionItemKind | number
                --            local kind2 = entry2:get_kind() --- @type lsp.CompletionItemKind | number
                --            if kind1 == variable and kind2 ~= variable then
                --                return true
                --            elseif kind2 == variable and kind1 ~= variable then
                --                return false
                --            end
                --            return nil
                --        end
                --    },
                --},
            }
        end
    }
    -- Fix repeat
    use 'tpope/vim-repeat'
    -- Change surround commands
    use 'tpope/vim-surround'
    -- Git wrapper
    use 'tpope/vim-fugitive'
    -- Default very magic search & better highlight
    use 'wincent/loupe'
    -- Copilot
    --use 'github/copilot.vim'
    -- Snippets
    use({
        "L3MON4D3/LuaSnip",
        tag = "v2.*",
        run = "make install_jsregexp"
    })
end)

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

-- Disable default syntax highlighting
vim.cmd('syntax off')

require('nvim-treesitter.configs').setup {
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
}

-- TODO figure out where to put this
require('fzf-lua').setup({
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
})
require("fzf-lua").register_ui_select()

require("fzf-list-definitions")

require("luasnip").config.set_config({
    history = true,
    updateevents = "TextChanged,TextChangedI",  -- Updates on text changes
    enable_autosnippets = true,
})
