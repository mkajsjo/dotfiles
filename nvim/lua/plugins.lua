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
    -- LSP config
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
        },
        config = function()
            local cmp = require('cmp')
            cmp.setup {
                completion = {
                    autocomplete = false
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
                    { name = 'nvim_lsp' },
                    { name = 'path' },
                }
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
    use 'github/copilot.vim'
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
