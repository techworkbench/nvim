function ColorMyPencils(color)
	color = color or "rose-pine-moon"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
    -- {
    --     "folke/tokyonight.nvim",
    --     lazy = false,
    --     opts = {},
    --     config = function()
    --         ColorMyPencils()
    --     end
    -- },
    -- {
    --     "ellisonleao/gruvbox.nvim",
    --     name = "gruvbox",
    --     config = function()
    --         require("gruvbox").setup({
    --             terminal_colors = true, -- add neovim terminal colors
    --             undercurl = true,
    --             underline = false,
    --             bold = true,
    --             italic = {
    --                 strings = false,
    --                 emphasis = false,
    --                 comments = false,
    --                 operators = false,
    --                 folds = false,
    --             },
    --             strikethrough = true,
    --             invert_selection = false,
    --             invert_signs = false,
    --             invert_tabline = false,
    --             invert_intend_guides = false,
    --             inverse = true, -- invert background for search, diffs, statuslines and errors
    --             contrast = "", -- can be "hard", "soft" or empty string
    --             palette_overrides = {},
    --             overrides = {},
    --             dim_inactive = false,
    --             transparent_mode = false,
    --         })
    --     end,
    -- },

    { 
        -- You can easily change to a different colorscheme.
        -- Change the name of the colorscheme plugin below, and then
        -- change the command in the config to whatever the name of that colorscheme is.
        --
        -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
        "folke/tokyonight.nvim",
        priority = 1000, -- Make sure to load this before all the other start plugins.
        config = function()
            ---@diagnostic disable-next-line: missing-fields
            require("tokyonight").setup {
                style = "night", -- this selects the tokyonight variant
                transparent = true,
                terminal_colors = true,
                styles = {
                    comments = { italic = false }, -- Disable italics in comments
                    sidebars = "dark", -- style for sidebars
                    foats = "dark", -- style for floating windows
                },
            }
    
            -- Load the colorscheme here.
            -- Like many other themes, this one has different styles, and you could load
            -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
            -- vim.cmd.colorscheme "tokyonight-night"
    
            -- Transparent Background : used aside from the configured by the setup
            -- turn this on if needed
            -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })   
        end,
    },    


    {
        "rose-pine/neovim",
        name = "rose-pine",
        priority = 1000, -- Make sure to load this before all the other start plugins.
        config = function()
          ---@diagnostic disable-next-line: missing-fields
          require("rose-pine").setup {
            style = "moon",
            transparent = true,
            terminal_colors = true,
            disable_background = true,
            styles = {
              comments = { italic = false }, -- Disable italics in comments
            },
          }
    
          -- Load the colorscheme here.
          -- Like many other themes, this one has different styles, and you could load
          -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.      
        --   vim.cmd.colorscheme "rose-pine"
    
          -- Transparent Background
        --   vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        --   vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })        
            ColorMyPencils();
        end,
    },

    -- {
    --     "rose-pine/neovim",
    --     name = "rose-pine",
    --     config = function()
    --         require('rose-pine').setup({
    --             disable_background = true,
    --             styles = {
    --                 italic = false,
    --             },
    --         })

    --         ColorMyPencils();
    --     end
    -- },
}