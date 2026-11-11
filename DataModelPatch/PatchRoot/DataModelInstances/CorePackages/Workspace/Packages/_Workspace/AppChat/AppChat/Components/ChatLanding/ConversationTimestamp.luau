local RoactModule = require(script:FindFirstAncestor("AppChat").Parent.Roact)
local ConversationTimestamp = RoactModule.PureComponent:extend("ConversationTimestamp")
ConversationTimestamp.defaultProps = {
	text = "TEST",
	textSize = 24,
	textWidth = 32,
	paddingX = 0,
	paddingY = 0,
	currentStyle = nil
}

function ConversationTimestamp.render(p1)
	-- upvalues: RoactModule (copy)
	local TextSize = p1.props.textSize
	local CurrentStyle = p1.props.currentStyle
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 1,
		Size = UDim2.new(1, 0, 1, 0)
	}, {
		layout = RoactModule.createElement("UIListLayout", {
			HorizontalAlignment = Enum.HorizontalAlignment.Right,
			VerticalAlignment = Enum.VerticalAlignment.Top
		}),
		padding = RoactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, p1.props.paddingY),
			PaddingRight = UDim.new(0, p1.props.paddingX)
		}),
		timestamp = RoactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextXAlignment = Enum.TextXAlignment.Right,
			TextYAlignment = Enum.TextYAlignment.Top,
			Size = UDim2.new(0, p1.props.textWidth, 0, TextSize),
			Text = p1.props.text,
			TextSize = TextSize,
			Font = CurrentStyle.Font.Body.Font,
			TextColor3 = CurrentStyle.Theme.TextDefault.Color,
			TextTransparency = CurrentStyle.Theme.TextDefault.Transparency
		})
	})
end

return ConversationTimestamp