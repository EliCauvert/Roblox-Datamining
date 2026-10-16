local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local ImmutableModule = require(script.Parent.Parent.Immutable)
local ConstantsModule = require(script.Parent.Parent.Constants)
local LineWidth = ConstantsModule.GeneralFormatting.LineWidth
local LineColor = ConstantsModule.GeneralFormatting.LineColor
local ArrowWidth = ConstantsModule.GeneralFormatting.ArrowWidth
local RightArrow = ConstantsModule.Image.RightArrow
local DownArrow = ConstantsModule.Image.DownArrow
local BannerButton = RoactModule.Component:extend("BannerButton")

function BannerButton.render(p1) --[[ Line: 14 ]]
	-- upvalues: RoactModule (copy), DownArrow (copy), RightArrow (copy), ArrowWidth (copy), LineWidth (copy), LineColor (copy), ImmutableModule (copy)
	local Prop = p1.props[RoactModule.Children] or {}
	local Size = p1.props.size
	local Pos = p1.props.pos
	local IsExpandable = p1.props.isExpandable
	local IsExpanded = p1.props.isExpanded
	local LayoutOrder = p1.props.layoutOrder
	local Inset = p1.props.inset or 0
	local OnButtonPress = p1.props.onButtonPress
	local OnMouseEnter = p1.props.onMouseEnter
	local OnMouseLeave = p1.props.onMouseLeave
	local OnMouseMove = p1.props.onMouseMove
	local OnMouse2Click = p1.props.onMouse2Click
	local config = {
		BannerButtonArrow = OnButtonPress and RoactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			Visible = IsExpandable,
			Image = IsExpanded and DownArrow or RightArrow,
			Size = UDim2.new(0, ArrowWidth, 0, ArrowWidth),
			Position = UDim2.new(0, Inset, 0.5, -ArrowWidth / 2)
		})
	}
	
	if not p1.props.hideLines then
		config.HorizontalLineTop = RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, LineWidth),
			BackgroundColor3 = LineColor
		})
		config.HorizontalLineBottom = RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, LineWidth),
			Position = UDim2.new(0, 0, 1, -LineWidth),
			BackgroundColor3 = LineColor
		})
	end
	return RoactModule.createElement("ImageButton", {
		Size = Size,
		Position = Pos,
		BackgroundTransparency = 1,
		LayoutOrder = LayoutOrder,
		[RoactModule.Event.Activated] = OnButtonPress,
		[RoactModule.Event.MouseEnter] = OnMouseEnter,
		[RoactModule.Event.MouseLeave] = OnMouseLeave,
		[RoactModule.Event.MouseMoved] = OnMouseMove,
		[RoactModule.Event.MouseButton2Click] = OnMouse2Click
	}, ImmutableModule.JoinDictionaries(config, Prop))
end

return BannerButton