-- NeoVim main settings
require "productive.settings"

-- Keymaps
require "productive.keymaps"

-- Autocommands -> See `:help lua-guide-autocommands` to update the section
require "productive.autocommands"

-- Lazy is used for lazy load packages and plugins
require "productive.lazyinit"

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et

local augroup = vim.api.nvim_create_augroup
local Productive = augroup("Productive", {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})

function R(name)
    require("plenary.reload").reload_module(name)
end

vim.filetype.add {
    extension = {
        templ = "templ",
    },
}

autocmd("TextYankPost", {
    group = yank_group,
    pattern = "*",
    callback = function()
        vim.highlight.on_yank {
            higroup = "IncSearch",
            timeout = 40,
        }
    end,
})

autocmd({ "BufWritePre" }, {
    group = Productive,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

autocmd("BufEnter", {
    group = Productive,
    callback = function()
        if vim.bo.filetype == "zig" then
            vim.cmd.colorscheme "tokyonight-night"
        else
            vim.cmd.colorscheme "rose-pine-moon"
        end
    end,
})

autocmd("LspAttach", {
    group = Productive,
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "gd", function()
            vim.lsp.buf.definition()
        end, opts)
        vim.keymap.set("n", "K", function()
            vim.lsp.buf.hover()
        end, opts)
        vim.keymap.set("n", "<leader>vws", function()
            vim.lsp.buf.workspace_symbol()
        end, opts)
        vim.keymap.set("n", "<leader>vd", function()
            vim.diagnostic.open_float()
        end, opts)
        vim.keymap.set("n", "<leader>vca", function()
            vim.lsp.buf.code_action()
        end, opts)
        vim.keymap.set("n", "<leader>vrr", function()
            vim.lsp.buf.references()
        end, opts)
        vim.keymap.set("n", "<leader>vrn", function()
            vim.lsp.buf.rename()
        end, opts)
        vim.keymap.set("i", "<C-h>", function()
            vim.lsp.buf.signature_help()
        end, opts)
        vim.keymap.set("n", "[d", function()
            vim.diagnostic.goto_next()
        end, opts)
        vim.keymap.set("n", "]d", function()
            vim.diagnostic.goto_prev()
        end, opts)
    end,
})
