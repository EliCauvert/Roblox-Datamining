local parent = script:FindFirstAncestor("BulkPurchaseApp").Parent
local reactModule = require(parent.React)
local useDesignTokens = require(parent.Style).useDesignTokens

return function(p0) --[[ line: 12 | named "LineItemLayout" ]]
	-- upvalues: useDesignTokens (ref), reactModule (ref)
	local var1 = useDesignTokens()
	local var2, var3 = reactModule.useBinding(Vector2.new(0, 0))
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = p0.LayoutOrder
	}, {
		Start = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AnchorPoint = Vector2.new(0, 0),
			Size = var2:map(function(p1) --[[ line: 27 ]]
				-- upvalues: var1 (ref)
				return UDim2.new(1, -(p1.X + var1.Size.Size_400), 1, 0)
			end)
		}, p0.startSlot),
		End = reactModule.createElement("Frame", {
			AnchorPoint = Vector2.new(1, 0),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(0, 0, 1, 0),
			Position = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.X,
			[reactModule.Change.AbsoluteSize] = function(p2) --[[ line: 38 ]]
				-- upvalues: var3 (ref)
				var3(p2.AbsoluteSize)
			end
		}, p0.endSlot)
	})
end