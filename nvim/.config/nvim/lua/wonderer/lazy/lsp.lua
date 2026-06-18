return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
    },
    config = function()
        local cmp = require("cmp")
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities()
        )

        -- Configure gdscript using new API
        vim.lsp.config.gdscript = {
            capabilities = capabilities,
            cmd = vim.lsp.rpc.connect("127.0.0.1", 6005),
            root_markers = { "project.godot", ".git" },
            name = "Godot",
            on_attach = function(client, bufnr)
                -- Optional: Add keybindings specific to Godot
                local opts = { buffer = bufnr, noremap = true, silent = true }
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
            end,
        }

        -- Auto-detect and enable gdscript LSP when opening .gd files
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "gdscript",
            callback = function()
                vim.lsp.enable("gdscript")
            end,
        })

        require("fidget").setup({})
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                "zls",
                "pylsp",
                "clangd",
                -- Note: gdscript LSP comes from Godot itself, not Mason
                -- gdtoolkit in Mason is just a linter/formatter
            },
            handlers = {
                function(server_name)
                    -- Skip if already configured
                    if server_name == "zls" or server_name == "lua_ls" or server_name == "gdscript" then
                        return
                    end

                    local config = {
                        capabilities = capabilities,
                    }

                    if server_name == "clangd" then
                        config.cmd = {
                            "clangd",
                            "--clang-tidy",
                            "--query-driver=/usr/bin/clang++",
                            "--fallback-style=Google",
                        }
                        config.cmd_env = {
                            fallbackFlags = { "-std=c++23" },
                        }
                    end

                    vim.lsp.config[server_name] = config
                    vim.lsp.enable(server_name)
                end,

                ["zls"] = function()
                    vim.lsp.config.zls = {
                        capabilities = capabilities,
                        root_markers = { ".git", "build.zig", "zls.json" },
                        settings = {
                            zls = {
                                enable_inlay_hints = true,
                                enable_snippets = true,
                                warn_style = true,
                            },
                        },
                    }
                    vim.lsp.enable("zls")
                    vim.g.zig_fmt_parse_errors = 0
                    vim.g.zig_fmt_autosave = 0
                end,

                ["lua_ls"] = function()
                    vim.lsp.config.lua_ls = {
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                runtime = { version = "Lua 5.1" },
                                diagnostics = {
                                    globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
                                },
                            },
                        },
                    }
                    vim.lsp.enable("lua_ls")
                end,
            },
        })

        -- CMP Setup
        local cmp_select = { behavior = cmp.SelectBehavior.Select }
        cmp.setup({
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<A-q>"] = cmp.mapping.select_prev_item(cmp_select),
                ["<A-w>"] = cmp.mapping.select_next_item(cmp_select),
                ["<A-a>"] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = "copilot" },
                { name = "nvim_lsp" },
                { name = "luasnip" },
            }, {
                { name = "buffer" },
            }),
        })

        -- Diagnostic UI
        vim.diagnostic.config({
            virtual_text = true,
            signs = true,
            underline = true,
            update_in_insert = false,
            severity_sort = true,
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })


        -- -- CursorHold Popup
        -- vim.o.updatetime = 100
        -- vim.api.nvim_create_autocmd("CursorHold", {
        --     callback = function()
        --         vim.diagnostic.open_float(nil, {
        --             focusable = false,
        --             border = "rounded",
        --             source = "always",
        --             header = "",
        --             prefix = "",
        --         })
        --     end,
        -- })


    end,
}

