local reactModule = require(script:FindFirstAncestor("Impressions").Parent.React)
local useImpressionsTaggerModule = require(script.Parent.useImpressionsTagger)

return function(p1)
	-- upvalues: reactModule (ref), useImpressionsTaggerModule (ref)
	local var1 = reactModule.useRef(nil)
	useImpressionsTaggerModule(var1, p1.impressionsTag, p1.impressionsIndex)
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		LayoutOrder = p1.impressionsIndex,
		ref = var1
	}, { ComponentWithImpressionsTag = p1.renderComponent() })
end