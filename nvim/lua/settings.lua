local opt = vim.opt
local cmd = vim.cmd

local indent = 4

-- General settings
opt.syntax        = 'on'     -- Syntax highlighting
opt.termguicolors = true     -- Use 256-bit colors
opt.splitbelow    = true     -- Open horizontal splits below
opt.splitright    = true     -- Open vertical splits to the right
opt.number        = false    -- No line number
opt.cursorline    = false    -- No cursor line
opt.laststatus    = 2        -- Always show status line
opt.lazyredraw    = true     -- Don't update screen during macro playback
opt.joinspaces    = false    -- Don't autoinsert spaces after join command
opt.scrolloff     = 3        -- Start scrolling 3 lines before edge of viewport
opt.sidescrolloff = 3        -- Same as scrolloff but for colums
opt.switchbuf     = 'usetab' -- Try to reuse windows/tabs when switching buffers
opt.textwidth     = 100      -- Automatically hard wrap at 100 columns
opt.shellpipe     = '>'      -- Don't leak grep to terminal
opt.inccommand    = 'nosplit'-- Live update :substitute
opt.belloff       = 'all'    -- Never ring bell

-- Line break settings
opt.breakindent   = true     -- Indent wrapped lines to match start
opt.breakindentopt= 'shift:2'-- Indent wrapped lines once more


-- File settings
opt.backup        = false    -- Don't create backup files
opt.writebackup   = false    -- Don't create backup files
opt.swapfile      = false    -- Don't create swap files
opt.undofile      = false    -- Don't create undo files

-- Tab settings
opt.smarttab      = true     -- Indent/dedent in leading whitespace
opt.shiftround    = true     -- Always indent by multiple of shiftwidth
opt.expandtab     = true     -- Convert tabs to spaces
opt.tabstop       = indent   -- Number of spaces for tab key
opt.softtabstop   = indent   -- Number of spaces for tab key
opt.shiftwidth    = indent   -- Number of spaces for autoindent

-- Whitespace settings
opt.list      = true
opt.listchars = 'nbsp:⦸'
opt.listchars = opt.listchars + 'tab:▷▷'

