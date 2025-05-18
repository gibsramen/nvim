-- Much of this taken from https://lsp-zero.netlify.app/docs/getting-started.html
return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "L3MON4D3/LuaSnip",
    },
    config = function()
        -- Reserve a space in the gutter
        -- This will avoid an annoying layout shift in the screen
        vim.opt.signcolumn = 'yes'

        local lspconfig_defaults = require('lspconfig').util.default_config
        lspconfig_defaults.capabilities = vim.tbl_deep_extend(
            'force',
            lspconfig_defaults.capabilities,
            require('cmp_nvim_lsp').default_capabilities()
        )

        -- This is where you enable features that only work
        -- if there is a language server active in the file
        vim.api.nvim_create_autocmd('LspAttach', {
            desc = 'LSP actions',
            callback = function(event)
                local opts = {buffer = event.buf}

                vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
                vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
                vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
                vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
                vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
                vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
                vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
            end,
        })

        local cmp = require('cmp')
        cmp.setup({
            sources = {
                {name = 'nvim_lsp'},
            },
            snippet = {
                expand = function(args)
                    -- Not required with 0.10 but since we use 0.9 over SSH
                    -- we need to use luasnip.
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({}),
        })

        -- Apparently no way to easily set the border for all floating windows
        -- https://vonheikemen.github.io/devlog/tools/neovim-lsp-client-guide/
        vim.diagnostic.config({
            float = { border = "rounded" },
            virtual_text = true
        })
        vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
            vim.lsp.handlers.hover,
            {border = 'rounded'}
        )
        vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
            vim.lsp.handlers.signature_help,
            {border = 'rounded'}
        )

        -- Default server handler
        require('mason-lspconfig').setup({
            handlers = {
                function(server_name)
                    require('lspconfig')[server_name].setup({})
                end,
            }
        })

        ------------------------------------------------------
        -- SERVER SPECIFIC CONFIGS
        ------------------------------------------------------
        local lspconfig = require("lspconfig")
        lspconfig.pyright.setup({
            -- Used to ignore pyright hints (e.g. import not accessed)
            -- https://github.com/microsoft/pyright/discussions/5852
            capabilities = {
                textDocument = {
                    publishDiagnostics = {
                        tagSupport = {
                            valueSet = { 2 },
                        },
                    },
                },
            },
            settings = {
                -- Use pyright for type info, ruff for everything else
                disableLanguageServices = true,
            }
        })
        lspconfig.ruff.setup({})
        ------------------------------------------------------
    end,
}

