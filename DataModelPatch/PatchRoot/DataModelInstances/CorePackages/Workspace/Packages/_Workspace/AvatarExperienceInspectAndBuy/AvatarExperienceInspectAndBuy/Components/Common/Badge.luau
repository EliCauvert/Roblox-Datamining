local Parent = script:FindFirstAncestor("AvatarExperienceInspectAndBuy").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local IconSize = FoundationModule.Enums.IconSize

return function(Frame)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), FoundationModule (copy), IconSize (copy)
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "auto-xy row align-x-center align-y-center bg-surface-300 radius-circle padding-small gap-xsmall",
		BorderSizePixel = 0,
		Text = "",
		LayoutOrder = Frame.LayoutOrder,
		onActivated = Frame.onActivated
	}, {
		Icon = ReactModule.createElement(FoundationModule.Icon, {
			LayoutOrder = 1,
			name = Frame.icon,
			variant = Frame.iconVariant,
			size = IconSize.Medium,
			style = UseTokensResult.Color.Content.Default
		}),
		Text = if Frame.text then ReactModule.createElement(FoundationModule.Text, {
			tag = "text-caption-large content-emphasis text-align-x-left auto-xy text-truncate-none",
			LayoutOrder = 2,
			Text = Frame.text,
			textStyle = UseTokensResult.Color.Content.Default
		}) else nil
	})
end