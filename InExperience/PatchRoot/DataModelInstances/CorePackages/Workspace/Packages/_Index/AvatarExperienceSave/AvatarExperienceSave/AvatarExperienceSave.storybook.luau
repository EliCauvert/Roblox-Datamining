local parent = script:FindFirstAncestor("AvatarExperienceSave").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local foundationProvider = foundationModule.FoundationProvider
local colorMode = foundationModule.Enums.ColorMode
local device = foundationModule.Enums.Device
local reactRobloxModule = require(parent.Dev.ReactRoblox)
local t = { Light = colorMode.Light, Dark = colorMode.Dark }
local t_1 = { Console = device.Console, Desktop = device.Desktop }
local t_2 = {
	Default = { themeName = "Dark", fontName = "Gotham" },
	Light = { themeName = "Light", fontName = "Gotham" },
	Dark = { themeName = "Dark", fontName = "Gotham" }
}

return {
	name = "AvatarExperienceSave",
	roact = reactModule,
	reactRoblox = reactRobloxModule,
	mapStory = function(p1)
		-- upvalues: t (ref), reactModule (ref), foundationProvider (ref), t_2 (ref), t_1 (ref)
		return function(p2)
			-- upvalues: t (copy), reactModule (copy), foundationProvider (copy), t_2 (copy), t_1 (copy), p1 (ref)
			return reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.fromScale(1, 0)
			}, {
				UIPadding = reactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, 10),
					PaddingBottom = UDim.new(0, 10),
					PaddingLeft = UDim.new(0, 10),
					PaddingRight = UDim.new(0, 10)
				}),
				FoundationProvider = reactModule.createElement(foundationProvider, {
					DONOTUSE_colorUpdate = true,
					styleTable = t_2,
					colorMode = t[p2.theme],
					device = t_1[p2.platform]
				}, { Child = reactModule.createElement(p1, p2) })
			})
		end
	end
}