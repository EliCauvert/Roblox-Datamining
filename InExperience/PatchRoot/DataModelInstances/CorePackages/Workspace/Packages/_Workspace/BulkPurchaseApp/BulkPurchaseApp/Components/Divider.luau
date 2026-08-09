local parent = script:FindFirstAncestor("BulkPurchaseApp").Parent
local reactModule = require(parent.React)
local fFlagRenameDeprecatedUIBloxTokens = require(parent.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local useDesignTokens = require(parent.Style).useDesignTokens

return function(p0) --[[ line: 12 | named "Divider" ]]
	-- upvalues: useDesignTokens (ref), reactModule (ref), fFlagRenameDeprecatedUIBloxTokens (ref)
	local var1 = useDesignTokens()
	
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, 1),
		BackgroundColor3 = (if fFlagRenameDeprecatedUIBloxTokens then var1.Color.Stroke.Emphasis else var1.Semantic.Color.Common.Divider).Color3,
		BackgroundTransparency = (if fFlagRenameDeprecatedUIBloxTokens then var1.Color.Stroke.Emphasis else var1.Semantic.Color.Common.Divider).Transparency,
		LayoutOrder = p0.LayoutOrder,
		[reactModule.Tag] = "data-testid=BulkPurchaseApp_Divider"
	})
end