local parent = script:FindFirstAncestor("AdPlayer").Parent
local reactModule = require(parent.React)
local useTokens = require(parent.Foundation).Hooks.useTokens

return function(p1)
	-- upvalues: useTokens (ref), reactModule (ref)
	local var1 = useTokens()
	
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Position = p1.Position,
		AnchorPoint = p1.AnchorPoint,
		Size = p1.Size,
		ZIndex = p1.ZIndex,
		BackgroundColor3 = var1.Color.Extended.White.White_30.Color3,
		BackgroundTransparency = var1.Color.Extended.White.White_30.Transparency
	}, {
		progressFill = reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = p1.alpha:map(function(p2)
				return UDim2.fromScale(p2, 1)
			end),
			BackgroundColor3 = var1.Color.Extended.White.White_100.Color3
		})
	})
end