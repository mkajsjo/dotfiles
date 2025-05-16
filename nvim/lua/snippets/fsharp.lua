require 'luasnip.session.snippet_collection'.clear_snippets 'fsharp'

local ls = require 'luasnip'
local extras = require 'luasnip.extras'
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local rep = extras.rep
local fmt = require('luasnip.extras.fmt').fmt

ls.add_snippets('fsharp', {
    s(
        'fn',
        fmt([[
let {} ({}): {} =
    {}
]],
            { i(1), i(2), i(3), i(4) }
        )
    ),
    s('p', fmt('printfn "{}: %A" {}', { rep(1), i(1) })),
    s(
        'du',
        fmt([[
type {} =
    | {}
]],
            { i(1), i(2) }
        )
    ),
})
