local Parent = script:FindFirstAncestor("BulkPurchaseApp").Parent
local ReactModule = require(Parent.React)
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens

return function(Frame)
	-- upvalues: UseDesignTokensFunction (copy), ReactModule (copy)
	local UseDesignTokensResult = UseDesignTokensFunction()
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(Vector2.new(0, 0))
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = Frame.LayoutOrder
	}, {
		Start = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AnchorPoint = Vector2.new(0, 0),
			Size = UseBindingResult:map(function(p1): UDim2
				-- upvalues: UseDesignTokensResult (copy)
				return UDim2.new(1, -(p1.X + UseDesignTokensResult.Size.Size_400), 1, 0)
			end)
		}, Frame.startSlot),
		End = ReactModule.createElement("Frame", {
			AnchorPoint = Vector2.new(1, 0),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(0, 0, 1, 0),
			Position = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.X,
			[ReactModule.Change.AbsoluteSize] = function(Frame)
				-- upvalues: UseBindingResult2 (copy)
				UseBindingResult2(Frame.AbsoluteSize)
			end
		}, Frame.endSlot)
	})
end