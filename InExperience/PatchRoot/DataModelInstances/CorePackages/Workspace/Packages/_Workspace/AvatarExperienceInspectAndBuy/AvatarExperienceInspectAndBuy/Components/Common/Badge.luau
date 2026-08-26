local parent = script:FindFirstAncestor("AvatarExperienceInspectAndBuy").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local iconSize = foundationModule.Enums.IconSize

return function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), foundationModule (ref), iconSize (ref)
	local var1 = useTokens()
	
	return reactModule.createElement(foundationModule.View, {
		tag = "auto-xy row align-x-center align-y-center bg-surface-300 radius-circle padding-small gap-xsmall",
		BorderSizePixel = 0,
		Text = "",
		LayoutOrder = p1.LayoutOrder,
		onActivated = p1.onActivated
	}, {
		Icon = reactModule.createElement(foundationModule.Icon, {
			LayoutOrder = 1,
			name = p1.icon,
			variant = p1.iconVariant,
			size = iconSize.Medium,
			style = var1.Color.Content.Default
		}),
		Text = if p1.text then reactModule.createElement(foundationModule.Text, {
			tag = "text-caption-large content-emphasis text-align-x-left auto-xy text-truncate-none",
			LayoutOrder = 2,
			Text = p1.text,
			textStyle = var1.Color.Content.Default
		}) else nil
	})
end