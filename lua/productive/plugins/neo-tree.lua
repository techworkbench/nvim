-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        version = "*",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        },
        cmd = "Neotree",
        keys = {
            { "\\", ":Neotree reveal<CR>", desc = "NeoTree reveal", silent = true },
        },
        opts = {
            filesystem = {
                window = {
                    mappings = {
                        ["\\"] = "close_window",
                    },
                },
            },
            sort_function = function(a, b)
                -- Simplified check if a path is in the 'notes' directory
                local function is_in_notes_directory(path)
                    return string.match(path, "/notes/") or string.match(path, "^notes/")
                end

                -- Get the modification time of a file
                local function get_mod_time(path)
                    local attributes = vim.loop.fs_stat(path)
                    return attributes and attributes.mtime.sec or 0
                end

                -- Prioritize directories over files
                if a.type ~= b.type then
                    return a.type == "directory"
                end

                local a_in_notes = is_in_notes_directory(a.path)
                local b_in_notes = is_in_notes_directory(b.path)

                -- If both nodes are files in 'notes' directories, sort by modification time
                if a_in_notes and b_in_notes and a.type ~= "directory" and b.type ~= "directory" then
                    return get_mod_time(a.path) > get_mod_time(b.path)
                end

                -- Default sort by name, assuming `name` property or similar is available
                -- You might need to extract the name from `a.path` and `b.path` if direct comparison is needed
                local a_name = a.path:match "^.+/(.+)$" or a.path
                local b_name = b.path:match "^.+/(.+)$" or b.path
                return a_name < b_name
            end,
        },
    },
}
