local dependenciesModule = require(script:FindFirstAncestor("SocialLibraries").dependencies)
local chatBubbleContainerAutomaticSizeModule = require(script.Parent.ChatBubbleContainerAutomaticSize)
local roact = dependenciesModule.Roact
local withStyle = dependenciesModule.UIBlox.Style.withStyle
local textService = game:GetService("TextService")
game:DefineFastFlag("FixPlainTextAutomaticSizeClippingText", false)
local fixPlainTextAutomaticSizeClippingTextFastFlag = game:GetFastFlag("FixPlainTextAutomaticSizeClippingText")
local t = {
	text = "",
	maxWidth = 0,
	innerPadding = 0,
	isIncoming = false,
	hasTail = false,
	LayoutOrder = 0,
	isPending = false,
	[roact.Change.AbsoluteSize] = function() end
}

return function(p1)
	-- upvalues: withStyle (ref), t (ref), textService (ref), roact (ref), chatBubbleContainerAutomaticSizeModule (ref), fixPlainTextAutomaticSizeClippingTextFastFlag (ref)
	return withStyle(function(p2)
		-- upvalues: p1 (ref), t (copy), textService (copy), roact (copy), chatBubbleContainerAutomaticSizeModule (copy), fixPlainTextAutomaticSizeClippingTextFastFlag (copy)
		local maxWidth = p1.maxWidth or t.maxWidth
		local innerPadding = p1.innerPadding or t.innerPadding
		local maxValue = math.max(0, maxWidth - innerPadding)
		local body = p2.Font.Body
		local textSize = p1.textSize or p2.Font.BaseSize * body.RelativeSize
		local text = p1.text or t.text
		local font = p1.font or body.Font
		local var1 = textService:GetTextSize(text, textSize, font, Vector2.new(maxValue, 1e999))
		
		return roact.createElement(chatBubbleContainerAutomaticSizeModule, {
			isIncoming = p1.isIncoming or t.isIncoming,
			hasTail = p1.hasTail or t.hasTail,
			isPending = p1.isPending or t.isPending,
			padding = innerPadding,
			LayoutOrder = p1.LayoutOrder or t.LayoutOrder,
			[roact.Change.AbsoluteSize] = p1[roact.Change.AbsoluteSize] or t[roact.Change.AbsoluteSize]
		}, {
			textContent = roact.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextWrapped = true,
				Text = text,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextColor3 = p2.Theme.TextEmphasis.Color,
				AutomaticSize = Enum.AutomaticSize.XY,
				Font = font,
				TextSize = textSize,
				Size = fixPlainTextAutomaticSizeClippingTextFastFlag and UDim2.fromOffset(math.ceil(var1.X), math.ceil(var1.Y)) or UDim2.new(0, var1.X, 0, var1.Y),
				TextTransparency = if p1.isPending then p2.Theme.TextMuted.Transparency else 0,
				TextYAlignment = Enum.TextYAlignment.Top
			}, {
				SizeConstraint = roact.createElement("UISizeConstraint", { MaxSize = Vector2.new(maxValue or maxWidth, 1e999) })
			})
		})
	end)
end