local App = script:FindFirstAncestor("App")
local Parent = App.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local CryoModule = require(Parent1.Cryo)
local _ = require(App.ImageSet.ImagesTypes)
local _ = require(App.Style.StyleTypes)
local Label = require(Parent.Core.ImageSet.ImageSetComponent).Label
local GenericTextLabelModule = require(Parent.Core.Text.GenericTextLabel.GenericTextLabel)
local UseStyleModule = require(Parent.Core.Style.useStyle)
local config = {
	containerPaddingLeft = 12,
	containerPaddingRight = 12,
	containerGap = 12,
	dataGap = 0,
	iconSize = require(App.ImageSet.getIconSize)(require(App.ImageSet.Enum.IconSize).Large)
}

return function(p1)
	-- upvalues: UseStyleModule (copy), CryoModule (copy), config (copy), ReactModule (copy), Label (copy), GenericTextLabelModule (copy)
	local UseStyleModuleResult = UseStyleModule()
	local JoinResult = CryoModule.Dictionary.join(config, p1.styleProps or {})
	local ContainerGap = JoinResult.containerGap
	local IconSize = JoinResult.iconSize
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Position = p1.position,
		AnchorPoint = p1.anchorPoint,
		Size = p1.size,
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = p1.layoutOrder
	}, {
		ListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = p1.horizontalAlignment,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, ContainerGap)
		}),
		Padding = ReactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, JoinResult.containerPaddingLeft),
			PaddingRight = UDim.new(0, JoinResult.containerPaddingRight)
		}),
		Icon = ReactModule.createElement(Label, {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, IconSize, 0, IconSize),
			Image = p1.icon,
			ImageColor3 = (JoinResult.iconContentColor or UseStyleModuleResult.Theme.IconEmphasis).Color,
			Position = UDim2.new(0, 0, 0, 0)
		}),
		TextSection = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(0, 0),
			AutomaticSize = Enum.AutomaticSize.XY,
			Position = UDim2.new(0, IconSize + ContainerGap, 0, 0)
		}, {
			ListLayout = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				Padding = UDim.new(0, JoinResult.dataGap)
			}),
			Number = ReactModule.createElement(GenericTextLabelModule, {
				LayoutOrder = 1,
				fluidSizing = true,
				TextWrapped = false,
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(0, 0),
				AutomaticSize = Enum.AutomaticSize.XY,
				Text = p1.countText,
				TextXAlignment = Enum.TextXAlignment.Left,
				colorStyle = JoinResult.dataContentColor or UseStyleModuleResult.Theme.TextEmphasis,
				fontStyle = UseStyleModuleResult.Font.Title,
				TextTruncate = Enum.TextTruncate.AtEnd
			}),
			Label = ReactModule.createElement(GenericTextLabelModule, {
				LayoutOrder = 2,
				fluidSizing = true,
				TextWrapped = false,
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(0, 0),
				AutomaticSize = Enum.AutomaticSize.XY,
				Text = p1.labelText,
				TextXAlignment = Enum.TextXAlignment.Left,
				colorStyle = JoinResult.dataLabelContentColor or UseStyleModuleResult.Theme.TextEmphasis,
				fontStyle = UseStyleModuleResult.Font.CaptionHeader,
				TextTruncate = Enum.TextTruncate.AtEnd
			})
		})
	})
end