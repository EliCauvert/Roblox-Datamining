local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(Modules.Common.Roact)
local ConstantsModule = require(Modules.LuaApp.Constants)
local FitChildrenModule = require(Modules.LuaApp.FitChildren)
local FitTextLabelModule = require(Modules.LuaApp.Components.FitTextLabel)
local LocalizedFitTextLabelModule = require(Modules.LuaApp.Components.LocalizedFitTextLabel)
local ImageSetLabel = require(game:GetService("CorePackages").Packages.UIBlox).Core.ImageSet.ImageSetLabel
local FitImageTextFrame = RoactModule.PureComponent:extend("FitImageTextFrame")
FitImageTextFrame.defaultProps = {
	LayoutOrder = 1,
	padding = 0,
	Position = UDim2.new(0, 0, 0, 0),
	Size = UDim2.new(0, 0, 1, 0),
	VerticalAlignment = Enum.VerticalAlignment.Center,
	imageProps = {
		ImageTransparency = 0,
		ImageColor3 = ConstantsModule.Color.GRAY2
	},
	textProps = {
		TextTransparency = 0,
		useLocalizedText = false,
		Font = Enum.Font.SourceSans,
		TextColor3 = ConstantsModule.Color.GRAY2
	}
}

function FitImageTextFrame.render(p1)
	-- upvalues: ImageSetLabel (copy), RoactModule (copy), FitChildrenModule (copy), LocalizedFitTextLabelModule (copy), FitTextLabelModule (copy)
	local ImageProps = p1.props.imageProps
	local TextProps = p1.props.textProps
	
	return RoactModule.createElement(FitChildrenModule.FitFrame, {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Position = p1.props.Position,
		Size = p1.props.Size,
		LayoutOrder = p1.props.LayoutOrder,
		fitAxis = FitChildrenModule.FitAxis.Width
	}, {
		Layout = RoactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = p1.props.VerticalAlignment,
			Padding = UDim.new(0, p1.props.padding)
		}),
		Image = RoactModule.createElement(ImageSetLabel, {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = ImageProps.Size,
			Image = ImageProps.Image,
			ImageColor3 = ImageProps.ImageColor3,
			ImageTransparency = ImageProps.ImageTransparency
		}),
		Text = RoactModule.createElement(TextProps.useLocalizedText and LocalizedFitTextLabelModule or FitTextLabelModule, {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(0, 0, 1, 0),
			Font = TextProps.Font,
			Text = TextProps.Text,
			TextSize = TextProps.TextSize,
			TextColor3 = TextProps.TextColor3,
			TextTransparency = TextProps.TextTransparency,
			fitAxis = FitChildrenModule.FitAxis.Width
		})
	})
end

return FitImageTextFrame