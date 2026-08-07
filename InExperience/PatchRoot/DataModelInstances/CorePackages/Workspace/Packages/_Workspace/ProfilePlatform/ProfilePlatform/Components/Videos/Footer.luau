local parent = script:FindFirstAncestor("ProfilePlatform").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local text = foundationModule.Text
local useTokens = foundationModule.Hooks.useTokens

return function(p0) --[[ line: 16 | named "Footer" ]]
	-- upvalues: useTokens (ref), reactModule (ref), text (ref)
	local var2 = useTokens()
	
	return reactModule.createElement("Frame", {
		ClipsDescendants = false,
		BackgroundTransparency = 1,
		ZIndex = 3,
		LayoutOrder = p0.LayoutOrder,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		Position = p0.Position,
		AnchorPoint = p0.AnchorPoint
	}, {
		Text = reactModule.createElement(text, {
			Text = p0.text,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			textStyle = var2.Color.Content.Emphasis,
			fontStyle = var2.Typography.TitleMedium,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextTruncate = Enum.TextTruncate.SplitWord
		})
	})
end