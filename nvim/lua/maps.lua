local opts = { noremap = true, silent = true }

local normal = function(lhs, rhs)
    vim.api.nvim_set_keymap('n', lhs, rhs, opts)
end

local insert = function(lhs, rhs)
    vim.api.nvim_set_keymap('i', lhs, rhs, opts)
end

local visual = function(lhs, rhs)
    vim.api.nvim_set_keymap('v', lhs, rhs, opts)
end

local xvisual = function(lhs, rhs)
    vim.api.nvim_set_keymap('x', lhs, rhs, opts)
end

local command = function(lhs, rhs)
    vim.api.nvim_set_keymap('c', lhs, rhs, opts)
end

--
-- GENERAL
--

vim.g.mapleader = ' '

-- Pane switching
normal('<c-j>', '<c-w>j')
normal('<c-k>', '<c-w>k')
normal('<c-h>', '<c-w>h')
normal('<c-l>', '<c-w>l')

-- Clipboard copy/paste
normal('<c-p>', 'h"+p')
insert('<c-p>', '<esc>"+pa')
command('<c-p>', '<c-r>+')
visual('<c-p>', '"+p')
visual('<c-y>', '"+y')

-- Substitute
visual('s', ':s/\\v%V')

-- Autocomplete navigation
insert('<c-t>', '<c-p>')
insert('<c-n>', '<c-n>')
xvisual('<c-t>', '<c-p>')

--
-- TELESCOPE
--

normal('<leader>t', '<cmd>Telescope find_files<cr>')

--
-- LSP
--

normal('gh', '<cmd>lua vim.lsp.buf.hover()<CR>')
normal('gr', '<cmd>lua vim.lsp.buf.references()<CR>')
normal('<leader>h', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
normal('gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
normal('gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
normal('gf', '<cmd>lua vim.lsp.buf.formatting()<CR>')
normal('<leader>c', ':Telescope lsp_code_actions<CR>')
visual('<leader>c', '<cmd>lua vim.lsp.buf.range_code_action()<CR>')
normal('<leader>r', '<cmd>lua vim.lsp.buf.rename()<CR>')
normal('<leader>d', '<cmd>lua vim.diagnostic.open_float({scope="line"})<CR>')
