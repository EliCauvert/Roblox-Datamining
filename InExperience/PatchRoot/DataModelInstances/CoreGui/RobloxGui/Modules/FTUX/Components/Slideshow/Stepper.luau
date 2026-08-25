local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local luauPolyfillModule = require(corePackagesService.Packages.LuauPolyfill)

return function(p0)
	-- upvalues: reactModule (ref), luauPolyfillModule (ref)
	local numberOfSteps = p0.numberOfSteps
	local layoutOrder = p0.layoutOrder
	local numberActivated = p0.numberActivated
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
	}), luauPolyfillModule.Array.map(t, function(_, p1)
		-- upvalues: reactModule (copy), numberActivated (ref), numberOfSteps (ref)
		return reactModule.createElement("Frame", {
			LayoutOrder = p1,
			BackgroundTransparency = if p1 <= numberActivated then 0 else 0.7,
			Size = UDim2.new(1 / numberOfSteps, 0, 0.5, 0),
			Position = UDim2.new(0, 0, 0, 0),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		}, {
			reactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) })
		})
	end))
end