local Parent = script:FindFirstAncestor("CollectionViews").Parent
local ReactModule = require(Parent.React)
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local UseStyleFunction = require(Parent.UIBlox).Core.Style.useStyle
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local FFlagSduiComponentsUseFoundationTokens = require(Parent.SharedFlags).FFlagSduiComponentsUseFoundationTokens

return ReactModule.memo(function(Frame)
	-- upvalues: FFlagSduiComponentsUseFoundationTokens (copy), UseTokensFunction (copy), UseStyleFunction (copy), UseDesignTokensFunction (copy), ReactModule (copy)
	local BlackColor3 = nil
	local SurfaceColor3 = nil
	if FFlagSduiComponentsUseFoundationTokens then
		local UseTokensResult = UseTokensFunction()
		BlackColor3 = UseTokensResult.Color.Extended.Black.Black_100.Color3
		SurfaceColor3 = UseTokensResult.Color.Surface.Surface_0.Color3
	else
		SurfaceColor3 = UseStyleFunction().Theme.BackgroundDefault.Color
		BlackColor3 = UseDesignTokensFunction().Color.Extended.Black.Black_100.Color3
	end
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
					ColorSequenceKeypoint.new(0, BlackColor3),
					ColorSequenceKeypoint.new(1, SurfaceColor3)
				}),
				Transparency = NumberSequence.new({
					NumberSequenceKeypoint.new(0, 1),
					NumberSequenceKeypoint.new(1, 0)
				})
			})
		})
	})
end)