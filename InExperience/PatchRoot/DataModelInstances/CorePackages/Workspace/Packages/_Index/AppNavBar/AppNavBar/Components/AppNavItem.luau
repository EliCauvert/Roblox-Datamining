local parent = script.Parent.Parent.Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local localizationModule = require(parent.Localization)
local sharedFlagsModule = require(parent.SharedFlags)
local useStyle = UIBloxModule.Core.Style.useStyle
local controlState = UIBloxModule.Core.Control.Enum.ControlState
local navigationTab = UIBloxModule.App.Navigation.NavigationTab
local navigationTabLayout = UIBloxModule.App.Navigation.Enum.NavigationTabLayout
local useLocalization = localizationModule.Hooks.useLocalization
local fFlagAppNavLabelScaling = sharedFlagsModule.FFlagAppNavLabelScaling
local fFlagShrinkAppNavBar = sharedFlagsModule.FFlagShrinkAppNavBar

return reactModule.memo(function(p0) --[[ line: 52 | named "AppNavItem" ]]
	-- upvalues: useStyle (ref), useLocalization (ref), reactModule (ref), controlState (ref), fFlagShrinkAppNavBar (ref), fFlagAppNavLabelScaling (ref), navigationTab (ref), navigationTabLayout (ref)
	local tokens = useStyle().Tokens
	local var5 = useLocalization({ labelText = p0.item.labelText })
	local var6, var7 = reactModule.useState(controlState.Initialize)
	local captionSmall = tokens.Typography.CaptionSmall
	local var8 = if fFlagShrinkAppNavBar then nil else p0.systemBarLabelTextSizeBinding.default:getBinding()
	
	if not fFlagShrinkAppNavBar then
		reactModule.useEffect(function() --[[ line: 62 ]]
			-- upvalues: fFlagAppNavLabelScaling (copy), p0 (ref), var5 (ref), captionSmall (ref), tokens (ref)
			if fFlagAppNavLabelScaling then
				p0.systemBarLabelTextSizeBinding.default:setTextToMaxSize(var5.labelText or "", captionSmall.Font, Vector2.new(tokens.Size.Size_1200, tokens.Size.Size_1200), tokens.FontSize.FontSize_300)
				
				return
			end
			p0.systemBarLabelTextSizeBinding.default:getMinTextSize(var5.labelText or "", captionSmall.Font, Vector2.new(tokens.Size.Size_1200, tokens.Size.Size_1200))
		end, { var8, var5.labelText, tokens })
	end
	return reactModule.createElement(navigationTab, {
		iconImage = p0.item.iconImage,
		iconCheckedImage = p0.item.iconCheckedImage,
		renderIcon = if p0.item.renderIcon then function(p1) --[[ line: 84 ]]
			-- upvalues: p0 (ref), var6 (ref)
			return p0.item.renderIcon(p1, var6)
		end else nil,
		hasLabel = p0.hasLabel,
		labelText = var5.labelText,
		labelTypography = if fFlagShrinkAppNavBar then tokens.Typography.CaptionSmall else {
			Font = captionSmall.Font,
			FontSize = var8,
			LineHeight = captionSmall.LineHeight,
			LetterSpacing = captionSmall.LetterSpacing
		},
		isChecked = p0.isChecked,
		badgeVariant = p0.item.badgeVariant,
		badgeValue = p0.item.badgeValue,
		layout = navigationTabLayout.Stacked,
		anchorPoint = if p0.isCenterPositioned then Vector2.new(0.5, 0.5) else nil,
		position = if p0.isCenterPositioned then UDim2.fromScale(0.5, 0.5) else nil,
		onActivated = p0.item.onActivated,
		onStateChanged = if p0.item.renderIcon then function(_, p2) --[[ line: 106 ]]
			-- upvalues: var7 (ref)
			var7(p2)
		end else nil
	})
end, function(p3, p4) --[[ line: 43 | named "arePropsEqual" ]]
	-- upvalues: cryoModule (ref), fFlagShrinkAppNavBar (ref)
	local var9 = cryoModule.Dictionary.equals(p3.item, p4.item)
	
	if var9 and not fFlagShrinkAppNavBar then
		var9 = p3.systemBarLabelTextSizeBinding == p4.systemBarLabelTextSizeBinding and (p3.isChecked == p4.isChecked and (p3.isCenterPositioned == p4.isCenterPositioned and p3.hasLabel == p4.hasLabel))
	end
	return var9
end)