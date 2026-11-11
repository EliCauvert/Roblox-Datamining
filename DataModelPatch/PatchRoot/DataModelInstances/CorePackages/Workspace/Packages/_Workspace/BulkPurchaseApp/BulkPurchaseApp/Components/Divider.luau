local Parent = script:FindFirstAncestor("BulkPurchaseApp").Parent
local ReactModule = require(Parent.React)
local FFlagRenameDeprecatedUIBloxTokens = require(Parent.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens

return function(Frame)
	-- upvalues: UseDesignTokensFunction (copy), ReactModule (copy), FFlagRenameDeprecatedUIBloxTokens (copy)
	local UseDesignTokensResult = UseDesignTokensFunction()
	
	return ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, 1),
		BackgroundColor3 = (if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Color.Stroke.Emphasis else UseDesignTokensResult.Semantic.Color.Common.Divider).Color3,
		BackgroundTransparency = (if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Color.Stroke.Emphasis else UseDesignTokensResult.Semantic.Color.Common.Divider).Transparency,
		LayoutOrder = Frame.LayoutOrder,
		[ReactModule.Tag] = "data-testid=BulkPurchaseApp_Divider"
	})
end