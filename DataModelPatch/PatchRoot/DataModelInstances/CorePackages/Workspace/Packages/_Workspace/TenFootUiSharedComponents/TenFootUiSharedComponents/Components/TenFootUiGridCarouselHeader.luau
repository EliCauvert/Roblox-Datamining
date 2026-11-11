local Parent = script:FindFirstAncestor("TenFootUiSharedComponents").Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local StyleModule = require(Parent.Style)
local UseDesignTokensFunction = StyleModule.useDesignTokens
local MapTypographyVariantToFontEnumFunction = StyleModule.mapTypographyVariantToFontEnum
local GetTextSizeFunction = StyleModule.GetTextSize
local TooltipOrientation = require(Parent.UIBlox).App.Dialog.Enum.TooltipOrientation
local IconWithTooltip = require(Parent.AppBlox).IconWithTooltip
local SharedFlagsModule = require(Parent.SharedFlags)
local GetFFlagTenFootUiSupportSortHeaderTooltipFunction = SharedFlagsModule.GetFFlagTenFootUiSupportSortHeaderTooltip
local GetFFlagTenFootUiSupportSortSubtitleFunction = SharedFlagsModule.GetFFlagTenFootUiSupportSortSubtitle
local _Vector2 = Vector2.new(1e999, 1e999)

return function(p1)
	-- upvalues: UseDesignTokensFunction (copy), MapTypographyVariantToFontEnumFunction (copy), GetFFlagTenFootUiSupportSortSubtitleFunction (copy), GetTextSizeFunction (copy), _Vector2 (copy), GetFFlagTenFootUiSupportSortHeaderTooltipFunction (copy), ReactModule (copy), CryoModule (copy), IconWithTooltip (copy), TooltipOrientation (copy)
	local UseDesignTokensResult = UseDesignTokensFunction(function(p2)
		-- upvalues: MapTypographyVariantToFontEnumFunction (upval), GetFFlagTenFootUiSupportSortSubtitleFunction (upval)
		return {
			textStyles = {
				Font = MapTypographyVariantToFontEnumFunction(p2.Typography.HeadingSmall),
				TextSize = p2.Typography.HeadingSmall.FontSize,
				LineHeight = p2.Typography.HeadingSmall.LineHeight,
				TextColor3 = p2.Color.Content.Emphasis.Color3,
				TextTransparency = p2.Color.Content.Emphasis.Transparency
			},
			subtitleTextStyles = if GetFFlagTenFootUiSupportSortSubtitleFunction() then {
				Font = p2.Typography.BodyLarge.Font,
				TextSize = p2.Typography.BodyLarge.FontSize,
				LineHeight = p2.Typography.BodyLarge.LineHeight,
				TextColor3 = p2.Color.Content.Default.Color3
			} else nil,
			paddingAboveSubtitle = if GetFFlagTenFootUiSupportSortSubtitleFunction() then p2.Size.Size_100 else nil,
			paddingBottom = p2.Size.Size_400
		}
	end)
	local Margin = p1.margin or 0
	local TextSize = GetTextSizeFunction(p1.text, UseDesignTokensResult.textStyles.TextSize, UseDesignTokensResult.textStyles.Font, _Vector2)
	local Config = if GetFFlagTenFootUiSupportSortHeaderTooltipFunction() or GetFFlagTenFootUiSupportSortSubtitleFunction() then {
		TitleAndTooltipPadding = ReactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, Margin),
			PaddingRight = UDim.new(0, Margin),
			PaddingBottom = if GetFFlagTenFootUiSupportSortSubtitleFunction() then nil else UDim.new(0, UseDesignTokensResult.paddingBottom)
		}),
		TitleAndTooltipLayout = if GetFFlagTenFootUiSupportSortHeaderTooltipFunction() then ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder
		}) else nil,
		SortTitleTextLabel = ReactModule.createElement("TextLabel", CryoModule.Dictionary.join(UseDesignTokensResult.textStyles, {
			BackgroundTransparency = 1,
			Size = if GetFFlagTenFootUiSupportSortHeaderTooltipFunction() then UDim2.new(0, TextSize.X, 1, 0) else UDim2.fromScale(1, 1),
			Text = p1.text,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
			LayoutOrder = if GetFFlagTenFootUiSupportSortHeaderTooltipFunction() then 1 else nil
		})),
		SortTooltip = if GetFFlagTenFootUiSupportSortHeaderTooltipFunction() and p1.tooltipHoverText then ReactModule.createElement(IconWithTooltip, {
			triggerPointName = "GameSortTooltip",
			supportTenFootUi = true,
			layoutOrder = 2,
			tooltipOrientation = TooltipOrientation.Right,
			hoverText = p1.tooltipHoverText
		}) else nil
	} else nil
	
	return if GetFFlagTenFootUiSupportSortSubtitleFunction() then ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, TextSize.Y + UseDesignTokensResult.paddingBottom + (if p1.subtitleText and p1.subtitleHeight then p1.subtitleHeight else 0) + (if p1.subtitleText then UseDesignTokensResult.paddingAboveSubtitle else 0))
	}, {
		Padding = ReactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, Margin),
			PaddingRight = UDim.new(0, Margin),
			PaddingBottom = UDim.new(0, UseDesignTokensResult.paddingBottom)
		}),
		HeaderLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, UseDesignTokensResult.paddingAboveSubtitle)
		}),
		TitleAndTooltipFrame = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, TextSize.Y)
		}, Config),
		SubtitleTextLabel = if p1.subtitleText then ReactModule.createElement("TextLabel", CryoModule.Dictionary.join(UseDesignTokensResult.subtitleTextStyles, {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.fromScale(1, 1),
			Text = p1.subtitleText,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top
		})) else nil
	}) elseif GetFFlagTenFootUiSupportSortHeaderTooltipFunction() then ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, TextSize.Y + UseDesignTokensResult.paddingBottom)
	}, Config) else ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, TextSize.Y + UseDesignTokensResult.paddingBottom)
	}, ReactModule.createElement("UIPadding", {
		PaddingLeft = UDim.new(0, Margin),
		PaddingRight = UDim.new(0, Margin),
		PaddingBottom = UDim.new(0, UseDesignTokensResult.paddingBottom)
	}), ReactModule.createElement("TextLabel", CryoModule.Dictionary.join(UseDesignTokensResult.textStyles, {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		Text = p1.text,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Top
	})))
end