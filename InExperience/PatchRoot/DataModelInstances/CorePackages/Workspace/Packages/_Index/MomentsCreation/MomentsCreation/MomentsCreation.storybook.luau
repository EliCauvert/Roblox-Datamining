local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.Dev.ReactRoblox)
local colorMode = foundationModule.Enums.ColorMode
local device = foundationModule.Enums.Device
local foundationProvider = foundationModule.FoundationProvider
local t = { Dark = colorMode.Dark, Light = colorMode.Light }

return {
	name = "MomentsCreation",
	roact = reactModule,
	reactRoblox = reactRobloxModule,
	mapStory = function(p0)
		-- upvalues: reactModule (ref), foundationProvider (ref), t (ref), colorMode (ref), device (ref)
		return function(p1)
			-- upvalues: reactModule (copy), foundationProvider (copy), t (copy), colorMode (copy), device (copy), p0 (ref)
			return reactModule.createElement(foundationProvider, {
				colorMode = t[p1.theme] or colorMode.Dark,
				device = device[p1.platform] or device.Phone,
				preferences = p1.settings,
				scale = p1.settings and p1.settings.scale
			}, { Child = reactModule.createElement(p0, p1) })
		end
	end,
	storyRoots = { momentsCreation }
}