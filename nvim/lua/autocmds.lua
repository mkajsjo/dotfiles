-- Remove trailing whitespaces on save
vim.cmd [[
    fun! StripTrailingWhitespaces()
        let l = line(".")
        let c = col(".")
        %s/\s\+$//e
        call cursor(l, c)
    endfun

    autocmd BufWritePre * :call StripTrailingWhitespaces()
]]

-- Format file on write
vim.api.nvim_create_autocmd('BufWritePre', { callback = function() vim.lsp.buf.format() end })

-- Return to last edit position when opening files
vim.api.nvim_create_autocmd('BufReadPost', { callback = function () vim.fn.setpos('.', vim.fn.getpos('\'"'))  end })

local dotnet_build = 'dotnet build --no-restore --nologo --verbosity:quiet --consoleLoggerParameters:NoSummary --consoleLoggerParameters:GenerateFullPaths-true'
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
    callback = function ()
        vim.opt_local.makeprg = vim.fn.getcwd() == captario_modeling_dir and dotnet_build .. modeling_project or dotnet_build
        vim.opt_local.errorformat = dotnet_build_errorformat
    end,
})

vim.api.nvim_create_autocmd('BufWinEnter', {
  pattern = '*',
  callback = function()
    -- Override red modules with tokyonight terminal green
    vim.api.nvim_set_hl(0, '@module.builtin', { fg = '#73DACA' })
  end
})
