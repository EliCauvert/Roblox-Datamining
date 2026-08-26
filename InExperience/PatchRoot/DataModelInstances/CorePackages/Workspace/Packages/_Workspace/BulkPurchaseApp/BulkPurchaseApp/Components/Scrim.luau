local parent = script:FindFirstAncestor("BulkPurchaseApp").Parent
local reactModule = require(parent.React)
local useDesignTokens = require(parent.Style).useDesignTokens

return reactModule.forwardRef(function(p1, p2)
	-- upvalues: useDesignTokens (ref), reactModule (ref)
	local var1 = useDesignTokens()
	
	return reactModule.createElement("Frame", {
		ClipsDescendants = false,
		Active = true,
		ref = p2,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = var1.Color.Common.Scrim.Transparency,
		BackgroundColor3 = var1.Color.Common.Scrim.Color3
	}, p1.children)
end)