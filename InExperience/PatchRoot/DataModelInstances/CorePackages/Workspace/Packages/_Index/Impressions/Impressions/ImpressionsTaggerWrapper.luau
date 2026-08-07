local reactModule = require(script:FindFirstAncestor("Impressions").Parent.React)
local useImpressionsTaggerModule = require(script.Parent.useImpressionsTagger)

return function(p0) --[[ line: 14 | named "ImpressionsTagWrapper" ]]
	-- upvalues: reactModule (ref), useImpressionsTaggerModule (ref)
	local var2 = reactModule.useRef(nil)
	useImpressionsTaggerModule(var2, p0.impressionsTag, p0.impressionsIndex)
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		LayoutOrder = p0.impressionsIndex,
		ref = var2
	}, { ComponentWithImpressionsTag = p0.renderComponent() })
end