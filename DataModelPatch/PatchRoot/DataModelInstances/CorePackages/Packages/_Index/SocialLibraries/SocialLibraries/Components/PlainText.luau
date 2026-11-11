local DependenciesModule = require(script:FindFirstAncestor("SocialLibraries").dependencies)
local ChatBubbleContainerModule = require(script.Parent.ChatBubbleContainer)
local Roact = DependenciesModule.Roact
local WithStyleFunction = DependenciesModule.UIBlox.Style.withStyle
local FitTextLabel = DependenciesModule.RoactFitComponents.FitTextLabel
local PlainText = Roact.PureComponent:extend("PlainText")
PlainText.defaultProps = {
	text = "",
	maxWidth = 0,
	innerPadding = 0,
	isIncoming = false,
	hasTail = false,
	LayoutOrder = 0,
	isPending = false,
	[Roact.Change.AbsoluteSize] = function() end
}

function PlainText.render(p1)
	-- upvalues: WithStyleFunction (copy), Roact (copy), ChatBubbleContainerModule (copy), FitTextLabel (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: p1 (copy), Roact (upval), ChatBubbleContainerModule (upval), FitTextLabel (upval)
		local InnerPadding = p1.props.innerPadding
		local Body = p2.Font.Body
		local ScaledBaseSize = p2.Font.BaseSize * Body.RelativeSize
		
		return Roact.createElement(ChatBubbleContainerModule, {
			isIncoming = p1.props.isIncoming,
			hasTail = p1.props.hasTail,
			isPending = p1.props.isPending,
			padding = InnerPadding,
			LayoutOrder = p1.props.LayoutOrder,
			[Roact.Change.AbsoluteSize] = p1.props[Roact.Change.AbsoluteSize]
		}, {
			textContent = Roact.createElement(FitTextLabel, {
				BackgroundTransparency = 1,
				Text = p1.props.text,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextColor3 = p2.Theme.TextEmphasis.Color,
				width = FitTextLabel.Width.FitToText,
				maximumWidth = math.max(0, p1.props.maxWidth - InnerPadding),
				Font = p1.props.font or Body.Font,
				TextSize = p1.props.textSize or ScaledBaseSize,
				TextTransparency = p1.props.isPending and p2.Theme.TextMuted.Transparency or 0,
				TextYAlignment = Enum.TextYAlignment.Top
			})
		})
	end)
end

return PlainText