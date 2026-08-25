local parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local text = foundationModule.Text
local useTokens = foundationModule.Hooks.useTokens

return function(p0)
	-- upvalues: useTokens (ref), reactModule (ref), text (ref)
	local var2 = useTokens()
	
	return reactModule.createElement(text, {
		textStyle = var2.Inverse.Content.Emphasis,
		fontStyle = var2.Typography.LabelSmall,
		LayoutOrder = p0.LayoutOrder,
		Text = p0.text,
		TextXAlignment = Enum.TextXAlignment.Left,
		Size = UDim2.fromScale(0, 0),
		AutomaticSize = Enum.AutomaticSize.XY,
		backgroundStyle = var2.Color.System.Contrast,
		padding = var2.Padding.Small,
		cornerRadius = UDim.new(0.5, 0)
	})
end