local parent = script:FindFirstAncestor("CollectionViews").Parent
local reactModule = require(parent.React)
local useDesignTokens = require(parent.Style).useDesignTokens
local useStyle = require(parent.UIBlox).Core.Style.useStyle

return reactModule.memo(function(value) --[[ line: 23 | named "CollectionBackgroundMural" ]]
	-- upvalues: useStyle (ref), useDesignTokens (ref), reactModule (ref)
	return reactModule.createElement("ImageLabel", {
		ImageTransparency = 0,
		BackgroundTransparency = 1,
		Image = value.backgroundMuralUrl,
		Size = value.containerSizeBinding:map(function(p0) --[[ line: 34 ]]
			return UDim2.new(1, 0, 0, p0.Y)
		end),
		ZIndex = value.ZIndex or -1,
		LayoutOrder = value.LayoutOrder,
		ScaleType = Enum.ScaleType.Crop
	}, {
		GradientFrame = reactModule.createElement("Frame", {
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundColor3 = Color3.new(1, 1, 1)
		}, {
			Gradient = reactModule.createElement("UIGradient", {
				Rotation = 90,
				Color = ColorSequence.new({
					ColorSequenceKeypoint.new(0, useDesignTokens().Color.Extended.Black.Black_100.Color3),
					ColorSequenceKeypoint.new(1, useStyle().Theme.BackgroundDefault.Color)
				}),
				Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, 1),
					NumberSequenceKeypoint.new(1, 0)
				})
			})
		})
	})
end)