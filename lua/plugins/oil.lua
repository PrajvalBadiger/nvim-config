return {
    'stevearc/oil.nvim',
    dependencies = {
        {'nvim-tree/nvim-web-devicons', lazy = true},
    },

    keys = {
        { '<leader>o', '<cmd>lua require"oil".toggle_float()<CR>' },
    },

    opts = {
        default_file_explorer = false,
        columns = {
            "icon",
        },
        keymaps = {
            ["g?"] = "actions.show_help",
            ["<CR>"] = "actions.select",
            ["<C-v>"] = "actions.select_vsplit",
            ["<C-x>"] = "actions.select_split",
            ["<C-t>"] = "actions.select_tab",
            ["<C-p>"] = "actions.preview",
            ["q"] = "actions.close",
        },
        view_options = {
            show_hidden = true,
            is_hidden_file = function(name, bufnr)
                return vim.startswith(name, ".")
            end,
            is_always_hidden = function(name, bufnr)
                return false
            end,
            natural_order = false,
        },
        cleanup_delay_ms = 2000,
        skip_confirm_for_simple_edits = true,
        prompt_save_on_select_new_entry = true,
        float = {
            padding = 10,
            max_width = 80,
            max_height = 30,
            win_options = {
                winblend = 0,
            },
            override = function(conf)
                return conf
            end,
        },
    },

    config = true,
}

