local ReactModule = require(script:FindFirstAncestor("Impressions").Parent.React)
local UseImpressionsTaggerModule = require(script.Parent.useImpressionsTagger)

return function(p1)
	-- upvalues: ReactModule (copy), UseImpressionsTaggerModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	UseImpressionsTaggerModule(UseRefResult, p1.impressionsTag, p1.impressionsIndex)
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		LayoutOrder = p1.impressionsIndex,
		ref = UseRefResult
	}, { ComponentWithImpressionsTag = p1.renderComponent() })
end