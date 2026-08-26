local parent = script:FindFirstAncestor("TenFootUiSharedComponents").Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local styleModule = require(parent.Style)
local useDesignTokens = styleModule.useDesignTokens
local mapTypographyVariantToFontEnum = styleModule.mapTypographyVariantToFontEnum
local getTextSize = styleModule.GetTextSize
local tooltipOrientation = require(parent.UIBlox).App.Dialog.Enum.TooltipOrientation
local iconWithTooltip = require(parent.AppBlox).IconWithTooltip
local sharedFlagsModule = require(parent.SharedFlags)
local getFFlagTenFootUiSupportSortHeaderTooltip = sharedFlagsModule.GetFFlagTenFootUiSupportSortHeaderTooltip
local getFFlagTenFootUiSupportSortSubtitle = sharedFlagsModule.GetFFlagTenFootUiSupportSortSubtitle
local vector2 = Vector2.new(1e999, 1e999)

return function(p1)
	-- upvalues: useDesignTokens (ref), mapTypographyVariantToFontEnum (ref), getFFlagTenFootUiSupportSortSubtitle (ref), getTextSize (ref), vector2 (ref), getFFlagTenFootUiSupportSortHeaderTooltip (ref), reactModule (ref), cryoModule (ref), iconWithTooltip (ref), tooltipOrientation (ref)
	local var1 = useDesignTokens(function(p2)
		-- upvalues: mapTypographyVariantToFontEnum (copy), getFFlagTenFootUiSupportSortSubtitle (copy)
		return {
			textStyles = {
				Font = mapTypographyVariantToFontEnum(p2.Typography.HeadingSmall),
				TextSize = p2.Typography.HeadingSmall.FontSize,
				LineHeight = p2.Typography.HeadingSmall.LineHeight,
				TextColor3 = p2.Color.Content.Emphasis.Color3,
				TextTransparency = p2.Color.Content.Emphasis.Transparency
			},
			subtitleTextStyles = if getFFlagTenFootUiSupportSortSubtitle() then {
				Font = p2.Typography.BodyLarge.Font,
				TextSize = p2.Typography.BodyLarge.FontSize,
				LineHeight = p2.Typography.BodyLarge.LineHeight,
				TextColor3 = p2.Color.Content.Default.Color3
			} else nil,
			paddingAboveSubtitle = if getFFlagTenFootUiSupportSortSubtitle() then p2.Size.Size_100 else nil,
			paddingBottom = p2.Size.Size_400
		}
	end)
	local margin = p1.margin or 0
	local var2 = getTextSize(p1.text, var1.textStyles.TextSize, var1.textStyles.Font, vector2)
	local t = nil
	
	if getFFlagTenFootUiSupportSortHeaderTooltip() or getFFlagTenFootUiSupportSortSubtitle() then
		t = {
			TitleAndTooltipPadding = reactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, margin),
				PaddingRight = UDim.new(0, margin),
				PaddingBottom = if getFFlagTenFootUiSupportSortSubtitle() then nil else UDim.new(0, var1.paddingBottom)
			}),
			TitleAndTooltipLayout = if getFFlagTenFootUiSupportSortHeaderTooltip() then reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder
			}) else nil,
			SortTitleTextLabel = reactModule.createElement("TextLabel", cryoModule.Dictionary.join(var1.textStyles, {
				BackgroundTransparency = 1,
				Size = if getFFlagTenFootUiSupportSortHeaderTooltip() then UDim2.new(0, var2.X, 1, 0) else UDim2.fromScale(1, 1),
				Text = p1.text,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				LayoutOrder = if getFFlagTenFootUiSupportSortHeaderTooltip() then 1 else nil
			})),
			SortTooltip = if getFFlagTenFootUiSupportSortHeaderTooltip() and p1.tooltipHoverText then reactModule.createElement(iconWithTooltip, {
				triggerPointName = "GameSortTooltip",
				supportTenFootUi = true,
				layoutOrder = 2,
				tooltipOrientation = tooltipOrientation.Right,
				hoverText = p1.tooltipHoverText
			}) else nil
		}
	end
	return if getFFlagTenFootUiSupportSortSubtitle() then reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, var2.Y + var1.paddingBottom + (if p1.subtitleText and p1.subtitleHeight then p1.subtitleHeight else 0) + (if p1.subtitleText then var1.paddingAboveSubtitle else 0))
	}, {
		Padding = reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, margin),
			PaddingRight = UDim.new(0, margin),
			PaddingBottom = UDim.new(0, var1.paddingBottom)
		}),
		HeaderLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, var1.paddingAboveSubtitle)
		}),
		TitleAndTooltipFrame = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, var2.Y)
		}, t),
		SubtitleTextLabel = if p1.subtitleText then reactModule.createElement("TextLabel", cryoModule.Dictionary.join(var1.subtitleTextStyles, {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.fromScale(1, 1),
			Text = p1.subtitleText,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top
		})) else nil
	}) elseif getFFlagTenFootUiSupportSortHeaderTooltip() then reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, var2.Y + var1.paddingBottom)
	}, t) else reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, var2.Y + var1.paddingBottom)
	}, reactModule.createElement("UIPadding", {
		PaddingLeft = UDim.new(0, margin),
		PaddingRight = UDim.new(0, margin),
		PaddingBottom = UDim.new(0, var1.paddingBottom)
	}), reactModule.createElement("TextLabel", cryoModule.Dictionary.join(var1.textStyles, {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		Text = p1.text,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Top
	})))
end