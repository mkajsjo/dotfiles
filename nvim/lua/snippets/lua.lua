require 'luasnip.session.snippet_collection'.clear_snippets 'lua'

local ls = require 'luasnip'
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local fmt = require('luasnip.extras.fmt').fmt

ls.add_snippets('lua', {
    s(
        's',
        fmt(
            "s('<>', fmt('<>', { <> })),",
            { i(1, 'trig'), i(2), i(3) },
            { delimiters = '<>' }
        )
    ),
    s(
        'sm',
        fmt([=[
            s('<>', fmt([[
                <>
                ]],
                { <> }
            )),
            ]=],
            { i(1, 'trig'), i(2), i(3) },
            { delimiters = '<>' }
        )
    ),
})
