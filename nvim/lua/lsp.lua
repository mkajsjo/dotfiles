-- Configurations for all servers
local default_config = {
    capabilities = require('blink.cmp').get_lsp_capabilities()
}

-- Configurations for specific servers
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
        cmd = {
            'fsautocomplete',
            '--adaptive-lsp-server-enabled',
            '--background-service-enabled',
            '--project-graph-enabled',
        },
        settings = {
            FSharp = {
                ExcludeProjectDirectories = { '.git', 'bin', 'obj' },
                KeywordsAutocomplete = true,
            }
        }
    },
    hls = {
        settings = {
            haskell = {
                formattingProvider = 'ormolu'
            }
        }
    },
    eslint = {},
    ts_ls = {},
    pylsp = {},
    lua_ls = {},
}

-- Setup configurations
for server_name, config in pairs(configs) do
    local server_config = vim.tbl_extend('force', default_config, config)
    vim.lsp.config(server_name, server_config)
    vim.lsp.enable(server_name)
end

vim.diagnostic.config({
    severity_sort = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = '',
            [vim.diagnostic.severity.WARN] = '',
            [vim.diagnostic.severity.HINT] = '',
            [vim.diagnostic.severity.INFO] = '',
        },
    }
})
