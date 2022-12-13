-- lua/zed.lua
-- TODO: make proper UI
local utils = require('core.utils')
local buf, win
local result
local opts
local filename = ''
local noresults = true

local function create_window()
	buf = vim.api.nvim_create_buf(false, true)
	local width = vim.api.nvim_get_option("columns")
	local height = vim.api.nvim_get_option("lines")
	
	local win_height = math.ceil(height * 0.8 - 4)
	local win_width = math.ceil(width * 0.8)
	local row = math.ceil((height - win_height) / 2 - 1)
	local col = math.ceil((width - win_width) / 2)
	opts = {
		style = "minimal",
		relative = "editor",
		width = win_width + 2,
		height = win_height + 2,
		row = row - 1,
		col = col - 1,
		border = "double"
	}
	win = vim.api.nvim_open_win(buf, true, opts)
	vim.opt.cursorline = true
end

local function update_view()
	vim.api.nvim_buf_set_option(buf, 'modifiable', true)
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, {utils.center_str('Zed')})
	result = vim.fn.systemlist('/usr/bin/env fd '..filename)
	if #result == 0 then 
		table.insert(result, 'No Results found!') 
	else
		noresults = false
	end
	for k,v in pairs(result) do
		result[k] = '  '..result[k]
	end
	vim.api.nvim_buf_set_lines(buf, 2, -1, false, {'  Find file: '..filename})
	vim.api.nvim_buf_set_lines(buf, 2, -1, false, {' '})
	vim.api.nvim_buf_set_lines(buf, 4, -1, false, result)
	vim.api.nvim_buf_set_option(buf, 'modifiable', false)
end

local function map_bindings()
	local bindings = {
		['<cr>'] = 'open_file()',
		q = 'close_window()',
		h = 'move_cursor(0, -1)',
		j = 'move_cursor(1, 0)',
		k = 'move_cursor(-1, 0)',
		l = 'move_cursor(0, 1)',
	}
	for key,func in pairs(bindings) do
		vim.api.nvim_buf_set_keymap(buf, 'n', key, ':lua require"zed".'..func..'<cr>', {
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
	if noresults == false then
		file = vim.api.nvim_get_current_line()
		close_window()
		vim.api.nvim_command('edit '..file)
	end
end

local function move_cursor(y, x)
	if noresults == false then
		local pos = vim.api.nvim_win_get_cursor(win)
		pos[2] = interp(2, string.len(result[pos[1]-2])+2, pos[2] + x)
		pos[1] = interp(2, #result-2, pos[1] + y)
		vim.api.nvim_win_set_cursor(win, pos)
	end
end

local function zed(fname)
	filename = '"'..fname..'"'
	create_window()
	map_bindings()
	update_view()
	vim.api.nvim_win_set_cursor(win, { 4, 2 })
end

return {
	zed = zed,
	open_file = open_file,
	close_window = close_window,
	update_view = update_view,
}
