local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local useImpressionsTagger = require(parent.Impressions).useImpressionsTagger

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), useImpressionsTagger (ref)
	local var1 = reactModule.useRef(nil)
	useImpressionsTagger(var1, p1.impressionsTag, p1.index)
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		SelectionGroup = true,
		ref = var1,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		SelectionBehaviorLeft = p1.selectionBehaviorLeft,
		SelectionBehaviorRight = p1.selectionBehaviorRight,
		LayoutOrder = p1.layoutOrder,
		ZIndex = p1.zIndex
	}, p1.children)
end)