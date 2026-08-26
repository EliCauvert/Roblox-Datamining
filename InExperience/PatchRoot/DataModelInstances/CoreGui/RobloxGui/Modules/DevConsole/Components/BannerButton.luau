local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local immutableModule = require(script.Parent.Parent.Immutable)
local constantsModule = require(script.Parent.Parent.Constants)
local lineWidth = constantsModule.GeneralFormatting.LineWidth
local lineColor = constantsModule.GeneralFormatting.LineColor
local arrowWidth = constantsModule.GeneralFormatting.ArrowWidth
local rightArrow = constantsModule.Image.RightArrow
local downArrow = constantsModule.Image.DownArrow
local bannerButton = roactModule.Component:extend("BannerButton")

function bannerButton.render(p1)
	-- upvalues: roactModule (ref), downArrow (ref), rightArrow (ref), arrowWidth (ref), lineWidth (ref), lineColor (ref), immutableModule (ref)
	local children = p1.props[roactModule.Children] or {}
	local size = p1.props.size
	local pos = p1.props.pos
	local isExpandable = p1.props.isExpandable
	local isExpanded = p1.props.isExpanded
	local layoutOrder = p1.props.layoutOrder
	local inset = p1.props.inset or 0
	local hideLines = p1.props.hideLines
	local onButtonPress = p1.props.onButtonPress
	local onMouseEnter = p1.props.onMouseEnter
	local onMouseLeave = p1.props.onMouseLeave
	local onMouseMove = p1.props.onMouseMove
	local onMouse2Click = p1.props.onMouse2Click
	local t = {
		BannerButtonArrow = onButtonPress and roactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			Visible = isExpandable,
			Image = if isExpanded then downArrow else rightArrow,
			Size = UDim2.new(0, arrowWidth, 0, arrowWidth),
			Position = UDim2.new(0, inset, 0.5, -arrowWidth / 2)
		})
	}
	
	if not hideLines then
		t.HorizontalLineTop = roactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, lineWidth),
			BackgroundColor3 = lineColor
		})
		t.HorizontalLineBottom = roactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, lineWidth),
			Position = UDim2.new(0, 0, 1, -lineWidth),
			BackgroundColor3 = lineColor
		})
	end
	return roactModule.createElement("ImageButton", {
		Size = size,
		Position = pos,
		BackgroundTransparency = 1,
		LayoutOrder = layoutOrder,
		[roactModule.Event.Activated] = onButtonPress,
		[roactModule.Event.MouseEnter] = onMouseEnter,
		[roactModule.Event.MouseLeave] = onMouseLeave,
		[roactModule.Event.MouseMoved] = onMouseMove,
		[roactModule.Event.MouseButton2Click] = onMouse2Click
	}, immutableModule.JoinDictionaries(t, children))
end

return bannerButton