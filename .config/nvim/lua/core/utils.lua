-- core/utils.lua

local function center_str(str)
	local width = vim.api.nvim_win_get_width(0)
	local shift = math.floor(width / 2) - math.floor(string.len(str) / 2)
	return string.rep(' ', shift) .. str
end

local function interp(min, max, val)
	return math.max(max, math.min(min, val))
end

return {
	interp = interp,
	center_str = center_str,
}
