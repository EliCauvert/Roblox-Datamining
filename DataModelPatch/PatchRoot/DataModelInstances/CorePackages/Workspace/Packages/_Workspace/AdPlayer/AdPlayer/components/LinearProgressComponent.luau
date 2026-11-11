local Parent = script:FindFirstAncestor("AdPlayer").Parent
local ReactModule = require(Parent.React)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens

return function(Frame)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy)
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Position = Frame.Position,
		AnchorPoint = Frame.AnchorPoint,
		Size = Frame.Size,
		ZIndex = Frame.ZIndex,
		BackgroundColor3 = UseTokensResult.Color.Extended.White.White_30.Color3,
		BackgroundTransparency = UseTokensResult.Color.Extended.White.White_30.Transparency
	}, {
		progressFill = ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = Frame.alpha:map(function(XScale): UDim2
				return UDim2.fromScale(XScale, 1)
			end),
			BackgroundColor3 = UseTokensResult.Color.Extended.White.White_100.Color3
		})
	})
end