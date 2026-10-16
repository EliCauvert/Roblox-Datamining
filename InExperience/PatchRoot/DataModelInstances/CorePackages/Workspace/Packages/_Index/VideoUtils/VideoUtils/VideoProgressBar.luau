local Parent = script:FindFirstAncestor("VideoUtils").Parent
local ReactModule = require(Parent.React)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens

return function(Frame: Frame) --[[ Line: 17 | Named "VideoProgressBar" ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy)
	local UseTokensResult = UseTokensFunction()
	local Muted = UseTokensResult.DarkMode.Content.Muted
	local Emphasis = UseTokensResult.Color.Content.Emphasis
	
	return ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		AnchorPoint = Frame.AnchorPoint,
		Position = Frame.Position,
		Size = Frame.Size,
		BackgroundColor3 = Muted.Color3,
		BackgroundTransparency = Muted.Transparency,
		LayoutOrder = Frame.LayoutOrder
	}, {
		UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
		ProgressFill = ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = Frame.progressBinding:map(function(XScale): UDim2 --[[ Line: 37 ]]
				return UDim2.fromScale(XScale, 1)
			end),
			BackgroundColor3 = Emphasis.Color3,
			BackgroundTransparency = Emphasis.Transparency
		}, {
			UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) })
		})
	})
end