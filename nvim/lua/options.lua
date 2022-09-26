local opt = vim.opt
local indent = 4

opt.syntax = 'on'              -- Enable syntax for current buffer
opt.number = false             -- Show no line number
opt.laststatus = 2             -- Always show status line
opt.lazyredraw = true          -- Don't update screen during macro playback
opt.joinspaces = false         -- Don't autoinsert two spaces after join command
opt.scrolloff = 3              -- Start scrolling 3 lines before edge of viewport
opt.sidescrolloff = 3          -- Same as scrolloff but for columns
opt.switchbuf = 'usetab'       -- Try to reuse windows/tabs when switching buffers
opt.textwidth = 100            -- Automatically hard wrap at 100 columns
opt.shellpipe = '>'            -- Don't leak grep to terminal
opt.inccommand = 'nosplit'     -- Live update :substitute
opt.belloff = 'all'            -- Never ring bell
opt.splitbelow = true          -- Open horizontal splits below
opt.splitright = true          -- Open vertical splits to the right
opt.termguicolors = true       -- Use 256-bit colors if terminal supports it
opt.virtualedit = 'block'      -- Allows cursor to move where there is no text in visual block mode
opt.grepprg = 'rg --vimgrep'   -- Use Ripgrep instead of grep
opt.signcolumn = 'yes'         -- Always show sign column

-- File
opt.backup = false             -- Don't create backup files
opt.writebackup = false        -- Don't create backup files
opt.swapfile = false           -- Don't create swap files
opt.undofile = false           -- Don't create undo files

-- Indent
opt.smarttab = true            -- Indent/dedent in leading whitespace
opt.shiftround = true          -- Always indent by multiple of shiftwith
opt.expandtab = true           -- Convert tabs to spaces
opt.tabstop = indent           -- Number of spaces for tab key
opt.softtabstop = indent       -- Number of spaces for tab key
opt.shiftwidth = indent        -- Number of spaces for autoindent
opt.breakindent = true         -- Indent wrapped lines to match start
opt.breakindentopt = 'shift:2' -- Indent wrapped lines once more
opt.showbreak = '↳ '           -- Start wrapped lines with this prefix

-- Show whitespace
opt.list = true
opt.listchars = 'nbsp:⦸,tab:▷▷'
