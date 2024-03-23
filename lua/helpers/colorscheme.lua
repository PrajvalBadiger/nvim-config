-- Fetch and setup colorscheme if available, otherwise just return 'default'
-- This should prevent Neovim from complaining about missing colorschemes on first boot
local function get_if_available(name, opts)
	local lua_ok, colorscheme = pcall(require, name)
	if lua_ok then
		colorscheme.setup(opts)
		return name
	end

	local vim_ok, _ = pcall(vim.cmd.colorscheme, name)
	if vim_ok then
		return name
	end

	return "default"
end

local opts = {
	undercurl = true,
	underline = true,
	bold = true,
	italic = {
		strings = true,
		comments = true,
		operators = false,
		folds = true,
	},
	strikethrough = true,
	invert_selection = true,
	invert_signs = true,
	invert_intend_guides = true,
	inverse = true,
	transparent_mode = true,
}

-- Uncomment the colorscheme to use
-- local colorscheme = get_if_available("catppuccin")
local colorscheme = get_if_available('gruvbox', opts)
-- local colorscheme = get_if_available('rose-pine')

return colorscheme
