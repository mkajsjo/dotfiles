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
vim.keymap.set('n', '<leader>n', ':nohlsearch<CR>')

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
vim.keymap.set('n', '{', ":keepjumps normal '{'<CR>", { silent = true })
vim.keymap.set('n', '}', ":keepjumps normal '}'<CR>", { silent = true })

-- Split/Join language constructs
vim.keymap.set('n', 'gj', function() require('treesj').toggle() end)

-- Run Lua
vim.keymap.set('n', '<space><space>x', '<cmd>source %<CR>')
vim.keymap.set('n', '<space>x', '<cmd>:.lua<CR>')
vim.keymap.set('v', '<space>x', '<cmd>:lua<CR>')

-- Fuzzy find
vim.keymap.set('n', '<leader>t', '<cmd>FzfLua files<CR>')
vim.keymap.set('n', '<leader>/', '<cmd>FzfLua live_grep_glob resume=true<CR>')
vim.keymap.set('n', '<leader>q', '<cmd>FzfLua quickfix<CR>')
vim.keymap.set('n', '<leader>gs', '<cmd>FzfLua git_status<CR>')
vim.keymap.set('n', '<leader>*', '<cmd>FzfLua grep_cword<CR>')
vim.keymap.set('v', '<leader>*', '<cmd>FzfLua grep_visual<CR>')

-- LSP
vim.keymap.set('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>')
vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
vim.keymap.set('n', '<leader>h', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
vim.keymap.set('n', 'gf', '<cmd>lua vim.lsp.buf.format { async = true }<CR>')
vim.keymap.set('n', '<leader>c', '<cmd>lua vim.lsp.buf.code_action()<CR>')
vim.keymap.set('v', '<leader>c', '<cmd>lua vim.lsp.buf.code_action()<CR>')
vim.keymap.set('n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<CR>')
vim.keymap.set('n', '<leader>d', '<cmd>lua vim.diagnostic.open_float(0, {scope="line"})<CR>')
