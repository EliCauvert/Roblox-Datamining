local Parent = script:FindFirstAncestor("BulkPurchaseApp").Parent
local ReactModule = require(Parent.React)
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens

return function(Frame) --[[ Line: 10 | Named "Divider" ]]
	-- upvalues: UseDesignTokensFunction (copy), ReactModule (copy)
	local UseDesignTokensResult = UseDesignTokensFunction()
	
	return ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, 1),
		BackgroundColor3 = UseDesignTokensResult.Color.Stroke.Emphasis.Color3,
		BackgroundTransparency = UseDesignTokensResult.Color.Stroke.Emphasis.Transparency,
		LayoutOrder = Frame.LayoutOrder,
		[ReactModule.Tag] = "data-testid=BulkPurchaseApp_Divider"
	})
end