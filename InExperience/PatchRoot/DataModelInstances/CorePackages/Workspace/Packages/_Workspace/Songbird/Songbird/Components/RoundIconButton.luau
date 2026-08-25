local songbird = script:FindFirstAncestor("Songbird")
local reactModule = require(songbird.Parent.React)
local foundationModule = require(songbird.Parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens

return function(value)
	-- upvalues: useTokens (ref), reactModule (ref), foundationModule (ref)
	return reactModule.createElement(foundationModule.View, {
		tag = "auto-xy bg-action-emphasis radius-circle padding-small",
		aspectRatio = 1,
		onActivated = value.onActivated,
		LayoutOrder = value.LayoutOrder
	}, {
		Icon = reactModule.createElement(foundationModule.Icon, {
			Position = value.iconOffset,
			name = value.icon,
			size = foundationModule.Enums.IconSize.Medium,
			style = useTokens().Color.ActionEmphasis.Foreground
		})
	})
end