vim.opt.syntax = 'on'            -- Enable syntax for current buffer
vim.opt.number = false           -- Show no line number
vim.opt.laststatus = 2           -- Always show status line
vim.opt.lazyredraw = true        -- Don't update screen during macro playback
vim.opt.joinspaces = false       -- Don't autoinsert two spaces after join command
vim.opt.scrolloff = 3            -- Start scrolling 3 lines before edge of viewport
vim.opt.sidescrolloff = 3        -- Same as scrolloff but for columns
vim.opt.switchbuf = 'usetab'     -- Try to reuse windows/tabs when switching buffers
vim.opt.textwidth = 100          -- Automatically hard wrap at 100 columns
vim.opt.shellpipe = '>'          -- Don't leak grep to terminal
vim.opt.inccommand = 'nosplit'   -- Live update :substitute
vim.opt.belloff = 'all'          -- Never ring bell
vim.opt.splitbelow = true        -- Open horizontal splits below
vim.opt.splitright = true        -- Open vertical splits to the right
vim.opt.termguicolors = true     -- Use 256-bit colors if terminal supports it
vim.opt.virtualedit = 'block'    -- Allows cursor to move where there is no text in visual block mode
vim.opt.grepprg = 'rg --vimgrep' -- Use Ripgrep instead of grep
vim.opt.signcolumn = 'yes'       -- Always show sign column
vim.opt.ignorecase = true        -- Case-insensitive search
vim.opt.smartcase = true         -- Case-sensitive search if capital letter in search string
vim.opt.incsearch = true         -- Show matches while typing the search command
vim.opt.pumheight = 8            -- Height of completion menu

-- File
vim.opt.backup = false      -- Don't create backup files
vim.opt.writebackup = false -- Don't create backup files
vim.opt.swapfile = false    -- Don't create swap files
vim.opt.undofile = false    -- Don't create undo files

-- Indent
vim.opt.smarttab = true -- Indent/dedent in leading whitespace
vim.opt.shiftround = true -- Always indent by multiple of shiftwith
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.tabstop = 4 -- Number of spaces for tab key
vim.opt.softtabstop = 4 -- Number of spaces for tab key
vim.opt.shiftwidth = 4 -- Number of spaces for autoindent
vim.opt.breakindent = true -- Indent wrapped lines to match start
vim.opt.breakindentopt = 'shift:2' -- Indent wrapped lines once more
vim.opt.showbreak = '↳ ' -- Start wrapped lines with this prefix
vim.opt.linebreak = true -- Break wrapped lines at whole words

-- Show whitespace
vim.opt.list = true
vim.opt.listchars = 'nbsp:⦸,tab:▷▷'
