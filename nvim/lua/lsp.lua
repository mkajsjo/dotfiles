local servers = {
    'csharp_ls',
    --'omnisharp',
    'eslint',
    'tsserver',
    'pylsp',
    'rls',
    --'sumneko_lua',
    'hls',
    'fsautocomplete'
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
    tsserver = {
        capabilities = {
            document_formatting = false
        },
        on_attach = function(client)
            client.server_capabilities.document_formatting = false
        end
    },
    rls = {
        settings = {
            rust = {
                unstable_features = true,
                build_on_save = false,
                all_features = true,
            },
        },
    },
    sumneko_lua = {
        cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
        settings = {
            Lua = {
                runtime = {
                    -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                    version = 'LuaJIT',
                    -- Setup your lua path
                    path = vim.split(package.path, ';'),
                },
                diagnostics = {
                    -- Get the language server to recognize the `vim` global
                    globals = { 'vim' },
                },
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = {
                        [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                        [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                    },
                    checkThirdParty = false,
                },
            },
        },
    },
    hls = {
        settings = {
            haskell = {
                formattingProvider = 'ormolu'
            }
        }
    },
    --omnisharp = {
    --    --cmd = { "dotnet", "/home/mkajsjo/.omnisharp/OmniSharp.dll" },
    --    enable_editorconfig_support = true,
    --    enable_ms_build_load_projects_on_demand = false,
    --    enable_roslyn_analyzers = false,
    --    organize_imports_on_format = false,
    --    enable_import_completion = false,
    --    sdk_include_prereleases = true,
    --    analyze_open_documents_only = false,
    --}
}

-- User configurations for all servers.
local config_defaults = {
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
}

-- Setup configurations
for _, lsp in ipairs(servers) do
    local config = configs[lsp] or {}
    config = vim.tbl_extend("keep", config, config_defaults)
    require('lspconfig')[lsp].setup(config)
end
