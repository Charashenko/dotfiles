local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")

local updates = {}

function updates.create()
	local updates_widget = wibox.widget {
		text = "0",
		valign = "bottom",
		widget = wibox.widget.textbox,
	}
	
	gears.timer {
		timeout = 3600,
		call_now = true,
		autostart = true,
		callback = function()
			awful.spawn.easy_async_with_shell(
				"pacman -Qu | wc -l",
				function(stdout, stderr, exitreason, exitcode)
					updates_widget.text = "".." "..stdout
				end
			)
		end
	}
		
	return updates_widget
	
end

return updates
