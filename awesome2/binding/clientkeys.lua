local awful = require("awful")
local hotkeys = require("awful.hotkeys_popup")
local gears = require("gears")
local defaults = require("defaults")

local clientkeys = {}

function clientkeys.init()
	modkey = defaults["modkey"]
	terminal = defaults["terminal"]
	
	local keys = gears.table.join(
		-- Template to copy: awful.key({}, "", , {description="", group=""}),
		awful.key({modkey}, "q", function(c) c:kill() end, {description="Close the focused client", group="Client"}),
		awful.key({modkey}, "m",
			function(c)
				c.maximized = not c.maximized	
			end,
			{description="Maximize the focused client", group="Client"}),
		awful.key({modkey}, "p",
			function(c)
				c.fullscreen = not c.fullscreen
			end,
			{description="Toggle fullscreen of the focused client", group="Client"})
	)
	return keys
end

return clientkeys