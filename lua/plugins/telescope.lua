-- Telescope fuzzy finding (all the things)
return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make", cond = vim.fn.executable("make") == 1 },
    },
    config = function()
        require("telescope").setup({
            defaults = {
                winblend = 0,

                layout_strategy = "horizontal",
                layout_config = {
                    width = 0.95,
                    height = 0.85,
                    -- preview_cutoff = 120,
                    prompt_position = "top",

                    horizontal = {
                        preview_width = function(_, cols, _)
                            if cols > 200 then
                                return math.floor(cols * 0.4)
                            else
                                return math.floor(cols * 0.6)
                            end
                        end,
                    },

                    vertical = {
                        width = 0.9,
                        height = 0.95,
                        preview_height = 0.5,
                    },

                    flex = {
                        horizontal = {
                            preview_width = 0.9,
                        },
                    },
                },
                selection_strategy = "reset",
                sorting_strategy = "ascending",
                scroll_strategy = "cycle",
            },
        })

        -- Enable telescope fzf native, if installed
        pcall(require("telescope").load_extension, "fzf")

        local builtin = require('telescope.builtin')
        local map = require("helpers.keys").map
        map("n", "<leader>fr", builtin.oldfiles, "Recently opened")
        map("n", "<leader><space>", builtin.buffers, "Open buffers")
        map("n", "<leader>/", function()
            -- You can pass additional configuration to telescope to change theme, layout, etc.
            builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
                winblend = 0,
                previewer = false,
            }))
        end, "Search in current buffer")

        map("n", "<leader>pf", builtin.find_files, "Files")
        map("n", "<leader>vh", builtin.help_tags, "Help")
        map("n", "<leader>pg", builtin.live_grep, "Grep")
        map("n", "<leader>pd", builtin.diagnostics, "Diagnostics")
        map("n", "<leader>km", builtin.keymaps, "Search keymaps")
        map('n', '<C-p>', builtin.git_files, "Git files")
        map('n', '<leader>pws', function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end, "Grep word")
        map('n', '<leader>pWs', function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end, "Grep whole word")
        map('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end, "Builtin grep")
    end,
}
