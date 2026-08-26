local parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local text = foundationModule.Text
local useTokens = foundationModule.Hooks.useTokens

return function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), text (ref)
	local var1 = useTokens()
	
	return reactModule.createElement(text, {
		textStyle = var1.Inverse.Content.Emphasis,
		fontStyle = var1.Typography.LabelSmall,
		LayoutOrder = p1.LayoutOrder,
		Text = p1.text,
		TextXAlignment = Enum.TextXAlignment.Left,
		Size = UDim2.fromScale(0, 0),
		AutomaticSize = Enum.AutomaticSize.XY,
		backgroundStyle = var1.Color.System.Contrast,
		padding = var1.Padding.Small,
		cornerRadius = UDim.new(0.5, 0)
	})
end