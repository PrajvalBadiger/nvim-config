local opts = {
    nu = true,
    rnu = true,

    tabstop = 4,
    shiftwidth = 4,
    softtabstop = 4,
    expandtab = true,
    smartindent = true,

    wrap = false,

    swapfile = false,
    backup = false,
    undofile = true,
    undodir = os.getenv("HOME") .. "/.vim/undodir",

    hlsearch = false,
    incsearch = true,

    termguicolors = true,
    scrolloff = 8,

    signcolumn = "auto",

    updatetime = 50,

    splitright = true,
    splitbelow = true,
    cursorline = false,
    laststatus = 3,

    list = false,
    mouse = "a",
    autoread = true,
    --  guicursor = ""
    --  colorcolumn = "80",
}

-- Set options from table
for opt, val in pairs(opts) do
    vim.o[opt] = val
end

-- Set other options
local colorscheme = require("helpers.colorscheme")
vim.cmd.colorscheme(colorscheme)
