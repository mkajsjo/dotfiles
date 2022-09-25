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
