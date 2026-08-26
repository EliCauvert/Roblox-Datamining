local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local foundationProvider = foundationModule.FoundationProvider
local colorMode = foundationModule.Enums.ColorMode
local device = foundationModule.Enums.Device
local t = { Light = colorMode.Light, Dark = colorMode.Dark }

return {
	name = "SduiSharedContent",
	roact = reactModule,
	reactRoblox = require(parent.Dev.ReactRoblox),
	mapStory = function(p1)
		-- upvalues: reactModule (ref), foundationProvider (ref), t (ref), device (ref)
		return function(p2)
			-- upvalues: reactModule (copy), foundationProvider (copy), t (copy), device (copy), p1 (ref)
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
				FoundationContext = reactModule.createElement(foundationProvider, {
					colorMode = t[p2.theme],
					device = device[p2.platform],
					preferences = p2.settings,
					scale = p2.settings and p2.settings.scale
				}, { Child = reactModule.createElement(p1, p2) })
			})
		end
	end
}