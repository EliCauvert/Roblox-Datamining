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
	mapStory = function(p1)
		-- upvalues: reactModule (ref), foundationProvider (ref), t (ref), colorMode (ref), device (ref)
		return function(p2)
			-- upvalues: reactModule (copy), foundationProvider (copy), t (copy), colorMode (copy), device (copy), p1 (ref)
			return reactModule.createElement(foundationProvider, {
				colorMode = t[p2.theme] or colorMode.Dark,
				device = device[p2.platform] or device.Phone,
				preferences = p2.settings,
				scale = p2.settings and p2.settings.scale
			}, { Child = reactModule.createElement(p1, p2) })
		end
	end,
	storyRoots = { momentsCreation }
}