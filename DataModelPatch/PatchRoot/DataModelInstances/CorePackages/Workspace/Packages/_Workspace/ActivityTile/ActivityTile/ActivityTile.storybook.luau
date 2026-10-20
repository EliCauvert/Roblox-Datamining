local ActivityTile = script:FindFirstAncestor("ActivityTile")
local Parent = ActivityTile.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local FoundationProvider = FoundationModule.FoundationProvider
local Theme = FoundationModule.Enums.Theme
local Device = FoundationModule.Enums.Device
local config = { Light = Theme.Light, Dark = Theme.Dark }

return {
	name = "ActivityTile",
	roact = ReactModule,
	reactRoblox = require(Parent.Dev.ReactRoblox),
	mapStory = function(p1)
		-- upvalues: ReactModule (copy), FoundationProvider (copy), config (copy), Device (copy)
		return function(p2)
			-- upvalues: ReactModule (upval), FoundationProvider (upval), config (upval), Device (upval), p1 (copy)
			return ReactModule.createElement(FoundationProvider, {
				theme = config[p2.theme],
				device = Device[p2.platform],
				preferences = p2.settings,
				scale = p2.settings and p2.settings.scale
			}, { Child = ReactModule.createElement(p1, p2) })
		end
	end,
	storyRoots = { ActivityTile }
}