-- Miscelaneous fun stuff
return {
    -- Comment with haste
    {
	"numToStr/Comment.nvim",
	event = "BufReadPre",
    	opts = {},
    },
    {
    	"tpope/vim-surround", -- Surround stuff with the ys-, cs-, ds- commands
    	event = "BufReadPre",
    },
}
