local parent = script:FindFirstAncestor("VideoUtils").Parent
local reactModule = require(parent.React)
local useTokens = require(parent.Foundation).Hooks.useTokens

return function(p1)
	-- upvalues: useTokens (ref), reactModule (ref)
	local var1 = useTokens()
	local muted = var1.DarkMode.Content.Muted
	local emphasis = var1.Color.Content.Emphasis
	
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		AnchorPoint = p1.AnchorPoint,
		Position = p1.Position,
		Size = p1.Size,
		BackgroundColor3 = muted.Color3,
		BackgroundTransparency = muted.Transparency,
		LayoutOrder = p1.LayoutOrder
	}, {
		UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
		ProgressFill = reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = p1.progressBinding:map(function(p2)
				return UDim2.fromScale(p2, 1)
			end),
			BackgroundColor3 = emphasis.Color3,
			BackgroundTransparency = emphasis.Transparency
		}, {
			UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) })
		})
	})
end