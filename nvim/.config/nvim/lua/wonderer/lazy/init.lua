return {

    -- {
    --   "folke/snacks.nvim",
    --   priority = 1000,
    --   lazy = false,
    --   ---@type snacks.Config
    --   opts = {
    --     -- your configuration comes here
    --     -- or leave it empty to use the default settings
    --     -- refer to the configuration section below
    --     image = { enable = true },
    --     -- bigfile = { enabled = true },
    --     -- dashboard = { enabled = true },
    --     -- explorer = { enabled = true },
    --     -- indent = { enabled = true },
    --     -- input = { enabled = true },
    --     -- picker = { enabled = true },
    --     -- notifier = { enabled = true },
    --     -- quickfile = { enabled = true },
    --     -- scope = { enabled = true },
    --     -- scroll = { enabled = true },
    --     -- statuscolumn = { enabled = true },
    --     -- words = { enabled = true },
    --   },
    -- },

    {
        "vyfor/cord.nvim",
        -- ---@type CordConfig
        -- opts = {
        --     -- ...
        -- }
    },

    {
        "nvim-lua/plenary.nvim",
        name = "plenary"
    },

    {
        "eandrju/cellular-automaton.nvim",
    },

    {
        "folke/flash.nvim",
        event = "VeryLazy",
        ---@type Flash.Config
        opts = {},
        -- stylua: ignore
        keys = {
            { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
            { "Z", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
            { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
            { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
        },
    },

    -- {
    --     "sphamba/smear-cursor.nvim",
    --
    --     opts = {
    --         -- Smear cursor when switching buffers or windows.
    --         smear_between_buffers = true,
    --
    --         -- Smear cursor when moving within line or to neighbor lines.
    --         -- Use `min_horizontal_distance_smear` and `min_vertical_distance_smear` for finer control
    --         smear_between_neighbor_lines = true,
    --
    --         -- Draw the smear in buffer space instead of screen space when scrolling
    --         scroll_buffer_space = true,
    --
    --         -- Set to `true` if your font supports legacy computing symbols (block unicode symbols).
    --         -- Smears will blend better on all backgrounds.
    --         legacy_computing_symbols_support = false,
    --
    --         -- Smear cursor in insert mode.
    --         -- See also `vertical_bar_cursor_insert_mode` and `distance_stop_animating_vertical_bar`.
    --         smear_insert_mode = true,
    --     },
    -- },

    -- {
    --     "zbirenbaum/copilot-cmp",
    --     event = "InsertEnter",
    --     config = function () require("copilot_cmp").setup() end,
    --     dependencies = {
    --         "zbirenbaum/copilot.lua",
    --         cmd = "Copilot",
    --         config = function()
    --             require("copilot").setup({
    --                 suggestion = {
    --                     enabled = false,
    --                     auto_trigger = true,
    --                     debounce = 75,
    --                 },
    --                 panel = { enabled = true },
    --             })
    --         end,
    --     },
    -- },
}


