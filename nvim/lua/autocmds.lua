-- Remove trailing whitespaces on write
vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
        local view = vim.fn.winsaveview()
        vim.cmd [[keepjumps %s/\s\+$//e]]
        vim.fn.winrestview(view)
    end,
})

-- Format file on write
vim.api.nvim_create_autocmd('BufWritePre', { callback = function() vim.lsp.buf.format() end })

-- Return to last edit position when opening files
vim.api.nvim_create_autocmd('BufReadPost', { command = 'normal! g`"' })

local dotnet_build = table.concat({
    'dotnet build',
    '--no-restore',
    '--nologo',
    '--verbosity:quiet',
    '--consoleLoggerParameters:NoSummary',
    '--consoleLoggerParameters:GenerateFullPaths-true',
}, ' ')
local captario_modeling_dir = '/home/mkajsjo/dev/Captario-SUM/module-modeling'
local modeling_project = ' ./src/modeling-api/modeling-api.fsproj'
local dotnet_build_errorformat = table.concat({
    '%f(%l\\,%c): %trror %m[%.%#',   -- For error lines
    '%f(%l\\,%c): %tarning %m[%.%#', -- For warning lines
    '%-G%.%#',                       -- Ignore any lines that don't match
}, ",")

-- Switch :make to 'dotnet build' for F# files
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'fsharp',
    callback = function()
        vim.opt_local.makeprg =
            vim.fn.getcwd() == captario_modeling_dir
            and dotnet_build .. modeling_project
            or dotnet_build
        vim.opt_local.errorformat = dotnet_build_errorformat
    end,
})

-- Override treesitter @module.builtin from red to tokyonight terminal green
vim.api.nvim_create_autocmd('BufWinEnter', {
    callback = function() vim.api.nvim_set_hl(0, '@module.builtin', { fg = '#73DACA' }) end
})
