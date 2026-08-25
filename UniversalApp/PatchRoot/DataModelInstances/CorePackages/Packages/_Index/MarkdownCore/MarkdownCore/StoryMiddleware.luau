local parent = script.Parent.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local foundationProvider = foundationModule.FoundationProvider
local theme = foundationModule.Enums.Theme
local device = foundationModule.Enums.Device

return function(p0)
	-- upvalues: theme (ref), reactModule (ref), foundationProvider (ref), device (ref)
	return function(p1)
		-- upvalues: theme (copy), reactModule (copy), foundationProvider (copy), device (copy), p0 (ref)
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
				theme = theme[p1.theme],
				device = device[p1.platform],
				preferences = p1.settings
			}, { Child = reactModule.createElement(p0, p1) })
		})
	end
end