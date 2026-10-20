local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local LuauPolyfillModule = require(CorePackages.Packages.LuauPolyfill)

return function(p1)
	-- upvalues: ReactModule (copy), LuauPolyfillModule (copy)
	local NumberOfSteps = p1.numberOfSteps
	local LayoutOrder = p1.layoutOrder
	local NumberActivated = p1.numberActivated
	local t = {}
	
	for i = 1, NumberOfSteps do
		t[i] = i
	end
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(0.9, 0, 0.12, 0),
		Position = UDim2.new(0, 0, 0, 0),
		LayoutOrder = LayoutOrder
	}, ReactModule.createElement("UIListLayout", {
		Padding = UDim.new(0, 10),
		FillDirection = Enum.FillDirection.Horizontal,
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		VerticalAlignment = Enum.VerticalAlignment.Center,
		SortOrder = Enum.SortOrder.LayoutOrder
	}), (LuauPolyfillModule.Array.map(t, function(_, LayoutOrder)
		-- upvalues: ReactModule (upval), NumberActivated (copy), NumberOfSteps (copy)
		return ReactModule.createElement("Frame", {
			LayoutOrder = LayoutOrder,
			BackgroundTransparency = if LayoutOrder <= NumberActivated then 0 else 0.7,
			Size = UDim2.new(1 / NumberOfSteps, 0, 0.5, 0),
			Position = UDim2.new(0, 0, 0, 0),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		}, {
			ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) })
		})
	end)))
end