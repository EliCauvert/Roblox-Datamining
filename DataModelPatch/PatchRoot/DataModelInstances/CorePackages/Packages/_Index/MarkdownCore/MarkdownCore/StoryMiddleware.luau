local Parent = script.Parent.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local FoundationProvider = FoundationModule.FoundationProvider
local Theme = FoundationModule.Enums.Theme
local Device = FoundationModule.Enums.Device

return function(p1)
	-- upvalues: Theme (copy), ReactModule (copy), FoundationProvider (copy), Device (copy)
	return function(p2)
		-- upvalues: Theme (upval), ReactModule (upval), FoundationProvider (upval), Device (upval), p1 (copy)
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
				theme = Theme[p2.theme],
				device = Device[p2.platform],
				preferences = p2.settings
			}, { Child = ReactModule.createElement(p1, p2) })
		})
	end
end