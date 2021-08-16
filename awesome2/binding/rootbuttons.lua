local awful = require("awful")
local gears = require("gears")

local rootbuttons = {}
	function rootbuttons.init(menu)
		local buttons = gears.table.join(
			awful.button({}, 3, function() menu:toggle() end)
		)
		return buttons
	end
return rootbuttons