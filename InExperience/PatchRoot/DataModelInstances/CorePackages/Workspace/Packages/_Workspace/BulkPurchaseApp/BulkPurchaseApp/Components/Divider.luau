local parent = script:FindFirstAncestor("BulkPurchaseApp").Parent
local reactModule = require(parent.React)
local useDesignTokens = require(parent.Style).useDesignTokens

return function(p0)
	-- upvalues: useDesignTokens (ref), reactModule (ref)
	local var1 = useDesignTokens()
	
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, 1),
		BackgroundColor3 = var1.Color.Stroke.Emphasis.Color3,
		BackgroundTransparency = var1.Color.Stroke.Emphasis.Transparency,
		LayoutOrder = p0.LayoutOrder,
		[reactModule.Tag] = "data-testid=BulkPurchaseApp_Divider"
	})
end