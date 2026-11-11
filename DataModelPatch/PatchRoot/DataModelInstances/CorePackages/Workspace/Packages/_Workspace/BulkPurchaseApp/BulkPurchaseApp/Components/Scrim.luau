local Parent = script:FindFirstAncestor("BulkPurchaseApp").Parent
local ReactModule = require(Parent.React)
local FFlagRenameDeprecatedUIBloxTokens = require(Parent.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens

return (ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: UseDesignTokensFunction (copy), ReactModule (copy), FFlagRenameDeprecatedUIBloxTokens (copy)
	local UseDesignTokensResult = UseDesignTokensFunction()
	
	return ReactModule.createElement("Frame", {
		ClipsDescendants = false,
		Active = true,
		ref = Ref,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = (if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Color.Common.Scrim else UseDesignTokensResult.Semantic.Color.Common.Overlay).Transparency,
		BackgroundColor3 = (if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Color.Common.Scrim else UseDesignTokensResult.Semantic.Color.Common.Overlay).Color3
	}, p1.children)
end))