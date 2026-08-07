local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local useImpressionsTagger = require(parent.Impressions).useImpressionsTagger

return reactModule.memo(function(p0) --[[ line: 17 | named "SduiFeedItem" ]]
	-- upvalues: reactModule (ref), useImpressionsTagger (ref)
	local var1 = reactModule.useRef(nil)
	useImpressionsTagger(var1, p0.impressionsTag, p0.index)
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		SelectionGroup = true,
		ref = var1,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		SelectionBehaviorLeft = p0.selectionBehaviorLeft,
		SelectionBehaviorRight = p0.selectionBehaviorRight,
		LayoutOrder = p0.layoutOrder,
		ZIndex = p0.zIndex
	}, p0.children)
end)