vim.treesitter.ft_to_lang = function(ft)
    return vim.treesitter.language.get_lang(ft) or ft
end

require("wonderer")

vim.opt.guicursor = "n-v-c:block,i:block-blinkwait300-blinkon200-blinkoff150"
vim.g.python3_host_prog = '/usr/bin/python3.13'


-- vim.o.cmdheight = 0

-- vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "CursorLine", { bg = "NONE" })

-- Prevent Alt + f from triggering any action in Insert mode
vim.api.nvim_set_keymap('i', '<A-f>', '<Esc>', { noremap = true, silent = true })

-- Prevent Alt + f from triggering any action in Normal mode (if needed)
vim.api.nvim_set_keymap('n', '<A-f>', '<Esc>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('i', '<Up>', '<NOP>', { noremap = true })
vim.api.nvim_set_keymap('i', '<Down>', '<NOP>', { noremap = true })
vim.api.nvim_set_keymap('i', '<Left>', '<NOP>', { noremap = true })
vim.api.nvim_set_keymap('i', '<Right>', '<NOP>', { noremap = true })

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "odin", "zig", "rust", "cpp", "typescript", "javascript", "c", "lua" },
    callback = function()
        pcall(vim.treesitter.start)
    end,
})

-- require("nvim-treesitter.configs").setup({
--   indent = { enable = false},
--
--   highlight = {
--       enable = false,
--       additional_vim_regex_highlighting = false,
--   },
--
--   injections = { enable = false },
-- })


-- local plugin
-- {
--   dir = "~/.config/nvim/lua", -- path to local plugin
--   name = "swapwords",
--   config = function()
--     local swap = require("swapwords")
--     vim.keymap.set("n", "gs", swap.swap_next, { desc = "Swap with next word" })
--     vim.keymap.set("n", "gS", swap.swap_prev, { desc = "Swap with previous word" })
--   end,
-- }


-- to run strudel go to the directory of strudify and then write "bun run /src/server.ts" now make any .js file and start writing code of music...
-- if #vim.api.nvim_list_uis() > 0 then
--     -- Auto-send to Strudel on save
--     vim.api.nvim_create_autocmd("BufWritePost", {
--         pattern = "*",
--         callback = function()
--             local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
--             local content = table.concat(lines, '\n')
--
--             -- Save to temp file
--             local temp_file = vim.fn.tempname()
--             vim.fn.writefile(lines, temp_file)
--
--             -- Send to Strudel server
--             local cmd = string.format('curl -s -X POST --data-binary @%s http://localhost:3000/update', temp_file)
--
--             vim.fn.jobstart(cmd, {
--                 on_exit = function(_, code)
--                     vim.fn.delete(temp_file)
--                     if code == 0 then
--                         print("🎵 Strudel updated!")
--                     else
--                         print("❌ Strudel server not responding")
--                     end
--                 end
--             })
--         end
--     })
--
--     print("🎵 Auto-Strudel enabled - save any file to update!")
-- end

