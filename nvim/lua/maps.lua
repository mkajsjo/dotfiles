local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '

--nnoremap <leader>h :call phpcd#JumpToDefinition('normal')<cr>
--nnoremap <leader>s :call phpcd#JumpToDefinition('split')<cr>
--nnoremap <leader>u :call phpcd#JumpBack()<cr>

-- Pane switching
map('n', '<c-j>', '<c-w>j', opts) 
map('n', '<c-k>', '<c-w>k', opts) 
map('n', '<c-h>', '<c-w>h', opts) 
map('n', '<c-l>', '<c-w>l', opts) 
map('t', '<c-j>h', '<c-\\><c-n><c-w>h', opts) 
map('t', '<c-k>j', '<c-\\><c-n><c-w>j', opts) 
map('t', '<c-h>k', '<c-\\><c-n><c-w>k', opts) 
map('t', '<c-l>l', '<c-\\><c-n><c-w>l', opts) 

map('t', '<esc>', '<c-\\><c-n>', opts) 

map('i', '<c-t>', '<c-p>', opts) 
map('i', '<c-n>', '<c-n>', opts) 
map('x', '<c-t>', '<c-p>', opts) 


-- Clipboard copy/paste
map('n', '<c-p>', 'h"+p', opts) 
map('i', '<c-p>', '<esc>"+pa', opts) 
map('c', '<c-p>', '<c-r>+', opts) 
map('v', '<c-p>', '"+p', opts) 
map('v', '<c-y>', '"+y', opts) 


-- Selection regex substitute
map('v', 's', ':s/\\v%V', {noremap = true, silent = false})


-- Folding maps
--map('n', '<tab>', 'za', opts) 
--map('n', '<s-tab>', 'zM', opts) 
--map('n', '<leader><tab>', 'zR', opts) 

--nnoremap <leader>a :call ToggleAtomBinary()<cr>
--nnoremap <leader>o :call ToggleCamelSnakeCase()<cr>

--nnoremap <c-g> :call ToggleList()<cr>
