local awful = require("awful")
local hotkeys = require("awful.hotkeys_popup")
local gears = require("gears")
local defaults = require("defaults")

local globalkeys = {}

function globalkeys.init()
	modkey = defaults["modkey"]
	terminal = defaults["terminal"]
	filemanager = defaults["filemanager"]
	browser = defaults["browser"]
	applauncher = defaults["applauncher"]
	editor = defaults["editor"]
	
	local keys = gears.table.join(
		-- Template to copy: awful.key({}, "", , {description="", group=""}),
		awful.key({modkey}, "Escape", awesome.quit, {description="Quit AwesomeWM", group="AwesomeWM"}),
		awful.key({modkey}, "r", awesome.restart, {description="Restart AwesomeWM", group="AwesomeWM"}),
		awful.key({modkey}, "h", function() hotkeys.show_help()end, {description="Show this help", group="AwesomeWM"}),
		awful.key({modkey}, "c", function() awful.spawn(terminal) end, {description="Open terminal ( "..terminal.." )", group="Launcher"}),
		awful.key({modkey}, "x", function() awful.spawn(applauncher) end, {description="Open application launcher ( " ..applauncher.." )", group="Launcher"}),
		awful.key({modkey}, "b", function() awful.spawn(browser) end, {description="Open browser ( "..browser.." )", group="Launcher"}),
		awful.key({modkey}, "f", function() awful.spawn(filemanager) end, {description="Open file manager ( "..filemanager.." )", group="Launcher"}),
		awful.key({modkey}, "e", function() awful.spawn(editor) end, {description="Open editor ( "..editor.." )", group="Launcher"})
	)
	return keys
end

return globalkeys