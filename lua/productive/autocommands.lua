-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`
-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("productive-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- vim.api.nvim_create_autocmd("ChangeCodeBlockColor", {
--     desc = "Update code color from white to something more suttle",
--     group = vim.api.nvim_create_augroup("color-change-code", { clear = true }),
--     callback = function()
--         vim.cmd "highlight Function ctermfg=green guifg=#CDCDCD"
--     end,
-- })

