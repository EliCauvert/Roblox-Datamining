local Parent = script:FindFirstAncestor("SduiSharedContent").Parent
local ReactModule = require(Parent.React)
local UseImpressionsTaggerFunction = require(Parent.Impressions).useImpressionsTagger

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), UseImpressionsTaggerFunction (copy)
	local UseRefResult = ReactModule.useRef(nil)
	UseImpressionsTaggerFunction(UseRefResult, p1.impressionsTag, p1.index)
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		SelectionGroup = true,
		ref = UseRefResult,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		SelectionBehaviorLeft = p1.selectionBehaviorLeft,
		SelectionBehaviorRight = p1.selectionBehaviorRight,
		LayoutOrder = p1.layoutOrder,
		ZIndex = p1.zIndex
	}, p1.children)
end)