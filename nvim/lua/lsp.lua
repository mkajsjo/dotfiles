local servers = {
    --'csharp_ls',
    --'omnisharp',
    'eslint',
    'ts_ls',
    'pylsp',
    'rls',
    'lua_ls',
    'hls',
    'fsautocomplete',
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    underline = true,
    signs = true,
})

local sumneko_root_path = os.getenv('HOME') .. '/Programs/lua-language-server'
local sumneko_binary = sumneko_root_path .. '/bin/lua-language-server'

local configs = {
    rls = {
        settings = {
            rust = {
                unstable_features = true,
                build_on_save = false,
                all_features = true,
            },
        },
    },
    fsautocomplete = {
        cmd = { 'fsautocomplete', '--adaptive-lsp-server-enabled' },
        on_init = function(client, _)
            client.server_capabilities.semanticTokensProvider = nil  -- turn off semantic tokens
        end,
    },
    hls = {
        settings = {
            haskell = {
                formattingProvider = 'ormolu'
            }
        }
    },
}

-- User configurations for all servers.
local config_defaults = {
    --capabilities = require("cmp_nvim_lsp").default_capabilities(),
}

-- Setup configurations
for _, lsp in ipairs(servers) do
    local config = configs[lsp] or {}
    config = vim.tbl_extend("keep", config, config_defaults)
    vim.lsp.enable(lsp)
end
