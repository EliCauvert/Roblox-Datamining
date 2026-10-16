local parent = script.Parent.Parent
local parent_1 = parent.Parent.Parent
local parent_2 = parent_1.Parent
local UIBloxConfigModule = require(parent_1.UIBloxConfig)
local reactModule = require(parent_2.React)
local object = require(parent_2.LuauPolyfill).Object
local useStyleModule = require(parent_1.Core.Style.useStyle)
local label = require(parent_1.Core.ImageSet.ImageSetComponent).Label
local genericTextLabelModule = require(parent_1.Core.Text.GenericTextLabel.GenericTextLabel)
local placementModule = require(parent.Enum.Placement)
local controlStateModule = require(parent_1.Core.Control.Enum.ControlState)
local iconSizeModule = require(parent_1.App.ImageSet.Enum.IconSize)
local getIconSizeModule = require(parent_1.App.ImageSet.getIconSize)
local horizontalContainerModule = require(script.Parent.HorizontalContainer)
local _ = require(script.Parent.Types)
local constantsModule = require(script.Parent.Constants)
local t = {
	selected = false,
	controlState = controlStateModule.Default,
	padding = {
		left = constantsModule.ICON_TAB_ITEM_PADDING_LEFT,
		right = constantsModule.ICON_TAB_ITEM_PADDING_RIGHT
	}
}

return function(p1)
	-- upvalues: object (ref), t (ref), controlStateModule (ref), useStyleModule (ref), UIBloxConfigModule (ref), getIconSizeModule (ref), iconSizeModule (ref), constantsModule (ref), horizontalContainerModule (ref), reactModule (ref), label (ref), placementModule (ref), genericTextLabelModule (ref)
	local var1 = object.assign({}, t, p1)
	local item = var1.item
	local var2 = var1.controlState == controlStateModule.SelectedPressed
	local selected = var1.selected
	local var3 = useStyleModule()
	local var4 = if selected then if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then var3.Tokens.Color.Content.Emphasis else var3.Tokens.Semantic.Color.Icon.Emphasis elseif UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then var3.Tokens.Color.Content.Default else var3.Tokens.Semantic.Color.Icon.Default
	local var5 = getIconSizeModule(iconSizeModule.Medium, var3)
	local var6 = constantsModule.ICON_TAB_HEIGHT - constantsModule.ICON_TAB_PADDING * 2
	assert(if item.icon ~= nil then item.iconComponent == nil else true, "icon or iconComponent cannot be assigned at same time")
	
	return horizontalContainerModule({
		size = UDim2.new(0, 0, 0, constantsModule.ICON_TAB_HEIGHT),
		automaticSize = Enum.AutomaticSize.X,
		roundedBackgroundSize = UDim2.new(1, -(constantsModule.ICON_TAB_PADDING * 2), 0, var6),
		roundedBackgroundPosition = UDim2.fromOffset(constantsModule.ICON_TAB_PADDING, constantsModule.ICON_TAB_PADDING),
		roundedBackgroundColor = var3.Theme.Divider.Color,
		roundedBackgroundTransparency = constantsModule.ICON_TAB_SELECTED_TRANSPARENCY,
		spacing = if item.icon == nil and item.iconComponent == nil then 0 else constantsModule.ICON_TAB_ITEM_ICON_TITLE_SPACING,
		padding = var1.padding,
		showRoundedBackground = if item.showRoundedBackground ~= nil then selected else item.showRoundedBackground,
		showOverlay = if item.showOverlay ~= nil then var2 else item.showOverlay
	}, {
		Icon = if item.icon ~= nil then if item.iconComponent ~= nil then nil else reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.new(0, var5, 0, var5)
		}, reactModule.createElement(item.iconComponent, {
			hovered = false,
			placement = placementModule.Bottom,
			selected = selected,
			pressed = var2
		})) else reactModule.createElement(label, {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			Size = UDim2.new(0, var5, 0, var5),
			Image = item.icon,
			ScaleType = Enum.ScaleType.Fit,
			ImageColor3 = var4.Color3,
			ImageTransparency = var4.Transparency
		}),
		Title = reactModule.createElement(genericTextLabelModule, {
			LayoutOrder = 2,
			fluidSizing = false,
			TextWrapped = true,
			BackgroundTransparency = 1,
			Size = UDim2.new(0, 0, 1, 0),
			AutomaticSize = Enum.AutomaticSize.X,
			Text = item.title,
			TextXAlignment = Enum.TextXAlignment.Left,
			colorStyle = {
				Transparency = 0,
				Color = if selected then var3.Theme.TextEmphasis.Color else var3.Theme.TextDefault.Color
			},
			fontStyle = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then var3.Tokens.Typography.HeadingSmall else var3.Tokens.Semantic.Typography.Header,
			TextTruncate = Enum.TextTruncate.AtEnd
		})
	})
end