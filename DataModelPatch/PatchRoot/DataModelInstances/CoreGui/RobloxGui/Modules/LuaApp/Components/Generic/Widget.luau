local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local FitChildrenModule = require(Modules.LuaApp.FitChildren)
local IconTextBarModule = require(Modules.LuaApp.Components.Generic.IconTextBar)
local _Rect = Rect.new(9, 9, 9, 9)
local config = {
	PaddingTop = UDim.new(0, 0),
	PaddingBottom = UDim.new(0, 0),
	PaddingLeft = UDim.new(0, 0),
	PaddingRight = UDim.new(0, 0)
}
local config1 = {
	PaddingTop = UDim.new(0, 0),
	PaddingBottom = UDim.new(0, 0),
	PaddingLeft = UDim.new(0, 0),
	PaddingRight = UDim.new(0, 0)
}
local Widget = RoactModule.PureComponent:extend("Widget")
Widget.defaultProps = {
	backgroundTransparency = 0,
	iconSize = 26,
	titleGutterSize = 9,
	titleSize = 28,
	backgroundColor = require(Modules.LuaApp.Themes.Colors).White,
	titleFont = Enum.Font.SourceSans
}

function Widget.render(p1)
	-- upvalues: CryoModule (copy), config (copy), config1 (copy), RoactModule (copy), FitChildrenModule (copy), _Rect (copy), IconTextBarModule (copy)
	local JoinResult = CryoModule.Dictionary.join(config1, p1.props.contentPadding or {})
	local RenderContent = p1.props.renderContent
	
	return RoactModule.createElement(FitChildrenModule.FitImageLabel, {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		LayoutOrder = p1.props.layoutOrder,
		Size = UDim2.new(1, 0, 0, 0),
		fitAxis = FitChildrenModule.FitAxis.Height,
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = _Rect,
		Image = p1.props.backgroundImage,
		ImageColor3 = p1.props.backgroundColor,
		ImageTransparency = p1.props.backgroundTransparency
	}, {
		Layout = RoactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
		TitleBar = RoactModule.createElement(IconTextBarModule, {
			layoutOrder = 1,
			padding = CryoModule.Dictionary.join(config, p1.props.titlePadding or {}),
			icon = p1.props.icon,
			iconSize = p1.props.iconSize,
			gutterSize = p1.props.titleGutterSize,
			textKey = p1.props.titleKey,
			textSize = p1.props.titleSize,
			textColor = p1.props.titleColor,
			textFont = p1.props.titleFont
		}),
		ContentFrame = RenderContent and RoactModule.createElement(FitChildrenModule.FitFrame, {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0),
			fitAxis = FitChildrenModule.FitAxis.Height
		}, {
			Layout = RoactModule.createElement("UIListLayout"),
			Padding = RoactModule.createElement("UIPadding", JoinResult),
			Content = RoactModule.createElement(RenderContent)
		})
	})
end

return Widget