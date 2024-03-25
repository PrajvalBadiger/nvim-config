-- Fancier statusline
return {
    "nvim-lualine/lualine.nvim",
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
        { 'nvim-tree/nvim-web-devicons', lazy = true },
    },
    config = function()
        local colorscheme = require("helpers.colorscheme")
        local lualine_theme = colorscheme == "default" and "auto" or colorscheme
        require("lualine").setup({
            options = {
                icons_enabled = true,
                theme = lualine_theme,
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
                always_divide_middle = true,
                globalstatus = true,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                },
                sections = {
                    lualine_a = { 'mode' },
                    lualine_b = { 'branch', 'diff', 'diagnostics' },
                    lualine_c = { 'filename' },
                    lualine_x = { 'arduino_status' },
                    lualine_y = { 'filetype' },
                    lualine_z = { 'progress' }
                },
                extensions = { 'quickfix', 'fugitive' }
            },
        })
    end,
}
