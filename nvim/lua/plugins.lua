local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd 'packadd packer.nvim'
end

-- Config ionide before setup
vim.g['fsharp#lsp_auto_setup'] = 0

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
    -- F# support
    use 'ionide/Ionide-vim'
    -- Cache stuff for faster startup
    use 'lewis6991/impatient.nvim'
    -- Fuzzy file finder
    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    -- fzf for telescope
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make'
    }
    -- open ui selects in telescope
    use 'nvim-telescope/telescope-ui-select.nvim'
    -- fzf
    use {
        "junegunn/fzf",
        run = ":call fzf#install()"
    }
    -- LSP config
    use 'neovim/nvim-lspconfig'
    -- better quickfix list
    use 'kevinhwang91/nvim-bqf'
    -- Better LSP diagnostics
    --use {
    --    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    --    config = function()
    --        require("lsp_lines").setup()
    --    end,
    --}
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
    -- Snippets
    use {
        'SirVer/ultisnips',
        config = function()
            vim.g.UltiSnipsExpandTrigger = '<tab>'
            vim.g.UltiSnipsJumpForwardTrigger = '<tab>'
            vim.g.UltiSnipsEditSplit = 'vertical'
            vim.g.UltiSnipsSnippetDirectories = { os.getenv('HOME') .. '/dev/dotfiles/ultisnips' }
        end
    }
    -- Default very magic search & better highlight
    use 'wincent/loupe'
    -- Grep
    use {
        'mileszs/ack.vim',
        config = function()
            vim.g.ackprg = 'rg --vimgrep --no-heading'
        end
    }
end)

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
    },
    indent = {
        enable = true,
    },
    autotag = {
        enable = true,
    },
}

require('telescope').setup({
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_cursor()
        }
    }
})
require('telescope').load_extension('fzf')
require('telescope').load_extension('ui-select')
