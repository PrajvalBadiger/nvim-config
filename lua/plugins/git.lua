-- Git related plugins
local on_attach = function()
end

return {
    {
        "lewis6991/gitsigns.nvim",
        event = "BufReadPost",
        opts = {
            signs               = {
                untracked = { text = '' },
            },
            on_attach           = on_attach,
            signcolumn          = true, -- Toggle with `:Gitsigns toggle_signs`
            numhl               = true, -- Toggle with `:Gitsigns toggle_numhl`
            watch_gitdir        = {
                interval = 1000,
                follow_files = true
            },
            attach_to_untracked = true,
            current_line_blame  = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
            sign_priority       = 6,
            update_debounce     = 100,
            status_formatter    = nil,   -- Use default
            max_file_length     = 40000, -- Disable if file is longer than this (in lines)
        }
    },
    {
        "tpope/vim-fugitive",
        cmd = "Git",
        keys = {
            { "<leader>gs", vim.cmd.Git },
            { "<leader>gz", "<cmd>Ge:<CR>" },
        },
        config = function()
        end
    },
    {
        "ThePrimeagen/git-worktree.nvim",
        keys = {
            -- list git worktree
            {
                "<leader>wt",
                "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>",
                { silent = true, desc = 'List Git Worktree' },
            },
            -- create git worktree
            {
                "<leader>cwt",
                "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>",
                { silent = true, desc = 'Create Git Worktree' }
            },
        },
        config = function()
            require("git-worktree").setup()
            require("telescope").load_extension('git_worktree')
        end
    }
}
