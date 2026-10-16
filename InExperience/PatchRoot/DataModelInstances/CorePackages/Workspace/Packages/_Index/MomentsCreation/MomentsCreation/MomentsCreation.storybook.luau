local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ColorMode = FoundationModule.Enums.ColorMode
local Device = FoundationModule.Enums.Device
local FoundationProvider = FoundationModule.FoundationProvider
local config = { Dark = ColorMode.Dark, Light = ColorMode.Light }

return {
	name = "MomentsCreation",
	roact = ReactModule,
	reactRoblox = require(Parent.Dev.ReactRoblox),
	mapStory = function(p1) --[[ Line: 24 ]]
		-- upvalues: ReactModule (copy), FoundationProvider (copy), config (copy), ColorMode (copy), Device (copy)
		return function(p2) --[[ Line: 25 ]]
			-- upvalues: ReactModule (upval), FoundationProvider (upval), config (upval), ColorMode (upval), Device (upval), p1 (copy)
			return ReactModule.createElement(FoundationProvider, {
				colorMode = config[p2.theme] or ColorMode.Dark,
				device = Device[p2.platform] or Device.Phone,
				preferences = p2.settings,
				scale = p2.settings and p2.settings.scale
			}, { Child = ReactModule.createElement(p1, p2) })
		end
	end,
	storyRoots = { MomentsCreation }
}