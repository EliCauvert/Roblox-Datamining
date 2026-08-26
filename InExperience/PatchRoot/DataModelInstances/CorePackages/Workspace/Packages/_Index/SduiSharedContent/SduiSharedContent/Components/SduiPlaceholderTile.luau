local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local useTokens = require(parent.Foundation).Hooks.useTokens
local _ = require(parent.SduiCompat)
local sduiPlaceholderModule = require(script.Parent.SduiPlaceholder)

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), sduiPlaceholderModule (ref)
	local var1 = useTokens()
	local scale = var1.Config.UI.Scale
	local var2 = if p1.imageAspectRatio and p1.imageAspectRatio > 0 then p1.imageAspectRatio else 1
	local lineGap = p1.lineGap or var1.Gap.XSmall
	local var3 = (p1.lineHeight or 8) * scale
	local maxValue = math.max(p1.titleLineCount or 1, 0)
	local clampedValue = math.clamp(p1.titleLineWidthFraction or 0.7, 0, 1)
	local clampedValue_1 = math.clamp(p1.subtitleLineWidthFraction or 0.55, 0, 1)
	local t = {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, lineGap)
		})
	}
	
	for i = 1, maxValue do
		t[`TitleLine{i}`] = reactModule.createElement(sduiPlaceholderModule, {
			backgroundStyle = p1.backgroundStyle,
			cornerRadius = p1.cornerRadius,
			layoutOrder = i,
			size = UDim2.new(clampedValue, 0, 0, var3),
			transparencyBinding = p1.transparencyBinding
		})
	end
	if p1.showSubtitle then
		t.SubtitleLine = reactModule.createElement(sduiPlaceholderModule, {
			backgroundStyle = p1.backgroundStyle,
			cornerRadius = p1.cornerRadius,
			layoutOrder = maxValue + 1,
			size = UDim2.new(clampedValue_1, 0, 0, var3),
			transparencyBinding = p1.transparencyBinding
		})
	end
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = p1.layoutOrder,
		Position = p1.position,
		Size = p1.size or UDim2.fromScale(1, 1),
		ZIndex = p1.zIndex
	}, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, var1.Gap.Medium)
		}),
		ImageWrapper = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 1 / var2, 0),
			SizeConstraint = Enum.SizeConstraint.RelativeXX
		}, {
			UIAspectRatioConstraint = reactModule.createElement("UIAspectRatioConstraint", { AspectRatio = var2 }),
			ImagePlaceholder = reactModule.createElement(sduiPlaceholderModule, {
				backgroundStyle = p1.backgroundStyle,
				cornerRadius = p1.imageCornerRadius,
				size = UDim2.fromScale(1, 1),
				transparencyBinding = p1.transparencyBinding
			})
		}),
		LineContainer = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 2,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.fromScale(1, 0)
		}, t)
	})
end)