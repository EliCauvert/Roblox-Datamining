local parent = script:FindFirstAncestor("BulkPurchaseApp").Parent
local reactModule = require(parent.React)
local fFlagRenameDeprecatedUIBloxTokens = require(parent.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local useDesignTokens = require(parent.Style).useDesignTokens

return reactModule.forwardRef(function(p0, p1) --[[ line: 12 ]]
	-- upvalues: useDesignTokens (ref), reactModule (ref), fFlagRenameDeprecatedUIBloxTokens (ref)
	local var1 = useDesignTokens()
	
	return reactModule.createElement("Frame", {
		ClipsDescendants = false,
		Active = true,
		ref = p1,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = (if fFlagRenameDeprecatedUIBloxTokens then var1.Color.Common.Scrim else var1.Semantic.Color.Common.Overlay).Transparency,
		BackgroundColor3 = (if fFlagRenameDeprecatedUIBloxTokens then var1.Color.Common.Scrim else var1.Semantic.Color.Common.Overlay).Color3
	}, p0.children)
end)