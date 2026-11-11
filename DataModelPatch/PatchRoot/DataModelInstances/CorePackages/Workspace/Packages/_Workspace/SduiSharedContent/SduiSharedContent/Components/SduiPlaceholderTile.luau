local Parent = script:FindFirstAncestor("SduiSharedContent").Parent
local ReactModule = require(Parent.React)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local _ = require(Parent.SduiCompat)
local SduiPlaceholderModule = require(script.Parent.SduiPlaceholder)

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), SduiPlaceholderModule (copy)
	local UseTokensResult = UseTokensFunction()
	local ImageAspectRatio = if p1.imageAspectRatio and p1.imageAspectRatio > 0 then p1.imageAspectRatio else 1
	local ScaledScale = (p1.lineHeight or 8) * UseTokensResult.Config.UI.Scale
	local Largest = math.max(p1.titleLineCount or 1, 0)
	local ClampedValue = math.clamp(p1.titleLineWidthFraction or 0.7, 0, 1)
	local ClampedValue1 = math.clamp(p1.subtitleLineWidthFraction or 0.55, 0, 1)
	local config = {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, p1.lineGap or UseTokensResult.Gap.XSmall)
		})
	}
	
	for i = 1, Largest do
		config[`TitleLine{i}`] = ReactModule.createElement(SduiPlaceholderModule, {
			backgroundStyle = p1.backgroundStyle,
			cornerRadius = p1.cornerRadius,
			layoutOrder = i,
			size = UDim2.new(ClampedValue, 0, 0, ScaledScale),
			transparencyBinding = p1.transparencyBinding
		})
	end
	if p1.showSubtitle then
		config.SubtitleLine = ReactModule.createElement(SduiPlaceholderModule, {
			backgroundStyle = p1.backgroundStyle,
			cornerRadius = p1.cornerRadius,
			layoutOrder = Largest + 1,
			size = UDim2.new(ClampedValue1, 0, 0, ScaledScale),
			transparencyBinding = p1.transparencyBinding
		})
	end
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = p1.layoutOrder,
		Position = p1.position,
		Size = p1.size or UDim2.fromScale(1, 1),
		ZIndex = p1.zIndex
	}, {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, UseTokensResult.Gap.Medium)
		}),
		ImageWrapper = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 1 / ImageAspectRatio, 0),
			SizeConstraint = Enum.SizeConstraint.RelativeXX
		}, {
			UIAspectRatioConstraint = ReactModule.createElement("UIAspectRatioConstraint", { AspectRatio = ImageAspectRatio }),
			ImagePlaceholder = ReactModule.createElement(SduiPlaceholderModule, {
				backgroundStyle = p1.backgroundStyle,
				cornerRadius = p1.imageCornerRadius,
				size = UDim2.fromScale(1, 1),
				transparencyBinding = p1.transparencyBinding
			})
		}),
		LineContainer = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 2,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.fromScale(1, 0)
		}, config)
	})
end)