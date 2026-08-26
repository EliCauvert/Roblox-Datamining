local parent = script:FindFirstAncestor("BulkPurchaseApp").Parent
local reactModule = require(parent.React)
local useDesignTokens = require(parent.Style).useDesignTokens

return function(p1)
	-- upvalues: useDesignTokens (ref), reactModule (ref)
	local var1 = useDesignTokens()
	local var2, var3 = reactModule.useBinding(Vector2.new(0, 0))
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = p1.LayoutOrder
	}, {
		Start = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AnchorPoint = Vector2.new(0, 0),
			Size = var2:map(function(p2)
				-- upvalues: var1 (ref)
				return UDim2.new(1, -(p2.X + var1.Size.Size_400), 1, 0)
			end)
		}, p1.startSlot),
		End = reactModule.createElement("Frame", {
			AnchorPoint = Vector2.new(1, 0),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(0, 0, 1, 0),
			Position = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.X,
			[reactModule.Change.AbsoluteSize] = function(p2)
				-- upvalues: var3 (ref)
				var3(p2.AbsoluteSize)
			end
		}, p1.endSlot)
	})
end