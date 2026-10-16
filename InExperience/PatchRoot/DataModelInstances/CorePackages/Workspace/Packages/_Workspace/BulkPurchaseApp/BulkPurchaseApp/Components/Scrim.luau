local Parent = script:FindFirstAncestor("BulkPurchaseApp").Parent
local ReactModule = require(Parent.React)
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens

return (ReactModule.forwardRef(function(p1, Ref) --[[ Line: 10 ]]
	-- upvalues: UseDesignTokensFunction (copy), ReactModule (copy)
	local UseDesignTokensResult = UseDesignTokensFunction()
	
	return ReactModule.createElement("Frame", {
		ClipsDescendants = false,
		Active = true,
		ref = Ref,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = UseDesignTokensResult.Color.Common.Scrim.Transparency,
		BackgroundColor3 = UseDesignTokensResult.Color.Common.Scrim.Color3
	}, p1.children)
end))