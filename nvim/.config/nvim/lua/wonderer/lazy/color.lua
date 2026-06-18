-- Plugin setup using lazy.nvim
function ColorMyPencils(color)
    color = color or "nordfox"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
    -- {
    --     "rose-pine/neovim",
    --     name = "rose-pine",
    --     priority = 1000,
    --     config = function()
    --         require("rose-pine").setup({
    --             disable_background = true,
    --         })
    --
    --         function ColorMyPencils(color)
    --             color = color or "rose-pine"
    --             vim.cmd.colorscheme(color)
    --
    --             vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    --             vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    --         end
    --
    --         ColorMyPencils()
    --     end,
    -- },


    -- {
    --     "folke/tokyonight.nvim",
    --     name = "tokyonight",
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         require("tokyonight").setup({
    --             transparent = true, -- equivalent to disable_background
    --             style = "storm",    -- you can pick: "storm", "moon", "night", "day"
    --         })
    --
    --         function ColorMyPencils(color)
    --             color = color or "tokyonight"
    --             vim.cmd.colorscheme(color)
    --
    --             vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    --             vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    --         end
    --
    --         ColorMyPencils()
    --     end,
    -- }



    {
        "EdenEast/nightfox.nvim",
        name = "nightfox",
        lazy = false,
        priority = 1000,
        config = function()
            require("nightfox").setup({
                options = {
                    transparent = true,   -- remove background like disable_background
                    -- dim_inactive = true,  -- dim inactive windows
                    styles = {
                        comments = "italic",
                        keywords = "bold",
                        types = "italic,bold",
                    },
                },
            })

            function ColorMyPencils(color)
                color = color or "nordfox" -- can also try "duskfox", "nordfox", "terafox", "carbonfox"
                vim.cmd.colorscheme(color)

                vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
                vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
            end

            ColorMyPencils()
        end,
    }



    -- {
    --     "catppuccin/nvim",
    --     name = "catppuccin",
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         require("catppuccin").setup({
    --             flavour = "mocha",       -- latte, frappe, macchiato, mocha
    --             transparent_background = true,
    --             -- dim_inactive = {
    --             --     enabled = true,
    --             --     shade = "dark",
    --             --     percentage = 0.15,   -- how much to dim inactive windows
    --             -- },
    --             styles = {
    --                 comments = { "italic" },
    --                 keywords = { "bold" },
    --                 types = { "italic", "bold" },
    --             },
    --         })
    --
    --         function ColorMyPencils(color)
    --             color = color or "catppuccin"
    --             vim.cmd.colorscheme(color)
    --
    --             vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    --             vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    --         end
    --
    --         ColorMyPencils()
    --     end,
    -- }




    -- {
    --     "shaunsingh/nord.nvim",
    --     lazy = false,
    --     priority = 1000,
    --     config = function()
    --         -- Just apply the colorscheme - no setup() needed
    --         vim.cmd.colorscheme("nord")
    --
    --         -- Clear background for common highlight groups
    --         local groups = {
    --             "Normal",
    --             "NormalFloat",
    --             -- "NormalNC",
    --             -- "LineNr",
    --             "SignColumn",
    --             -- "CursorLine",
    --             -- "CursorLineNr",
    --             "StatusLine",
    --             "StatusLineNC",
    --             -- "EndOfBuffer",
    --             -- "Folded",
    --             -- "FoldColumn",
    --             -- "Pmenu",
    --             -- "PmenuSel",
    --             -- "FloatBorder",
    --             -- "TelescopeNormal",
    --             -- "TelescopeBorder"
    --         }
    --
    --         for _, group in ipairs(groups) do
    --             vim.api.nvim_set_hl(0, group, { bg = "none" })
    --         end
    --
    --         -- Set terminal background to black
    --         vim.api.nvim_set_hl(0, "Terminal", { bg = "#000000" })
    --     end
    -- },
}
