local wibox = require("wibox")
local awful = require("awful")
local naughty = require("naughty")

battery_widget = wibox.widget.textbox()
battery_widget:set_align("right")
battery_widget:set_font("JetBrainsMono Nerd Font 10")
battery_widget.forced_height = 30

local is_10 = false

function update_battery(widget)
	local fd = io.popen("~/.config/i3blocks/battery3")
	local status = fd:read("*all")
	fd:close()

	status = tonumber(status)

	local battery = " " .. status .. " "
	if status == 100 then
		battery = "<span background='lime' color='black'> " .. battery .. "</span>"
	elseif status >= 90 then
		battery = "<span background='lime' color='black'> " .. battery .. "</span>"
	elseif status >= 80 then
		battery = "<span background='lime' color='black'> " .. battery .. "</span>"
	elseif status >= 70 then
		battery = "<span background='green' color='black'> " .. battery .. "</span>"
	elseif status >= 60 then
		battery = "<span background='green' color='black'> " .. battery .. "</span>"
	elseif status >= 50 then
		battery = "<span background='green' color='black'> " .. battery .. "</span>"
	elseif status >= 40 then
		battery = "<span background='yellow' color='black'> " .. battery .. "</span>"
	elseif status >= 30 then
		battery = "<span background='yellow' color='black'> " .. battery .. "</span>"
	elseif status >= 20 then
		battery = "<span background='yellow' color='black'> " .. battery .. "</span>"
	elseif status >= 10 then
		battery = "<span background='yellow' color='black'> " .. battery .. "</span>"
	else
		battery = "<span background='red' color='black'> " .. battery .. "</span>"
	end

	if status <= 10 then
		if not is_10 then
			is_10 = true	
			naughty.notify({
				title = "Low Battery",
				border_width = 0,
				text = "Please connect your laptop to charger soon",
				ontop = true,
				timeout = 0,
				position = "top_right",
				icon_size = 200,
				icon = os.getenv("HOME") .. "/.config/awesome/astro.jpg",
				preset = naughty.config.presets.critical,
			})
		end
	else
		if is_10 then
			is_10 = false
		end
	end
 
	widget:set_markup(battery)
end
 
update_battery(battery_widget)

local battery_t = awful.tooltip {
	objects = { battery_widget },
	timer_function = function()
		local fd = io.popen("~/.config/i3blocks/batstatus")
		local charge_status = fd:read("*all")
		fd:close()
		return charge_status
	end
}
 
mytimer = timer({ timeout = 0.2 })
mytimer:connect_signal("timeout", function () update_battery(battery_widget) end)
mytimer:start()
