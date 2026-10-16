local Parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Text = FoundationModule.Text
local UseTokensFunction = FoundationModule.Hooks.useTokens

return function(Frame) --[[ Line: 13 | Named "ItemCardStatus" ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), Text (copy)
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement(Text, {
		textStyle = UseTokensResult.Inverse.Content.Emphasis,
		fontStyle = UseTokensResult.Typography.LabelSmall,
		LayoutOrder = Frame.LayoutOrder,
		Text = Frame.text,
		TextXAlignment = Enum.TextXAlignment.Left,
		Size = UDim2.fromScale(0, 0),
		AutomaticSize = Enum.AutomaticSize.XY,
		backgroundStyle = UseTokensResult.Color.System.Contrast,
		padding = UseTokensResult.Padding.Small,
		cornerRadius = UDim.new(0.5, 0)
	})
end