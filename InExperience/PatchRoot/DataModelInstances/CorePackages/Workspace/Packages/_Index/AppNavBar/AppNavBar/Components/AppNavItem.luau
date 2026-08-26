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

return reactModule.memo(function(p1)
	-- upvalues: useStyle (ref), useLocalization (ref), reactModule (ref), controlState (ref), fFlagShrinkAppNavBar (ref), fFlagAppNavLabelScaling (ref), navigationTab (ref), navigationTabLayout (ref)
	local tokens = useStyle().Tokens
	local var1 = useLocalization({ labelText = p1.item.labelText })
	local var2, var3 = reactModule.useState(controlState.Initialize)
	local captionSmall = tokens.Typography.CaptionSmall
	local var4 = if fFlagShrinkAppNavBar then nil else p1.systemBarLabelTextSizeBinding.default:getBinding()
	
	if not fFlagShrinkAppNavBar then
		reactModule.useEffect(function()
			-- upvalues: fFlagAppNavLabelScaling (copy), p1 (ref), var1 (ref), captionSmall (ref), tokens (ref)
			if fFlagAppNavLabelScaling then
				p1.systemBarLabelTextSizeBinding.default:setTextToMaxSize(var1.labelText or "", captionSmall.Font, Vector2.new(tokens.Size.Size_1200, tokens.Size.Size_1200), tokens.FontSize.FontSize_300)
				
				return
			end
			p1.systemBarLabelTextSizeBinding.default:getMinTextSize(var1.labelText or "", captionSmall.Font, Vector2.new(tokens.Size.Size_1200, tokens.Size.Size_1200))
		end, { var4, var1.labelText, tokens })
	end
	return reactModule.createElement(navigationTab, {
		iconImage = p1.item.iconImage,
		iconCheckedImage = p1.item.iconCheckedImage,
		renderIcon = if p1.item.renderIcon then function(p2)
			-- upvalues: p1 (ref), var2 (ref)
			return p1.item.renderIcon(p2, var2)
		end else nil,
		hasLabel = p1.hasLabel,
		labelText = var1.labelText,
		labelTypography = if fFlagShrinkAppNavBar then tokens.Typography.CaptionSmall else {
			Font = captionSmall.Font,
			FontSize = var4,
			LineHeight = captionSmall.LineHeight,
			LetterSpacing = captionSmall.LetterSpacing
		},
		isChecked = p1.isChecked,
		badgeVariant = p1.item.badgeVariant,
		badgeValue = p1.item.badgeValue,
		layout = navigationTabLayout.Stacked,
		anchorPoint = if p1.isCenterPositioned then Vector2.new(0.5, 0.5) else nil,
		position = if p1.isCenterPositioned then UDim2.fromScale(0.5, 0.5) else nil,
		onActivated = p1.item.onActivated,
		onStateChanged = if p1.item.renderIcon then function(_, p2)
			-- upvalues: var3 (ref)
			var3(p2)
		end else nil
	})
end, function(p1, p2)
	-- upvalues: cryoModule (ref), fFlagShrinkAppNavBar (ref)
	local var1 = cryoModule.Dictionary.equals(p1.item, p2.item)
	
	if var1 and not fFlagShrinkAppNavBar then
		var1 = p1.systemBarLabelTextSizeBinding == p2.systemBarLabelTextSizeBinding and (p1.isChecked == p2.isChecked and (p1.isCenterPositioned == p2.isCenterPositioned and p1.hasLabel == p2.hasLabel))
	end
	return var1
end)