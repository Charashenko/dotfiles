local awful = require("awful")
local beautiful = require("beautiful")
local hotkeys = require("awful.hotkeys_popup")

local main = {}
	function main.create()
		local terminal = "kitty"
	
		local apps = {
			{ "hotkeys", function() hotkeys.show_help(nil, awful.screen.focused()) end },
			{ "manual", terminal .. " -e man awesome" },
			{ "restart", awesome.restart },
			{ "quit", function() awesome.quit() end },
		}
	
		local menu = awful.menu({ items = {
					{ "awesome", apps, beautiful.awesome_icon },
					{ "open terminal", terminal }
		}})
	
		return menu
	end
return main
