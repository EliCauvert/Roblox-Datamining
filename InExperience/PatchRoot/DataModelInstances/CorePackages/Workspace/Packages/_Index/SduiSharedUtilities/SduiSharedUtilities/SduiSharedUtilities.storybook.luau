local Parent = script:FindFirstAncestor("SduiSharedUtilities").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local FoundationProvider = FoundationModule.FoundationProvider
local ColorMode = FoundationModule.Enums.ColorMode
local Device = FoundationModule.Enums.Device
local config = { Light = ColorMode.Light, Dark = ColorMode.Dark }

return {
	name = "SduiSharedUtilities",
	roact = ReactModule,
	reactRoblox = require(Parent.ReactRoblox),
	mapStory = function(p1) --[[ Line: 15 ]]
		-- upvalues: ReactModule (copy), FoundationProvider (copy), config (copy), Device (copy)
		return function(p2) --[[ Line: 16 ]]
			-- upvalues: ReactModule (upval), FoundationProvider (upval), config (upval), Device (upval), p1 (copy)
			return ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.fromScale(1, 0)
			}, {
				UIPadding = ReactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, 10),
					PaddingBottom = UDim.new(0, 10),
					PaddingLeft = UDim.new(0, 10),
					PaddingRight = UDim.new(0, 10)
				}),
				FoundationContext = ReactModule.createElement(FoundationProvider, {
					colorMode = config[p2.theme],
					device = Device[p2.platform],
					preferences = p2.settings,
					scale = p2.settings and p2.settings.scale
				}, { Child = ReactModule.createElement(p1, p2) })
			})
		end
	end
}