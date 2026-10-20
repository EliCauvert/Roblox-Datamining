local Parent = script:FindFirstAncestor("CollectionViews").Parent
local ReactModule = require(Parent.React)
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local FFlagRenameDeprecatedUIBloxTokens = require(Parent.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local UseStyleFunction = require(Parent.UIBlox).Core.Style.useStyle

return ReactModule.memo(function(Frame)
	-- upvalues: UseStyleFunction (copy), UseDesignTokensFunction (copy), ReactModule (copy), FFlagRenameDeprecatedUIBloxTokens (copy)
	local Color = UseStyleFunction().Theme.BackgroundDefault.Color
	local UseDesignTokensResult = UseDesignTokensFunction()
	
	return ReactModule.createElement("ImageLabel", {
		ImageTransparency = 0,
		BackgroundTransparency = 1,
		Image = Frame.backgroundMuralUrl,
		Size = Frame.containerSizeBinding:map(function(p1): UDim2
			return UDim2.new(1, 0, 0, p1.Y)
		end),
		ZIndex = Frame.ZIndex or -1,
		LayoutOrder = Frame.LayoutOrder,
		ScaleType = Enum.ScaleType.Crop
	}, {
		GradientFrame = ReactModule.createElement("Frame", {
			BackgroundTransparency = 0,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundColor3 = Color3.new(1, 1, 1)
		}, {
			Gradient = ReactModule.createElement("UIGradient", {
				Rotation = 90,
				Color = ColorSequence.new({
					ColorSequenceKeypoint.new(0, (if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Color.Extended.Black.Black_100 else UseDesignTokensResult.Global.Color.Black).Color3),
					ColorSequenceKeypoint.new(1, Color)
				}),
				Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, 1),
					NumberSequenceKeypoint.new(1, 0)
				})
			})
		})
	})
end)