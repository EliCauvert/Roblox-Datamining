local Songbird = script:FindFirstAncestor("Songbird")
local ReactModule = require(Songbird.Parent.React)
local FoundationModule = require(Songbird.Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens

return function(Frame)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), FoundationModule (copy)
	return ReactModule.createElement(FoundationModule.View, {
		tag = "auto-xy bg-action-emphasis radius-circle padding-small",
		aspectRatio = 1,
		onActivated = Frame.onActivated,
		LayoutOrder = Frame.LayoutOrder
	}, {
		Icon = ReactModule.createElement(FoundationModule.Icon, {
			Position = Frame.iconOffset,
			name = Frame.icon,
			size = FoundationModule.Enums.IconSize.Medium,
			style = UseTokensFunction().Color.ActionEmphasis.Foreground
		})
	})
end