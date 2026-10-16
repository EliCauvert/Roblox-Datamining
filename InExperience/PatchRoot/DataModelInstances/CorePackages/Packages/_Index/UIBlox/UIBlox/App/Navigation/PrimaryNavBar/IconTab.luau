local Parent = script.Parent.Parent
local Parent1 = Parent.Parent.Parent
local Parent2 = Parent1.Parent
local ReactModule = require(Parent2.React)
local Object = require(Parent2.LuauPolyfill).Object
local UseStyleModule = require(Parent1.Core.Style.useStyle)
local Label = require(Parent1.Core.ImageSet.ImageSetComponent).Label
local GenericTextLabelModule = require(Parent1.Core.Text.GenericTextLabel.GenericTextLabel)
local PlacementModule = require(Parent.Enum.Placement)
local ControlStateModule = require(Parent1.Core.Control.Enum.ControlState)
local IconSizeModule = require(Parent1.App.ImageSet.Enum.IconSize)
local GetIconSizeModule = require(Parent1.App.ImageSet.getIconSize)
local HorizontalContainerModule = require(script.Parent.HorizontalContainer)
local _ = require(script.Parent.Types)
local ConstantsModule = require(script.Parent.Constants)
local config = {
	selected = false,
	controlState = ControlStateModule.Default,
	padding = {
		left = ConstantsModule.ICON_TAB_ITEM_PADDING_LEFT,
		right = ConstantsModule.ICON_TAB_ITEM_PADDING_RIGHT
	}
}

return function(p1) --[[ Line: 45 | Named "IconTab" ]]
	-- upvalues: Object (copy), config (copy), ControlStateModule (copy), UseStyleModule (copy), GetIconSizeModule (copy), IconSizeModule (copy), ConstantsModule (copy), HorizontalContainerModule (copy), ReactModule (copy), Label (copy), PlacementModule (copy), GenericTextLabelModule (copy)
	local AssignResult = Object.assign({}, config, p1)
	local Item = AssignResult.item
	local IsControlStateMatch = AssignResult.controlState == ControlStateModule.SelectedPressed
	local Selected = AssignResult.selected
	local UseStyleModuleResult = UseStyleModule()
	local Emphasis = if Selected then UseStyleModuleResult.Tokens.Color.Content.Emphasis else UseStyleModuleResult.Tokens.Color.Content.Default
	local IconSizeModule1 = GetIconSizeModule(IconSizeModule.Medium, UseStyleModuleResult)
	local ICONTABHEIGHTDelta = ConstantsModule.ICON_TAB_HEIGHT - ConstantsModule.ICON_TAB_PADDING * 2
	assert(Item.icon == nil or Item.iconComponent == nil, "icon or iconComponent cannot be assigned at same time")
	
	return HorizontalContainerModule({
		size = UDim2.new(0, 0, 0, ConstantsModule.ICON_TAB_HEIGHT),
		automaticSize = Enum.AutomaticSize.X,
		roundedBackgroundSize = UDim2.new(1, -(ConstantsModule.ICON_TAB_PADDING * 2), 0, ICONTABHEIGHTDelta),
		roundedBackgroundPosition = UDim2.fromOffset(ConstantsModule.ICON_TAB_PADDING, ConstantsModule.ICON_TAB_PADDING),
		roundedBackgroundColor = UseStyleModuleResult.Theme.Divider.Color,
		roundedBackgroundTransparency = ConstantsModule.ICON_TAB_SELECTED_TRANSPARENCY,
		spacing = if Item.icon == nil and Item.iconComponent == nil then 0 else ConstantsModule.ICON_TAB_ITEM_ICON_TITLE_SPACING,
		padding = AssignResult.padding,
		showRoundedBackground = if Item.showRoundedBackground == nil then Selected else Item.showRoundedBackground,
		showOverlay = if Item.showOverlay == nil then IsControlStateMatch else Item.showOverlay
	}, {
		Icon = if Item.icon == nil then if Item.iconComponent == nil then nil else ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.new(0, IconSizeModule1, 0, IconSizeModule1)
		}, ReactModule.createElement(Item.iconComponent, {
			hovered = false,
			placement = PlacementModule.Bottom,
			selected = Selected,
			pressed = IsControlStateMatch
		})) else ReactModule.createElement(Label, {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			Size = UDim2.new(0, IconSizeModule1, 0, IconSizeModule1),
			Image = Item.icon,
			ScaleType = Enum.ScaleType.Fit,
			ImageColor3 = Emphasis.Color3,
			ImageTransparency = Emphasis.Transparency
		}),
		Title = ReactModule.createElement(GenericTextLabelModule, {
			LayoutOrder = 2,
			fluidSizing = false,
			TextWrapped = true,
			BackgroundTransparency = 1,
			Size = UDim2.new(0, 0, 1, 0),
			AutomaticSize = Enum.AutomaticSize.X,
			Text = Item.title,
			TextXAlignment = Enum.TextXAlignment.Left,
			colorStyle = {
				Transparency = 0,
				Color = if Selected then UseStyleModuleResult.Theme.TextEmphasis.Color else UseStyleModuleResult.Theme.TextDefault.Color
			},
			fontStyle = UseStyleModuleResult.Tokens.Typography.HeadingSmall,
			TextTruncate = Enum.TextTruncate.AtEnd
		})
	})
end