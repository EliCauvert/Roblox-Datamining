local dependenciesModule = require(script:FindFirstAncestor("SocialLibraries").dependencies)
local chatBubbleContainerModule = require(script.Parent.ChatBubbleContainer)
local roact = dependenciesModule.Roact
local withStyle = dependenciesModule.UIBlox.Style.withStyle
local fitTextLabel = dependenciesModule.RoactFitComponents.FitTextLabel
local plainText = roact.PureComponent:extend("PlainText")
plainText.defaultProps = {
	text = "",
	maxWidth = 0,
	innerPadding = 0,
	isIncoming = false,
	hasTail = false,
	LayoutOrder = 0,
	isPending = false,
	[roact.Change.AbsoluteSize] = function() end
}

function plainText.render(p1)
	-- upvalues: withStyle (ref), roact (ref), chatBubbleContainerModule (ref), fitTextLabel (ref)
	return withStyle(function(p2)
		-- upvalues: p1 (ref), roact (copy), chatBubbleContainerModule (copy), fitTextLabel (copy)
		local innerPadding = p1.props.innerPadding
		local body = p2.Font.Body
		
		return roact.createElement(chatBubbleContainerModule, {
			isIncoming = p1.props.isIncoming,
			hasTail = p1.props.hasTail,
			isPending = p1.props.isPending,
			padding = innerPadding,
			LayoutOrder = p1.props.LayoutOrder,
			[roact.Change.AbsoluteSize] = p1.props[roact.Change.AbsoluteSize]
		}, {
			textContent = roact.createElement(fitTextLabel, {
				BackgroundTransparency = 1,
				Text = p1.props.text,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextColor3 = p2.Theme.TextEmphasis.Color,
				width = fitTextLabel.Width.FitToText,
				maximumWidth = math.max(0, p1.props.maxWidth - innerPadding),
				Font = p1.props.font or body.Font,
				TextSize = p1.props.textSize or p2.Font.BaseSize * body.RelativeSize,
				TextTransparency = if p1.props.isPending then p2.Theme.TextMuted.Transparency else 0,
				TextYAlignment = Enum.TextYAlignment.Top
			})
		})
	end)
end

return plainText