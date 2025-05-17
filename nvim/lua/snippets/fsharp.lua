require 'luasnip.session.snippet_collection'.clear_snippets 'fsharp'

local ls = require 'luasnip'
local extras = require 'luasnip.extras'
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local f = ls.function_node
local rep = extras.rep
local fmt = require('luasnip.extras.fmt').fmt

local filename_without_extension = function()
    local filename = vim.fn.expand('%:t')
    return filename:match("^(.*)%.") or filename
end

ls.add_snippets('fsharp', {
    s('fn', fmt([[
        let {} ({}): {} =
            {}
        ]],
        { i(1), i(2), i(3), i(4) }
    )),
    s('p', fmt('printfn "{}: %A" {}', { rep(1), i(1) })),
    s('du', fmt([[
        type {} =
            | {}
        ]],
        { i(1), i(2) }
    )),
    s('!', fmt([[
        module {}


        ]],
        { f(filename_without_extension) }
    )),
    s('mem', fmt([[
        member _.{} ({}): {} =
            {}
        ]],
        { i(1), i(2), i(3), i(4) }
    )),
    s('stat', fmt([[
        static member {} ({}): {} =
            {}
        ]],
        { i(1), i(2), i(3), i(4) }
    )),
    s('try', fmt([[
        try
            {}
        with ex ->
            {}
        ]],
        { i(1), i(2) }
    )),
    s('todo', t 'failwith "TODO"'),
    s('fail', fmt('failwith "{}"', { i(1, 'TODO') })),
    s('panic', fmt('failwith "Panic! {}"', { i(1) })),
})
