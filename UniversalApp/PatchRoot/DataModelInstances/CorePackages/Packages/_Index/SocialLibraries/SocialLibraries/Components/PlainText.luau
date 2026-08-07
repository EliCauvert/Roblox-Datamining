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
	[roact.Change.AbsoluteSize] = function() --[[ line: 17 ]] end
}

function plainText.render(p0) --[[ line: 20 ]]
	-- upvalues: withStyle (ref), roact (ref), chatBubbleContainerModule (ref), fitTextLabel (ref)
	return withStyle(function(p1) --[[ line: 21 ]]
		-- upvalues: p0 (ref), roact (copy), chatBubbleContainerModule (copy), fitTextLabel (copy)
		local innerPadding = p0.props.innerPadding
		local body = p1.Font.Body
		
		return roact.createElement(chatBubbleContainerModule, {
			isIncoming = p0.props.isIncoming,
			hasTail = p0.props.hasTail,
			isPending = p0.props.isPending,
			padding = innerPadding,
			LayoutOrder = p0.props.LayoutOrder,
			[roact.Change.AbsoluteSize] = p0.props[roact.Change.AbsoluteSize]
		}, {
			textContent = roact.createElement(fitTextLabel, {
				BackgroundTransparency = 1,
				Text = p0.props.text,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextColor3 = p1.Theme.TextEmphasis.Color,
				width = fitTextLabel.Width.FitToText,
				maximumWidth = math.max(0, p0.props.maxWidth - innerPadding),
				Font = p0.props.font or body.Font,
				TextSize = p0.props.textSize or p1.Font.BaseSize * body.RelativeSize,
				TextTransparency = if p0.props.isPending then p1.Theme.TextMuted.Transparency else 0,
				TextYAlignment = Enum.TextYAlignment.Top
			})
		})
	end)
end

return plainText