local Parent = script.Parent.Parent.Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local _ = require(Parent.Foundation)
local UIBloxModule = require(Parent.UIBlox)
local SharedFlagsModule = require(Parent.SharedFlags)
local ResponsiveModule = require(Parent.Responsive)
local UsePreferredInputFunction = ResponsiveModule.usePreferredInput
local Input = ResponsiveModule.Input
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local ControlState = UIBloxModule.Core.Control.Enum.ControlState
local NavigationTab = UIBloxModule.App.Navigation.NavigationTab
local NavigationTabLayout = UIBloxModule.App.Navigation.Enum.NavigationTabLayout
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FFlagAppNavLabelScaling = SharedFlagsModule.FFlagAppNavLabelScaling
local FFlagShrinkAppNavBar = SharedFlagsModule.FFlagShrinkAppNavBar
local FFlagEnableNavRailTooltipAndTruncation = SharedFlagsModule.FFlagEnableNavRailTooltipAndTruncation

return ReactModule.memo(function(p1)
	-- upvalues: UseStyleFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), ControlState (copy), FFlagEnableNavRailTooltipAndTruncation (copy), UsePreferredInputFunction (copy), FFlagShrinkAppNavBar (copy), FFlagAppNavLabelScaling (copy), Input (copy), NavigationTab (copy), NavigationTabLayout (copy)
	local Tokens = UseStyleFunction().Tokens
	local UseLocalizationResult = UseLocalizationFunction({ labelText = p1.item.labelText })
	local UseStateResult, UseStateResult2 = ReactModule.useState(ControlState.Initialize)
	local UsePreferredInputResult = if FFlagEnableNavRailTooltipAndTruncation then UsePreferredInputFunction() else nil
	local CaptionSmall = Tokens.Typography.CaptionSmall
	local Binding = if FFlagShrinkAppNavBar then nil else p1.systemBarLabelTextSizeBinding.default:getBinding()
	
	if not FFlagShrinkAppNavBar then
		ReactModule.useEffect(function()
			-- upvalues: FFlagAppNavLabelScaling (upval), p1 (copy), UseLocalizationResult (copy), CaptionSmall (copy), Tokens (copy)
			if FFlagAppNavLabelScaling then
				p1.systemBarLabelTextSizeBinding.default:setTextToMaxSize(UseLocalizationResult.labelText or "", CaptionSmall.Font, Vector2.new(Tokens.Size.Size_1200, Tokens.Size.Size_1200), Tokens.FontSize.FontSize_300)
				
				return
			else
				p1.systemBarLabelTextSizeBinding.default:getMinTextSize(UseLocalizationResult.labelText or "", CaptionSmall.Font, Vector2.new(Tokens.Size.Size_1200, Tokens.Size.Size_1200))
			end
		end, { Binding, UseLocalizationResult.labelText, Tokens })
	end
	local IsUsePreferredInputResultMatch: boolean = FFlagEnableNavRailTooltipAndTruncation and UsePreferredInputResult == Input.Touch
	
	return ReactModule.createElement(NavigationTab, {
		iconImage = p1.item.iconImage,
		iconCheckedImage = p1.item.iconCheckedImage,
		renderIcon = if p1.item.renderIcon then function(p2)
			-- upvalues: p1 (copy), UseStateResult (copy)
			return p1.item.renderIcon(p2, UseStateResult)
		end else nil,
		hasLabel = p1.hasLabel,
		labelText = UseLocalizationResult.labelText,
		labelTypography = if FFlagShrinkAppNavBar then Tokens.Typography.CaptionSmall else {
			Font = CaptionSmall.Font,
			FontSize = Binding,
			LineHeight = CaptionSmall.LineHeight,
			LetterSpacing = CaptionSmall.LetterSpacing
		},
		labelMaxTextSize = if IsUsePreferredInputResultMatch then CaptionSmall.FontSize else nil,
		isChecked = p1.isChecked,
		badgeVariant = p1.item.badgeVariant,
		badgeValue = p1.item.badgeValue,
		layout = NavigationTabLayout.Stacked,
		anchorPoint = if p1.isCenterPositioned then Vector2.new(0.5, 0.5) else nil,
		position = if p1.isCenterPositioned then UDim2.fromScale(0.5, 0.5) else nil,
		onActivated = p1.item.onActivated,
		onStateChanged = if p1.item.renderIcon then function(_, p2)
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(p2)
		end else nil,
		width = if FFlagEnableNavRailTooltipAndTruncation then p1.width else nil,
		fillWidth = if FFlagEnableNavRailTooltipAndTruncation then p1.fillWidth else nil,
		enableTooltip = if FFlagEnableNavRailTooltipAndTruncation then p1.enableTooltip else nil,
		tooltipSide = if FFlagEnableNavRailTooltipAndTruncation then p1.tooltipSide else nil,
		tooltipAlign = if FFlagEnableNavRailTooltipAndTruncation then p1.tooltipAlign else nil,
		tooltipOffset = if FFlagEnableNavRailTooltipAndTruncation then p1.tooltipOffset else nil
	})
end, function(p1, p2): boolean
	-- upvalues: CryoModule (copy), FFlagShrinkAppNavBar (copy), FFlagEnableNavRailTooltipAndTruncation (copy)
	local IsHasLabelMatch: boolean = CryoModule.Dictionary.equals(p1.item, p2.item) and (if FFlagShrinkAppNavBar then p1.isChecked == p2.isChecked and (p1.isCenterPositioned == p2.isCenterPositioned and p1.hasLabel == p2.hasLabel) else p1.systemBarLabelTextSizeBinding == p2.systemBarLabelTextSizeBinding and (p1.isChecked == p2.isChecked and (p1.isCenterPositioned == p2.isCenterPositioned and p1.hasLabel == p2.hasLabel)))
	
	if FFlagEnableNavRailTooltipAndTruncation then
		IsHasLabelMatch = IsHasLabelMatch and (p1.width == p2.width and (p1.fillWidth == p2.fillWidth and (p1.enableTooltip == p2.enableTooltip and (p1.tooltipSide == p2.tooltipSide and p1.tooltipAlign == p2.tooltipAlign))) and p1.tooltipOffset == p2.tooltipOffset)
	end
	return IsHasLabelMatch
end)