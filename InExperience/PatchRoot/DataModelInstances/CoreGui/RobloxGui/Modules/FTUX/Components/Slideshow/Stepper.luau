local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local luauPolyfillModule = require(corePackagesService.Packages.LuauPolyfill)

return function(p1)
	-- upvalues: reactModule (ref), luauPolyfillModule (ref)
	local numberOfSteps = p1.numberOfSteps
	local layoutOrder = p1.layoutOrder
	local numberActivated = p1.numberActivated
	local t = {}
	
	for i = 1, numberOfSteps do
		t[i] = i
	end
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(0.9, 0, 0.12, 0),
		Position = UDim2.new(0, 0, 0, 0),
		LayoutOrder = layoutOrder
	}, reactModule.createElement("UIListLayout", {
		Padding = UDim.new(0, 10),
		FillDirection = Enum.FillDirection.Horizontal,
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		VerticalAlignment = Enum.VerticalAlignment.Center,
		SortOrder = Enum.SortOrder.LayoutOrder
	}), luauPolyfillModule.Array.map(t, function(_, p2)
		-- upvalues: reactModule (copy), numberActivated (ref), numberOfSteps (ref)
		return reactModule.createElement("Frame", {
			LayoutOrder = p2,
			BackgroundTransparency = if p2 <= numberActivated then 0 else 0.7,
			Size = UDim2.new(1 / numberOfSteps, 0, 0.5, 0),
			Position = UDim2.new(0, 0, 0, 0),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		}, {
			reactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) })
		})
	end))
end