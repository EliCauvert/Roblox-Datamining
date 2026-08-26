local parent = script:FindFirstAncestor("ProfilePlatform").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local text = foundationModule.Text
local useTokens = foundationModule.Hooks.useTokens

return function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), text (ref)
	local var1 = useTokens()
	
	return reactModule.createElement("Frame", {
		ClipsDescendants = false,
		BackgroundTransparency = 1,
		ZIndex = 3,
		LayoutOrder = p1.LayoutOrder,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		Position = p1.Position,
		AnchorPoint = p1.AnchorPoint
	}, {
		Text = reactModule.createElement(text, {
			Text = p1.text,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			textStyle = var1.Color.Content.Emphasis,
			fontStyle = var1.Typography.TitleMedium,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextTruncate = Enum.TextTruncate.SplitWord
		})
	})
end