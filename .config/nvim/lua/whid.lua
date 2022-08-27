-- lua/whid.lua
-- TODO: create proper structure
local utils = require('core.utils')
local buf, win
local result
local fileinfo = {}
local word = ''

local function create_window()
	buf = vim.api.nvim_create_buf(false, true)
	-- vim.api.nvim_buf_set_name(buf, "Whid")
	-- vim.api.nvim_buf_set_option(buf, 'cursorline', true)
	local width = vim.api.nvim_get_option("columns")
	local height = vim.api.nvim_get_option("lines")
	
	local win_height = math.ceil(height * 0.8 - 4)
	local win_width = math.ceil(width * 0.8)
	local row = math.ceil((height - win_height) / 2 - 1)
	local col = math.ceil((width - win_width) / 2)
	local opts = {
		style = "minimal",
		relative = "editor",
		width = win_width + 2,
		height = win_height + 2,
		row = row - 1,
		col = col - 1,
		border = "rounded"
	}
	vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')
	vim.api.nvim_buf_set_option(buf, 'filetype', 'whid')
	win = vim.api.nvim_open_win(buf, true, opts)
	vim.opt.cursorline = true
end

local function create_mappings()
	-- mapping table
	local mappings = {
		['<cr>'] = 'open_file()',
		q = 'close_window()',
		h = 'move_cursor(-1, 0)',
		j = 'move_cursor(0, 1)',
		k = 'move_cursor(0, -1)',
		l = 'move_cursor(1, 0)',
	}
	for key,func in pairs(mappings) do
		vim.api.nvim_buf_set_keymap(buf, 'n', key, ':lua require"whid".'..func..'<cr>', {
			nowait = true, noremap = true, silent = true
		})
	end
	local other_chars = {
		'a', 'b', 'c', 'd', 'e', 'f', 'g', 'n', 'o', 'p', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'i', 'r'
	}
	for k,v in ipairs(other_chars) do
		vim.api.nvim_buf_set_keymap(buf, 'n', v, '', { nowait = true, noremap = true, silent = true })
		vim.api.nvim_buf_set_keymap(buf, 'n', v:upper(), '', { nowait = true, noremap = true, silent = true })
		vim.api.nvim_buf_set_keymap(buf, 'n',  '<c-'..v..'>', '', { nowait = true, noremap = true, silent = true })
	end
end

local function close_window()
	vim.api.nvim_win_close(win, true)
end

local function open_file()
	local str = vim.api.nvim_get_current_line()
	close_window()
	for i in string.gmatch(str, '([^:]+)') do
		table.insert(fileinfo, i)
	end
	vim.api.nvim_command('edit '..fileinfo[1])
	vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), {tonumber(fileinfo[2]), 4})
end

local function update_view()
	vim.api.nvim_buf_set_option(buf, 'modifiable', true)
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, {utils.center_str('Whid')})
	result = vim.fn.systemlist('/usr/bin/env ag '..word)
	if #result == 0 then table.insert(result, 'No Results found!!') end
	for k,v in pairs(result) do
		result[k] = '  '..result[k]
	end
	vim.api.nvim_buf_set_lines(buf, 2, -1, false, {'  Find: '..word})
	vim.api.nvim_buf_set_lines(buf, 2, -1, false, {' '})
	vim.api.nvim_buf_set_lines(buf, 4, -1, false, result)
	vim.api.nvim_buf_set_option(buf, 'modifiable', false)
end

local function move_cursor(x, y)
	local new_posy = utils.interp(3+#result, 4, vim.api.nvim_win_get_cursor(win)[1] + y)
	local new_posx = math.max(2, vim.api.nvim_win_get_cursor(win)[2] + x)
	vim.api.nvim_win_set_cursor(win, {new_posy, new_posx})
end

local function whid(wrd)
	word = '"'..wrd..'"'
	create_window()
	create_mappings()
	update_view()
	vim.api.nvim_win_set_cursor(win, {4, 4})
end

return {
	whid = whid,
	close_window = close_window,
	move_cursor = move_cursor,
	open_file = open_file,
}
