local keys = {
    { "<leader>a", function() require("harpoon"):list():append() end, desc = "harpoon file", },
    {
        "<leader>h",
        function()
            local harpoon = require("harpoon")
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "harpoon quick menu",
    },
}

-- Add the ability to select a specific entry in the list
for i = 1, 5, 1 do
    table.insert(keys, { "<leader>" .. i, function() require("harpoon"):list():select(i) end })
end

return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = keys,
    config = function()
        require("harpoon"):setup()
    end,
}
