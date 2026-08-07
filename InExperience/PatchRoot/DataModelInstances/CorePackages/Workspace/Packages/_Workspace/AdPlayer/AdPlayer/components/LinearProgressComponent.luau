local parent = script:FindFirstAncestor("AdPlayer").Parent
local reactModule = require(parent.React)
local useTokens = require(parent.Foundation).Hooks.useTokens

return function(p0) --[[ line: 16 | named "LinearProgressComponent" ]]
	-- upvalues: useTokens (ref), reactModule (ref)
	local var1 = useTokens()
	
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Position = p0.Position,
		AnchorPoint = p0.AnchorPoint,
		Size = p0.Size,
		ZIndex = p0.ZIndex,
		BackgroundColor3 = var1.Color.Extended.White.White_30.Color3,
		BackgroundTransparency = var1.Color.Extended.White.White_30.Transparency
	}, {
		progressFill = reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = p0.alpha:map(function(p1) --[[ line: 31 ]]
				return UDim2.fromScale(p1, 1)
			end),
			BackgroundColor3 = var1.Color.Extended.White.White_100.Color3
		})
	})
end