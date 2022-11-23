local wibox = require("wibox")
local awful = require("awful")
 
volume_widget = wibox.widget.textbox()
volume_widget:set_align("right")
volume_widget:set_font("JetBrainsMono Nerd Font 10")

function update_volume(widget)
	local fd = io.popen("~/.config/i3blocks/volume2")
	local status = fd:read("*all")
	fd:close()

	local volume = " " .. status .. " "

	if status == "MUTE" then
		volume = "<span background='red' color='black'>" .. volume .. "</span>"
	else
		status = tonumber(status)

		if status >= 100 then
			volume = "<span background='green' color='black'> 墳" .. volume .. "</span>"
		elseif status == 0 then
			volume = " 奄" .. volume
		else
			volume = " 奔" .. volume
		end
	end

	widget:set_markup(volume)
 
end
 
update_volume(volume_widget)
volume_widget:connect_signal("button::press", function() awful.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle") end)
 
mytimer = timer({ timeout = 0.2 })
mytimer:connect_signal("timeout", function () update_volume(volume_widget) end)
mytimer:start()
