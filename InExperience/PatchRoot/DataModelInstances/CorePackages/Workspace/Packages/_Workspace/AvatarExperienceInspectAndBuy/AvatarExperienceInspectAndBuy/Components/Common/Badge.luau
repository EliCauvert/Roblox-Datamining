local parent = script:FindFirstAncestor("AvatarExperienceInspectAndBuy").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local iconSize = foundationModule.Enums.IconSize

return function(p0) --[[ line: 32 | named "Badge" ]]
	-- upvalues: useTokens (ref), reactModule (ref), foundationModule (ref), iconSize (ref)
	local var2 = useTokens()
	
	return reactModule.createElement(foundationModule.View, {
		tag = "auto-xy row align-x-center align-y-center bg-surface-300 radius-circle padding-small gap-xsmall",
		BorderSizePixel = 0,
		Text = "",
		LayoutOrder = p0.LayoutOrder,
		onActivated = p0.onActivated
	}, {
		Icon = reactModule.createElement(foundationModule.Icon, {
			LayoutOrder = 1,
			name = p0.icon,
			variant = p0.iconVariant,
			size = iconSize.Medium,
			style = var2.Color.Content.Default
		}),
		Text = if p0.text then reactModule.createElement(foundationModule.Text, {
			tag = "text-caption-large content-emphasis text-align-x-left auto-xy text-truncate-none",
			LayoutOrder = 2,
			Text = p0.text,
			textStyle = var2.Color.Content.Default
		}) else nil
	})
end