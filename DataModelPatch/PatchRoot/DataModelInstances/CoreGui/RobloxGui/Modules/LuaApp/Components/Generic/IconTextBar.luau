local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local FitChildrenModule = require(Modules.LuaApp.FitChildren)
local DEPRECATEDImageSetLabelModule = require(Modules.LuaApp.Components.DEPRECATED_ImageSetLabel)
local LocalizedTextLabelModule = require(Modules.LuaApp.Components.LocalizedTextLabel)
local config = {
	PaddingTop = UDim.new(0, 0),
	PaddingBottom = UDim.new(0, 0),
	PaddingLeft = UDim.new(0, 0),
	PaddingRight = UDim.new(0, 0)
}
local IconTextBar = RoactModule.PureComponent:extend("IconTextBar")
IconTextBar.defaultProps = {
	iconSize = 26,
	gutterSize = 9,
	textSize = 28,
	textColor = require(Modules.LuaApp.Themes.Colors).Green,
	textFont = Enum.Font.SourceSans
}

function IconTextBar.render(p1)
	-- upvalues: CryoModule (copy), config (copy), RoactModule (copy), FitChildrenModule (copy), DEPRECATEDImageSetLabelModule (copy), LocalizedTextLabelModule (copy)
	local Icon = p1.props.icon
	local IconSize = p1.props.iconSize
	local GutterSize = p1.props.gutterSize
	local TextKey = p1.props.textKey
	local TextSize = p1.props.textSize
	local TextColor = p1.props.textColor
	local TextFont = p1.props.textFont
	
	return RoactModule.createElement(FitChildrenModule.FitFrame, {
		BackgroundTransparency = 1,
		LayoutOrder = p1.props.layoutOrder,
		Size = UDim2.new(1, 0, 0, 0),
		fitAxis = FitChildrenModule.FitAxis.Height
	}, {
		Layout = RoactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, GutterSize)
		}),
		Padding = RoactModule.createElement("UIPadding", (CryoModule.Dictionary.join(config, p1.props.padding or {}))),
		Icon = Icon and RoactModule.createElement(DEPRECATEDImageSetLabelModule, {
			LayoutOrder = 1,
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			Size = UDim2.new(0, IconSize, 0, IconSize),
			Image = Icon
		}),
		Text = TextKey and RoactModule.createElement(LocalizedTextLabelModule, {
			LayoutOrder = 2,
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			TextXAlignment = Enum.TextXAlignment.Left,
			Size = UDim2.new(1, if Icon then -(IconSize + GutterSize) else 0, 0, TextSize),
			TextSize = TextSize,
			TextColor3 = TextColor,
			Font = TextFont,
			Text = TextKey
		})
	})
end

return IconTextBar