local TextService = game:GetService("TextService")
local RoactModule = require(script:FindFirstAncestor("AppChat").Parent.Roact)
local NoticeText = RoactModule.PureComponent:extend("NoticeText")
NoticeText.defaultProps = {
	AnchorPoint = Vector2.new(0, 0),
	Font = Enum.Font.Gotham,
	HorizontalAlignment = Enum.HorizontalAlignment.Left,
	LayoutOrder = 1,
	Position = UDim2.new(0, 0, 0, 0),
	Text = "PLACEHOLDER Not everyone in this chat can see your message.",
	TextColor3 = nil,
	TextSize = 17,
	TextTransparency = nil,
	TextWrapped = true,
	TextXAlignment = Enum.TextXAlignment.Left,
	TextYAlignment = Enum.TextYAlignment.Top,
	[RoactModule.Change.AbsoluteSize] = function() --[[ Line: 22 ]] end,
	margin = { top = 0, left = 0, right = 0, bottom = 0 },
	maxWidth = 0,
	width = UDim.new(1, 0)
}

function NoticeText.render(p1) --[[ Line: 34 ]]
	-- upvalues: TextService (copy), RoactModule (copy)
	local Largest = math.max(0, p1.props.maxWidth - (p1.props.margin.left + p1.props.margin.right))
	local TextSize = TextService:GetTextSize(p1.props.Text, p1.props.TextSize, p1.props.Font, (Vector2.new(Largest, 1e999)))
	
	return RoactModule.createElement("Frame", {
		AnchorPoint = p1.props.AnchorPoint,
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = p1.props.LayoutOrder,
		Position = p1.props.Position,
		[RoactModule.Change.AbsoluteSize] = p1.props[RoactModule.Change.AbsoluteSize],
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.new(p1.props.width, UDim.new(0, 0))
	}, {
		Layout = RoactModule.createElement("UIListLayout", { HorizontalAlignment = p1.props.HorizontalAlignment }),
		Padding = RoactModule.createElement("UIPadding", {
			PaddingBottom = UDim.new(0, p1.props.margin.bottom),
			PaddingRight = UDim.new(0, p1.props.margin.right),
			PaddingLeft = UDim.new(0, p1.props.margin.left),
			PaddingTop = UDim.new(0, p1.props.margin.top)
		}),
		NoticeText = RoactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AutomaticSize = Enum.AutomaticSize.XY,
			Font = p1.props.Font,
			Text = p1.props.Text,
			TextColor3 = p1.props.TextColor3,
			TextSize = p1.props.TextSize,
			TextTransparency = p1.props.TextTransparency,
			TextWrapped = p1.props.TextWrapped,
			TextXAlignment = p1.props.TextXAlignment,
			TextYAlignment = p1.props.TextYAlignment,
			Size = UDim2.fromOffset(math.ceil(TextSize.X), (math.ceil(TextSize.Y)))
		}, {
			SizeConstraint = RoactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(Largest, 1e999) })
		})
	})
end

return NoticeText