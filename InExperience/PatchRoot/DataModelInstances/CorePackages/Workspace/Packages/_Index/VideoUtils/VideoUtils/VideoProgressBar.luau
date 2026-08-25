local parent = script:FindFirstAncestor("VideoUtils").Parent
local reactModule = require(parent.React)
local useTokens = require(parent.Foundation).Hooks.useTokens

return function(p0)
	-- upvalues: useTokens (ref), reactModule (ref)
	local var1 = useTokens()
	local muted = var1.DarkMode.Content.Muted
	local emphasis = var1.Color.Content.Emphasis
	
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		AnchorPoint = p0.AnchorPoint,
		Position = p0.Position,
		Size = p0.Size,
		BackgroundColor3 = muted.Color3,
		BackgroundTransparency = muted.Transparency,
		LayoutOrder = p0.LayoutOrder
	}, {
		UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
		ProgressFill = reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = p0.progressBinding:map(function(p1)
				return UDim2.fromScale(p1, 1)
			end),
			BackgroundColor3 = emphasis.Color3,
			BackgroundTransparency = emphasis.Transparency
		}, {
			UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) })
		})
	})
end