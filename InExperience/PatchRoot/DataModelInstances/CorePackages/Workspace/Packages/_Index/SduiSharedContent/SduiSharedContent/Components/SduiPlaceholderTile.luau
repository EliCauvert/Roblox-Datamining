local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local useTokens = require(parent.Foundation).Hooks.useTokens
local _ = require(parent.SduiCompat)
local sduiPlaceholderModule = require(script.Parent.SduiPlaceholder)

return reactModule.memo(function(p0) --[[ line: 45 | named "SduiPlaceholderTile" ]]
	-- upvalues: useTokens (ref), reactModule (ref), sduiPlaceholderModule (ref)
	local var2 = useTokens()
	local scale = var2.Config.UI.Scale
	local var3 = if p0.imageAspectRatio and p0.imageAspectRatio > 0 then p0.imageAspectRatio else 1
	local lineGap = p0.lineGap or var2.Gap.XSmall
	local var5 = (p0.lineHeight or 8) * scale
	local maxValue = math.max(p0.titleLineCount or 1, 0)
	local clampedValue = math.clamp(p0.titleLineWidthFraction or 0.7, 0, 1)
	local clampedValue_1 = math.clamp(p0.subtitleLineWidthFraction or 0.55, 0, 1)
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
			backgroundStyle = p0.backgroundStyle,
			cornerRadius = p0.cornerRadius,
			layoutOrder = i,
			size = UDim2.new(clampedValue, 0, 0, var5),
			transparencyBinding = p0.transparencyBinding
		})
	end
	if p0.showSubtitle then
		t.SubtitleLine = reactModule.createElement(sduiPlaceholderModule, {
			backgroundStyle = p0.backgroundStyle,
			cornerRadius = p0.cornerRadius,
			layoutOrder = maxValue + 1,
			size = UDim2.new(clampedValue_1, 0, 0, var5),
			transparencyBinding = p0.transparencyBinding
		})
	end
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = p0.layoutOrder,
		Position = p0.position,
		Size = p0.size or UDim2.fromScale(1, 1),
		ZIndex = p0.zIndex
	}, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, var2.Gap.Medium)
		}),
		ImageWrapper = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 1 / var3, 0),
			SizeConstraint = Enum.SizeConstraint.RelativeXX
		}, {
			UIAspectRatioConstraint = reactModule.createElement("UIAspectRatioConstraint", { AspectRatio = var3 }),
			ImagePlaceholder = reactModule.createElement(sduiPlaceholderModule, {
				backgroundStyle = p0.backgroundStyle,
				cornerRadius = p0.imageCornerRadius,
				size = UDim2.fromScale(1, 1),
				transparencyBinding = p0.transparencyBinding
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