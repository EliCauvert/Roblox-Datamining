local Parent = script:FindFirstAncestor("ProfilePlatform").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Text = FoundationModule.Text
local UseTokensFunction = FoundationModule.Hooks.useTokens

return function(Frame: Frame)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), Text (copy)
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement("Frame", {
		ClipsDescendants = false,
		BackgroundTransparency = 1,
		ZIndex = 3,
		LayoutOrder = Frame.LayoutOrder,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		Position = Frame.Position,
		AnchorPoint = Frame.AnchorPoint
	}, {
		Text = ReactModule.createElement(Text, {
			Text = Frame.text,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			textStyle = UseTokensResult.Color.Content.Emphasis,
			fontStyle = UseTokensResult.Typography.TitleMedium,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextTruncate = Enum.TextTruncate.SplitWord
		})
	})
end