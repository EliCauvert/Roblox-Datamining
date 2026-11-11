local Parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local Text = FoundationModule.Text
local View = FoundationModule.View
local BackgroundStyle = { Transparency = 1 }
local BackgroundStyle1 = { Transparency = 1 }

return ReactModule.forwardRef(function(Frame, Ref)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy), BackgroundStyle (copy), Text (copy), BackgroundStyle1 (copy)
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement(View, {
		ref = Ref,
		onActivated = Frame.onActivated,
		backgroundStyle = BackgroundStyle,
		padding = Frame.padding or Vector2.new(UseTokensResult.Padding.Small, UseTokensResult.Padding.Medium),
		Size = UDim2.fromScale(0, 0),
		AutomaticSize = Enum.AutomaticSize.XY,
		LayoutOrder = Frame.LayoutOrder
	}, {
		Text = ReactModule.createElement(Text, {
			Text = Frame.text,
			textStyle = if Frame.isActive then Frame.activeTextStyle or UseTokensResult.Color.Content.Emphasis else Frame.textStyle or UseTokensResult.Color.Content.Muted,
			fontStyle = Frame.fontStyle or UseTokensResult.Typography.TitleLarge,
			Size = UDim2.fromScale(0, 0),
			AutomaticSize = Enum.AutomaticSize.XY,
			backgroundStyle = BackgroundStyle1
		})
	})
end)