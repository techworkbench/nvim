return {
    "toppair/peek.nvim",
    event = { "VeryLazy" },
    build = "deno task --quiet build:fast",
    config = function()
        require("peek").setup {
            filetype = { "markdown", "conf" },
            update_on_change = true,
        }
        vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
        vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})

        vim.keymap.set("n", "<leader>po", "<cmd>PeekOpen<cr>")
        vim.keymap.set("n", "<leader>po", "<cmd>PeekClose<cr>")
    end,
}
