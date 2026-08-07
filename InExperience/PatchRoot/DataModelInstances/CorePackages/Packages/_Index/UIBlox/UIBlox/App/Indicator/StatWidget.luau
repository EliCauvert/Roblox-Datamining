local app = script:FindFirstAncestor("App")
local parent = app.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local cryoModule = require(parent_1.Cryo)
local _ = require(app.ImageSet.ImagesTypes)
local _ = require(app.Style.StyleTypes)
local iconSizeModule = require(app.ImageSet.Enum.IconSize)
local getIconSizeModule = require(app.ImageSet.getIconSize)
local label = require(parent.Core.ImageSet.ImageSetComponent).Label
local genericTextLabelModule = require(parent.Core.Text.GenericTextLabel.GenericTextLabel)
local useStyleModule = require(parent.Core.Style.useStyle)
local t = {
	containerPaddingLeft = 12,
	containerPaddingRight = 12,
	containerGap = 12,
	dataGap = 0,
	iconSize = getIconSizeModule(iconSizeModule.Large)
}

return function(p0) --[[ line: 65 | named "StatWidget" ]]
	-- upvalues: useStyleModule (ref), cryoModule (ref), t (ref), reactModule (ref), label (ref), genericTextLabelModule (ref)
	local var8 = useStyleModule()
	local var9 = cryoModule.Dictionary.join(t, p0.styleProps or {})
	local containerPaddingLeft = var9.containerPaddingLeft
	local containerPaddingRight = var9.containerPaddingRight
	local containerGap = var9.containerGap
	local iconSize = var9.iconSize
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Position = p0.position,
		AnchorPoint = p0.anchorPoint,
		Size = p0.size,
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = p0.layoutOrder
	}, {
		ListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = p0.horizontalAlignment,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, containerGap)
		}),
		Padding = reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, containerPaddingLeft),
			PaddingRight = UDim.new(0, containerPaddingRight)
		}),
		Icon = reactModule.createElement(label, {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, iconSize, 0, iconSize),
			Image = p0.icon,
			ImageColor3 = (var9.iconContentColor or var8.Theme.IconEmphasis).Color,
			Position = UDim2.new(0, 0, 0, 0)
		}),
		TextSection = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(0, 0),
			AutomaticSize = Enum.AutomaticSize.XY,
			Position = UDim2.new(0, iconSize + containerGap, 0, 0)
		}, {
			ListLayout = reactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				Padding = UDim.new(0, var9.dataGap)
			}),
			Number = reactModule.createElement(genericTextLabelModule, {
				LayoutOrder = 1,
				fluidSizing = true,
				TextWrapped = false,
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(0, 0),
				AutomaticSize = Enum.AutomaticSize.XY,
				Text = p0.countText,
				TextXAlignment = Enum.TextXAlignment.Left,
				colorStyle = var9.dataContentColor or var8.Theme.TextEmphasis,
				fontStyle = var8.Font.Title,
				TextTruncate = Enum.TextTruncate.AtEnd
			}),
			Label = reactModule.createElement(genericTextLabelModule, {
				LayoutOrder = 2,
				fluidSizing = true,
				TextWrapped = false,
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(0, 0),
				AutomaticSize = Enum.AutomaticSize.XY,
				Text = p0.labelText,
				TextXAlignment = Enum.TextXAlignment.Left,
				colorStyle = var9.dataLabelContentColor or var8.Theme.TextEmphasis,
				fontStyle = var8.Font.CaptionHeader,
				TextTruncate = Enum.TextTruncate.AtEnd
			})
		})
	})
end