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

return function(p0) --[[ line: 46 | named "IconTab" ]]
	-- upvalues: object (ref), t (ref), controlStateModule (ref), useStyleModule (ref), UIBloxConfigModule (ref), getIconSizeModule (ref), iconSizeModule (ref), constantsModule (ref), horizontalContainerModule (ref), reactModule (ref), label (ref), placementModule (ref), genericTextLabelModule (ref)
	local var11 = object.assign({}, t, p0)
	local item = var11.item
	local var12 = var11.controlState == controlStateModule.SelectedPressed
	local selected = var11.selected
	local var13 = useStyleModule()
	local var14 = if selected then if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then var13.Tokens.Color.Content.Emphasis else var13.Tokens.Semantic.Color.Icon.Emphasis elseif UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then var13.Tokens.Color.Content.Default else var13.Tokens.Semantic.Color.Icon.Default
	local var15 = getIconSizeModule(iconSizeModule.Medium, var13)
	local var16 = constantsModule.ICON_TAB_HEIGHT - constantsModule.ICON_TAB_PADDING * 2
	assert(if item.icon ~= nil then item.iconComponent == nil else true, "icon or iconComponent cannot be assigned at same time")
	
	return horizontalContainerModule({
		size = UDim2.new(0, 0, 0, constantsModule.ICON_TAB_HEIGHT),
		automaticSize = Enum.AutomaticSize.X,
		roundedBackgroundSize = UDim2.new(1, -(constantsModule.ICON_TAB_PADDING * 2), 0, var16),
		roundedBackgroundPosition = UDim2.fromOffset(constantsModule.ICON_TAB_PADDING, constantsModule.ICON_TAB_PADDING),
		roundedBackgroundColor = var13.Theme.Divider.Color,
		roundedBackgroundTransparency = constantsModule.ICON_TAB_SELECTED_TRANSPARENCY,
		spacing = if item.icon == nil and item.iconComponent == nil then 0 else constantsModule.ICON_TAB_ITEM_ICON_TITLE_SPACING,
		padding = var11.padding,
		showRoundedBackground = if item.showRoundedBackground ~= nil then selected else item.showRoundedBackground,
		showOverlay = if item.showOverlay ~= nil then var12 else item.showOverlay
	}, {
		Icon = if item.icon ~= nil then if item.iconComponent ~= nil then nil else reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.new(0, var15, 0, var15)
		}, reactModule.createElement(item.iconComponent, {
			hovered = false,
			placement = placementModule.Bottom,
			selected = selected,
			pressed = var12
		})) else reactModule.createElement(label, {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			Size = UDim2.new(0, var15, 0, var15),
			Image = item.icon,
			ScaleType = Enum.ScaleType.Fit,
			ImageColor3 = var14.Color3,
			ImageTransparency = var14.Transparency
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
				Color = if selected then var13.Theme.TextEmphasis.Color else var13.Theme.TextDefault.Color
			},
			fontStyle = if UIBloxConfigModule.deprecateComponentGlobalSemanticTokenUse then var13.Tokens.Typography.HeadingSmall else var13.Tokens.Semantic.Typography.Header,
			TextTruncate = Enum.TextTruncate.AtEnd
		})
	})
end