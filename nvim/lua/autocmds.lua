local cmd = vim.cmd

-- Remove trailing whitespaces on save
cmd [[
    fun! StripTrailingWhitespaces()
        let l = line(".")
        let c = col(".")
        %s/\s\+$//e
        call cursor(l, c)
    endfun

    autocmd BufWritePre * :call StripTrailingWhitespaces()
]]

-- Return to last edit position when opening files
cmd [[
    autocmd BufReadPost * call setpos('.', getpos("'\""))
]]

vim.api.nvim_create_autocmd(
    "BufWritePre",
    { pattern = '*.fs', command = ':lua vim.lsp.buf.format { async = false }'}
)

-- Switch :make to 'dotnet build' for F# files
vim.api.nvim_create_autocmd("FileType", {
    pattern = "fsharp",
    callback = function ()
        if vim.fn.getcwd() == "/home/mkajsjo/dev/Captario-SUM/module-modeling" then
            vim.opt_local.makeprg = "dotnet build --no-restore --nologo --verbosity:quiet --consoleLoggerParameters:NoSummary --consoleLoggerParameters:GenerateFullPaths-true ./src/modeling-api/modeling-api.fsproj"
        else
            vim.opt_local.makeprg = "dotnet build --no-restore --nologo --verbosity:quiet --consoleLoggerParameters:NoSummary --consoleLoggerParameters:GenerateFullPaths-true"
        end

        -- Set errorformat to parse dotnet build output
        vim.opt_local.errorformat = table.concat({
            "%f(%l\\,%c): %trror %m",   -- For error lines
            "%f(%l\\,%c): %tarning %m", -- For warning lines
            "%-G%.%#",                  -- Ignore any lines that don't match
        }, ",")

    end,
})
