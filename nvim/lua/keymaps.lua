vim.g.mapleader = ' '

-- Pane switching
vim.keymap.set('n', '<c-j>', '<c-w>j')
vim.keymap.set('n', '<c-k>', '<c-w>k')
vim.keymap.set('n', '<c-h>', '<c-w>h')
vim.keymap.set('n', '<c-l>', '<c-w>l')

-- Clipboard copy/paste
vim.keymap.set('n', '<c-p>', 'h"+p')
vim.keymap.set('i', '<c-p>', '<esc>"+pa')
vim.keymap.set('c', '<c-p>', '<c-r>+')
vim.keymap.set('v', '<c-p>', '"+p')
vim.keymap.set('v', '<c-y>', '"+y')

-- Substitute
vim.keymap.set('v', 's', ':s/\\v%V')

-- Remove search highlights
vim.keymap.set('n', '<leader>n', '<cmd>nohlsearch<CR>')

-- Autocomplete navigation
vim.keymap.set('i', '<c-t>', '<c-p>')
vim.keymap.set('i', '<c-n>', '<c-n>')
vim.keymap.set('x', '<c-t>', '<c-p>')
vim.keymap.set('i', '<c-x><c-t>', '<c-x><c-p>')
--
-- Quickfix navigation
vim.keymap.set('n', '<a-n>', '<cmd>cnext<CR>')
vim.keymap.set('n', '<a-t>', '<cmd>cprevious<CR>')

-- No jumplist
vim.keymap.set('n', '{', "<cmd>keepjumps normal '{'<CR>", { silent = true })
vim.keymap.set('n', '}', "<cmd>keepjumps normal '}'<CR>", { silent = true })

-- Split/Join language constructs
vim.keymap.set('n', 'gj', function() require('treesj').toggle() end)

-- Run Lua
vim.keymap.set('n', '<space><space>x', '<cmd>source %<CR>')
vim.keymap.set('n', '<space>x', '<cmd>.lua<CR>')
vim.keymap.set('v', '<space>x', ':lua<CR>')

-- Fuzzy find
vim.keymap.set('n', '<leader>t', function() require("fzf-lua").files() end)
vim.keymap.set('n', '<leader>/', function() require("fzf-lua").live_grep_glob { resume = true } end)
vim.keymap.set('n', '<leader>q', function() require("fzf-lua").quickfix() end)
vim.keymap.set('n', '<leader>gs', function() require("fzf-lua").git_status() end)
vim.keymap.set('n', '<leader>*', function() require("fzf-lua").grep_cword() end)
vim.keymap.set('v', '<leader>*', function() require("fzf-lua").grep_visual() end)

-- LSP
vim.keymap.set('n', 'gh', function() vim.lsp.buf.hover() end)
vim.keymap.set('n', 'gr', function() vim.lsp.buf.references() end)
vim.keymap.set('n', '<leader>h', function() vim.lsp.buf.signature_help() end)
vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end)
vim.keymap.set('n', 'gD', function() vim.lsp.buf.declaration() end)
vim.keymap.set('n', 'gf', function() vim.lsp.buf.format { async = true } end)
vim.keymap.set('n', '<leader>c', function() vim.lsp.buf.code_action() end)
vim.keymap.set('v', '<leader>c', function() vim.lsp.buf.code_action() end)
vim.keymap.set('n', '<leader>r', function() vim.lsp.buf.rename() end)
vim.keymap.set('n', '<leader>d', function() vim.diagnostic.open_float() end)

-- Git
vim.keymap.set('n', '<leader>gb', function() require('gitsigns').blame({ ignore_whitespace = true }) end)
vim.keymap.set('n', '<leader>gq', function() require('gitsigns').setqflist() end)
vim.keymap.set('n', '<leader>gd', function() require('gitsigns').diffthis() end)
vim.keymap.set('n', '<leader>gh', function() require('gitsigns').stage_hunk() end)

-- Snippets
vim.keymap.set({ 'i', 's' }, '<c-l>', function()
    local ls = require 'luasnip'
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end)
vim.keymap.set({ 'i', 's' }, '<c-h>', function()
    local ls = require 'luasnip'
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end)
vim.keymap.set('i', '<c-j>', function()
    local ls = require 'luasnip'
    if ls.choice_active() then
        ls.change_choice(1)
    end
end)
vim.keymap.set('i', '<c-k>', function()
    local ls = require 'luasnip'
    if ls.choice_active() then
        ls.change_choice(-1)
    end
end)
