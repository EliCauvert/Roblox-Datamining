local DependenciesModule = require(script:FindFirstAncestor("SocialLibraries").dependencies)
local ChatBubbleContainerAutomaticSizeModule = require(script.Parent.ChatBubbleContainerAutomaticSize)
local Roact = DependenciesModule.Roact
local WithStyleFunction = DependenciesModule.UIBlox.Style.withStyle
local TextService = game:GetService("TextService")
game:DefineFastFlag("FixPlainTextAutomaticSizeClippingText", false)
local FixPlainTextAutomaticSizeClippingTextFastFlag = game:GetFastFlag("FixPlainTextAutomaticSizeClippingText")
local Frame = {
	text = "",
	maxWidth = 0,
	innerPadding = 0,
	isIncoming = false,
	hasTail = false,
	LayoutOrder = 0,
	isPending = false,
	[Roact.Change.AbsoluteSize] = function() end
}

return function(Frame1: Frame)
	-- upvalues: WithStyleFunction (copy), Frame (copy), TextService (copy), Roact (copy), ChatBubbleContainerAutomaticSizeModule (copy), FixPlainTextAutomaticSizeClippingTextFastFlag (copy)
	return WithStyleFunction(function(p1)
		-- upvalues: Frame1 (copy), Frame (upval), TextService (upval), Roact (upval), ChatBubbleContainerAutomaticSizeModule (upval), FixPlainTextAutomaticSizeClippingTextFastFlag (upval)
		local MaxWidth = Frame1.maxWidth or Frame.maxWidth
		local InnerPadding = Frame1.innerPadding or Frame.innerPadding
		local Largest = math.max(0, MaxWidth - InnerPadding)
		local Body = p1.Font.Body
		local TextSize = Frame1.textSize or p1.Font.BaseSize * Body.RelativeSize
		local Text = Frame1.text or Frame.text
		local _Font = Frame1.font or Body.Font
		local TextSize1 = TextService:GetTextSize(Text, TextSize, _Font, (Vector2.new(Largest, 1e999)))
		
		return Roact.createElement(ChatBubbleContainerAutomaticSizeModule, {
			isIncoming = Frame1.isIncoming or Frame.isIncoming,
			hasTail = Frame1.hasTail or Frame.hasTail,
			isPending = Frame1.isPending or Frame.isPending,
			padding = InnerPadding,
			LayoutOrder = Frame1.LayoutOrder or Frame.LayoutOrder,
			[Roact.Change.AbsoluteSize] = Frame1[Roact.Change.AbsoluteSize] or Frame[Roact.Change.AbsoluteSize]
		}, {
			textContent = Roact.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextWrapped = true,
				Text = Text,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextColor3 = p1.Theme.TextEmphasis.Color,
				AutomaticSize = Enum.AutomaticSize.XY,
				Font = _Font,
				TextSize = TextSize,
				Size = FixPlainTextAutomaticSizeClippingTextFastFlag and UDim2.fromOffset(math.ceil(TextSize1.X), (math.ceil(TextSize1.Y))) or UDim2.new(0, TextSize1.X, 0, TextSize1.Y),
				TextTransparency = Frame1.isPending and p1.Theme.TextMuted.Transparency or 0,
				TextYAlignment = Enum.TextYAlignment.Top
			}, {
				SizeConstraint = Roact.createElement("UISizeConstraint", { MaxSize = Vector2.new(Largest or MaxWidth, 1e999) })
			})
		})
	end)
end