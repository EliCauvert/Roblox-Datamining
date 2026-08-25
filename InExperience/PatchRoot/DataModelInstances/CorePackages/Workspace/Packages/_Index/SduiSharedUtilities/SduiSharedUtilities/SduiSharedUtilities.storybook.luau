local parent = script:FindFirstAncestor("SduiSharedUtilities").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local foundationProvider = foundationModule.FoundationProvider
local colorMode = foundationModule.Enums.ColorMode
local device = foundationModule.Enums.Device
local t = { Light = colorMode.Light, Dark = colorMode.Dark }

return {
	name = "SduiSharedUtilities",
	roact = reactModule,
	reactRoblox = require(parent.ReactRoblox),
	mapStory = function(p0)
		-- upvalues: reactModule (ref), foundationProvider (ref), t (ref), device (ref)
		return function(p1)
			-- upvalues: reactModule (copy), foundationProvider (copy), t (copy), device (copy), p0 (ref)
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
					colorMode = t[p1.theme],
					device = device[p1.platform],
					preferences = p1.settings,
					scale = p1.settings and p1.settings.scale
				}, { Child = reactModule.createElement(p0, p1) })
			})
		end
	end
}