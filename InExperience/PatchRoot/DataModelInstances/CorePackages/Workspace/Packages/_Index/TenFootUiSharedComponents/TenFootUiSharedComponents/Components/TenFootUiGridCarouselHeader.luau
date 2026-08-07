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

return function(p0) --[[ line: 33 | named "TenFootUiGridCarouselHeader" ]]
	-- upvalues: useDesignTokens (ref), mapTypographyVariantToFontEnum (ref), getFFlagTenFootUiSupportSortSubtitle (ref), getTextSize (ref), vector2 (ref), getFFlagTenFootUiSupportSortHeaderTooltip (ref), reactModule (ref), cryoModule (ref), iconWithTooltip (ref), tooltipOrientation (ref)
	local var5 = useDesignTokens(function(p1) --[[ line: 34 ]]
		-- upvalues: mapTypographyVariantToFontEnum (copy), getFFlagTenFootUiSupportSortSubtitle (copy)
		return {
			textStyles = {
				Font = mapTypographyVariantToFontEnum(p1.Typography.HeadingSmall),
				TextSize = p1.Typography.HeadingSmall.FontSize,
				LineHeight = p1.Typography.HeadingSmall.LineHeight,
				TextColor3 = p1.Color.Content.Emphasis.Color3,
				TextTransparency = p1.Color.Content.Emphasis.Transparency
			},
			subtitleTextStyles = if getFFlagTenFootUiSupportSortSubtitle() then {
				Font = p1.Typography.BodyLarge.Font,
				TextSize = p1.Typography.BodyLarge.FontSize,
				LineHeight = p1.Typography.BodyLarge.LineHeight,
				TextColor3 = p1.Color.Content.Default.Color3
			} else nil,
			paddingAboveSubtitle = if getFFlagTenFootUiSupportSortSubtitle() then p1.Size.Size_100 else nil,
			paddingBottom = p1.Size.Size_400
		}
	end)
	local margin = p0.margin or 0
	local var7 = getTextSize(p0.text, var5.textStyles.TextSize, var5.textStyles.Font, vector2)
	local t = nil
	
	if getFFlagTenFootUiSupportSortHeaderTooltip() or getFFlagTenFootUiSupportSortSubtitle() then
		t = {
			TitleAndTooltipPadding = reactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, margin),
				PaddingRight = UDim.new(0, margin),
				PaddingBottom = if getFFlagTenFootUiSupportSortSubtitle() then nil else UDim.new(0, var5.paddingBottom)
			}),
			TitleAndTooltipLayout = if getFFlagTenFootUiSupportSortHeaderTooltip() then reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder
			}) else nil,
			SortTitleTextLabel = reactModule.createElement("TextLabel", cryoModule.Dictionary.join(var5.textStyles, {
				BackgroundTransparency = 1,
				Size = if getFFlagTenFootUiSupportSortHeaderTooltip() then UDim2.new(0, var7.X, 1, 0) else UDim2.fromScale(1, 1),
				Text = p0.text,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				LayoutOrder = if getFFlagTenFootUiSupportSortHeaderTooltip() then 1 else nil
			})),
			SortTooltip = if getFFlagTenFootUiSupportSortHeaderTooltip() and p0.tooltipHoverText then reactModule.createElement(iconWithTooltip, {
				triggerPointName = "GameSortTooltip",
				supportTenFootUi = true,
				layoutOrder = 2,
				tooltipOrientation = tooltipOrientation.Right,
				hoverText = p0.tooltipHoverText
			}) else nil
		}
	end
	return if getFFlagTenFootUiSupportSortSubtitle() then reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, var7.Y + var5.paddingBottom + (if p0.subtitleText and p0.subtitleHeight then p0.subtitleHeight else 0) + (if p0.subtitleText then var5.paddingAboveSubtitle else 0))
	}, {
		Padding = reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, margin),
			PaddingRight = UDim.new(0, margin),
			PaddingBottom = UDim.new(0, var5.paddingBottom)
		}),
		HeaderLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, var5.paddingAboveSubtitle)
		}),
		TitleAndTooltipFrame = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, var7.Y)
		}, t),
		SubtitleTextLabel = if p0.subtitleText then reactModule.createElement("TextLabel", cryoModule.Dictionary.join(var5.subtitleTextStyles, {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.fromScale(1, 1),
			Text = p0.subtitleText,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top
		})) else nil
	}) elseif getFFlagTenFootUiSupportSortHeaderTooltip() then reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, var7.Y + var5.paddingBottom)
	}, t) else reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, var7.Y + var5.paddingBottom)
	}, reactModule.createElement("UIPadding", {
		PaddingLeft = UDim.new(0, margin),
		PaddingRight = UDim.new(0, margin),
		PaddingBottom = UDim.new(0, var5.paddingBottom)
	}), reactModule.createElement("TextLabel", cryoModule.Dictionary.join(var5.textStyles, {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		Text = p0.text,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Top
	})))
end