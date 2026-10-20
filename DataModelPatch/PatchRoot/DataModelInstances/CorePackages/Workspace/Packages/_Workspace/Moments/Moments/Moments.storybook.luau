local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Theme = FoundationModule.Enums.Theme
local Device = FoundationModule.Enums.Device
local FoundationProvider = FoundationModule.FoundationProvider
local config = { Dark = Theme.Dark, Light = Theme.Light }

return {
	name = "Moments",
	roact = ReactModule,
	reactRoblox = require(Parent.Dev.ReactRoblox),
	mapStory = function(p1)
		-- upvalues: ReactModule (copy), FoundationProvider (copy), config (copy), Theme (copy), Device (copy)
		return function(p2)
			-- upvalues: ReactModule (upval), FoundationProvider (upval), config (upval), Theme (upval), Device (upval), p1 (copy)
			return ReactModule.createElement(FoundationProvider, {
				theme = config[p2.theme] or Theme.Dark,
				device = Device[p2.platform] or Device.Phone,
				preferences = p2.settings,
				scale = p2.settings and p2.settings.scale
			}, { Child = ReactModule.createElement(p1, p2) })
		end
	end,
	storyRoots = { Moments }
}