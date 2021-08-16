local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")

local bar = {}

-- What clicking on tasklist does
local tlButtons = gears.table.join(
  	-- Left mouse button
	awful.button(
		{},
		1,
		function(c) -- Focus clicked window
			if c == client.focus then c.minimized = true
			else c:emit_signal(
				"request::activate",
				"tasklist",
				{raise = true}
			)
			end
		end
	),
	
	-- Right mouse button
	awful.button(
		{},
		3,
		function(c) -- List all windows
			awful.menu.client_list()
		end
	)
)

-- Function to create the bar for all screens
function bar.create_bar()
	awful.screen.connect_for_each_screen(
		function(s)
			s.tasklist = awful.widget.tasklist {
				screen = s,
				filter = awful.widget.tasklist.filter.allscreen,
				buttons = tasklist_buttons
			}
			
			s.bar = awful.wibar({
				position = "top",
				screen = s,
				ontop = true
			})
			
			s.bar:setup{
				layout = wibox.layout.align.horizontal,
				awful.widget.keyboardlayout(),
				s.tasklist,
				{
					layout = wibox.layout.align.horizontal,
					wibox.widget.systray(),
					wibox.widget.textclock()
				}
			} 
		end
	)
end

return bar
