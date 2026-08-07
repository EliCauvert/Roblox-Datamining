local roactModule = require(script:FindFirstAncestor("AppChat").Parent.Roact)
local conversationTimestamp = roactModule.PureComponent:extend("ConversationTimestamp")
conversationTimestamp.defaultProps = {
	text = "TEST",
	textSize = 24,
	textWidth = 32,
	paddingX = 0,
	paddingY = 0,
	currentStyle = nil
}

function conversationTimestamp.render(p0) --[[ line: 16 ]]
	-- upvalues: roactModule (ref)
	local textSize = p0.props.textSize
	local currentStyle = p0.props.currentStyle
	
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 1,
		Size = UDim2.new(1, 0, 1, 0)
	}, {
		layout = roactModule.createElement("UIListLayout", {
			HorizontalAlignment = Enum.HorizontalAlignment.Right,
			VerticalAlignment = Enum.VerticalAlignment.Top
		}),
		padding = roactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, p0.props.paddingY),
			PaddingRight = UDim.new(0, p0.props.paddingX)
		}),
		timestamp = roactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextXAlignment = Enum.TextXAlignment.Right,
			TextYAlignment = Enum.TextYAlignment.Top,
			Size = UDim2.new(0, p0.props.textWidth, 0, textSize),
			Text = p0.props.text,
			TextSize = textSize,
			Font = currentStyle.Font.Body.Font,
			TextColor3 = currentStyle.Theme.TextDefault.Color,
			TextTransparency = currentStyle.Theme.TextDefault.Transparency
		})
	})
end

return conversationTimestamp