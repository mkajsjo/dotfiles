local k = vim.keymap.set
vim.g.mapleader = ' '

-- Pane switching
k('n', '<c-j>', '<c-w>j')
k('n', '<c-k>', '<c-w>k')
k('n', '<c-h>', '<c-w>h')
k('n', '<c-l>', '<c-w>l')

-- Clipboard copy/paste
k('n', '<c-p>', 'h"+p')
k('i', '<c-p>', '<esc>"+pa')
k('c', '<c-p>', '<c-r>+')
k('v', '<c-p>', '"+p')
k('v', '<c-y>', '"+y')

-- Substitute
k('v', 's', ':s/\\v%V')

-- Autocomplete navigation
k('i', '<c-t>', '<c-p>')
k('i', '<c-n>', '<c-n>')
k('x', '<c-t>', '<c-p>')
k('i', '<c-x><c-t>', '<c-x><c-p>')
--
-- Quickfix navigation
k('n', '<a-n>', '<cmd>cnext<CR>')
k('n', '<a-t>', '<cmd>cprevious<CR>')

-- No jumplist
k('n', '{', ":keepjumps normal '{'<CR>", { silent = true })
k('n', '}', ":keepjumps normal '}'<CR>", { silent = true })

-- Split/Join language constructs
k('n', 'gj', function () require('treesj').toggle() end)

-- Run Lua
k('n', '<space><space>x', '<cmd>source %<CR>')
k('n', '<space>x', '<cmd>:.lua<CR>')
k('v', '<space>x', '<cmd>:lua<CR>')

-- Fuzzy find
k('n', '<leader>t', '<cmd>FzfLua files<CR>')
k('n', '<leader>/', '<cmd>FzfLua live_grep_glob resume=true<CR>')
k('n', '<leader>q', '<cmd>FzfLua quickfix<CR>')
k('n', '<leader>gs', '<cmd>FzfLua git_status<CR>')
k('n', '<leader>*', '<cmd>FzfLua grep_cword<CR>')
k('v', '<leader>*', '<cmd>FzfLua grep_visual<CR>')

-- LSP
k('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>')
k('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
k('n', '<leader>h', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
k('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
k('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
k('n', 'gf', '<cmd>lua vim.lsp.buf.format { async = true }<CR>')
k('n', '<leader>c', '<cmd>lua vim.lsp.buf.code_action()<CR>')
k('v', '<leader>c', '<cmd>lua vim.lsp.buf.code_action()<CR>')
k('n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<CR>')
k('n', '<leader>d', '<cmd>lua vim.diagnostic.open_float(0, {scope="line"})<CR>')
