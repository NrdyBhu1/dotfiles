-- lua/ned.lua

local modes = {
  ["n"] = {
	  name = "NORMAL",
	  hi = "StatusLineNormalMode",
  },
  ["no"] = {
	  name = "NORMAL",
	  hi = "StatusLineNormalMode",
  },
  ["v"] = {
	  name = "VISUAL",
	  hi = "StatusLineNormalMode",
  },
  ["V"] = {
	  name = "VISUAL LINE",
	  hi = "StatusLineNormalMode",
  },
  ["^V"] = {
	  name = "VISUAL BLOCK",
	  hi = "StatusLineNormalMode",
  },
  ["s"] = {
	  name = "SELECT",
	  hi = "StatusLineNormalMode",
  },
  ["S"] = {
	  name = "SELECT LINE",
	  hi = "StatusLineNormalMode",
  },
  ["^S"] = {
	  name = "SELECT BLOCK",
	  hi = "StatusLineNormalMode",
  },
  ["i"] = {
	  name = "INSERT",
	  hi = "StatusLineInsertMode",
  },
  ["ic"] = {
	  name = "INSERT",
	  hi = "StatusLineInsertMode"
  },
  ["R"] = {
	  name = "REPLACE",
	  hi = "StatusLineNormalMode",
  },
  ["Rv"] = {
	  name = "VISUAL REPLACE",
	  hi = "StatusLineNormalMode",
  },
  ["c"] = {
	  name = "COMMAND",
	  hi = "StatusLineCommandMode",
  },
  ["cv"] = "VIM EX",
  ["ce"] = "EX",
  ["r"] = "PROMPT",
  ["rm"] = "MOAR",
  ["r?"] = "CONFIRM",
  ["!"] = "SHELL",
  ["t"] = "TERMINAL",
}

local function get_mode()
	local fmode = {}
	local mode = modes[vim.api.nvim_get_mode().mode]
	table.insert(fmode, "%#"..mode.hi.."Inverse#")
	table.insert(fmode, "%#"..mode.hi.."#")
	table.insert(fmode, ' '..mode.name..' ')
	table.insert(fmode, "%#"..mode.hi.."Inverse#")
end


local function ned()
	vim.opt.showmode = false
	-- vim.opt.statusline = get_mode()
	--[[ vim.api.nvim_exec([[
		augroup Statusline
		au!
		au WinEnter,BufEnter * setlocal statusline=%{}
		au WinLeave,BufLeave * setlocal statusline=%!v:lua.ned.inactive()
		au WinEnter,BufEnter,FileType NvimTree setlocal statusline=%!v:lua.Statusline.short()
		augroup END ]]-- , false) ]]
end

return {
	ned = ned,
	get_mode = get_mode
}
