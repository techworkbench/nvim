return {
    {
        "theprimeagen/harpoon",
        config = function()
            local harpoon = require "harpoon"
            local ui = require "harpoon.ui"
            local mark = require "harpoon.mark"

            vim.keymap.set("n", "<leader>a", mark.add_file)
            vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)
            --vim.keymap.set("n", "<C-e>", function() harpoonUI:toggle_quick_menu() end)
            vim.keymap.set("n", "<leader>1", function()
                ui.nav_file(1)
            end)
            vim.keymap.set("n", "<leader>2", function()
                ui.nav_file(2)
            end)
            vim.keymap.set("n", "<leader>3", function()
                ui.nav_file(3)
            end)
            vim.keymap.set("n", "<leader>4", function()
                ui.nav_file(4)
            end)

            vim.keymap.set("n", "<leader>A", function()
                harpoon:list():prepend()
            end)
            --    vim.keymap.set("n", "<leader>a", function()
            --        harpoon:list():add()
            --    end)

            -- vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
            -- vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
            -- vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
            -- vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)
            -- vim.keymap.set("n", "<leader><C-h>", function()
            --     harpoon:list():replace_at(1)
            -- end)
            -- vim.keymap.set("n", "<leader><C-t>", function()
            --     harpoon:list():replace_at(2)
            -- end)
            -- vim.keymap.set("n", "<leader><C-n>", function()
            --     harpoon:list():replace_at(3)
            -- end)
            -- vim.keymap.set("n", "<leader><C-s>", function()
            --     harpoon:list():replace_at(4)
            -- end)
        end,
    },
}
