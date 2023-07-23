local opts = { noremap = true, silent = false }

local silent_normal = function(lhs, rhs)
    vim.api.nvim_set_keymap('n', lhs, rhs, { noremap = true, silent = true })
end

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

-- No jumplist
silent_normal('{', ":keepjumps normal '{'<CR>")
silent_normal('}', ":keepjumps normal '}'<CR>")

-- backwards completion
insert('<c-x><c-t>', '<c-x><c-p>')

--
-- TELESCOPE
--

normal('<leader>t', '<cmd>Telescope find_files<CR>')
normal('gs', '<cmd>Telescope git_status<CR>')

--
-- LSP
--

normal('gh', '<cmd>lua vim.lsp.buf.hover()<CR>')
normal('gr', '<cmd>lua vim.lsp.buf.references()<CR>')
normal('<leader>h', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
normal('gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
normal('gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
normal('gf', '<cmd>lua vim.lsp.buf.format { async = true }<CR>')
normal('<leader>c', '<cmd>lua vim.lsp.buf.code_action()<CR>')
visual('<leader>c', '<cmd>lua vim.lsp.buf.code_action()<CR>')
normal('<leader>r', '<cmd>lua vim.lsp.buf.rename()<CR>')
--normal('<leader>d', '<cmd>lua require("lsp_lines").toggle()<CR>')
normal('<leader>d', '<cmd>lua vim.diagnostic.open_float(0, {scope="line"})<CR>')
normal('<a-n>', '<cmd>lua vim.diagnostic.goto_next()<CR>')
normal('<a-t>', '<cmd>lua vim.diagnostic.goto_prev()<CR>')

