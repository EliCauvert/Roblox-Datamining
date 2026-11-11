local Parent = script:FindFirstAncestor("VideoUtils").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Icon = FoundationModule.Icon
local IconSize = FoundationModule.Enums.IconSize
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens

return function(Frame)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy), Icon (copy), IconSize (copy)
	return ReactModule.createElement(View, {
		tag = "auto-xy bg-over-media-100 radius-circle padding-medium",
		AnchorPoint = Frame.AnchorPoint,
		Position = Frame.Position,
		ZIndex = Frame.ZIndex,
		onActivated = Frame.onActivated,
		selection = if Frame.Selectable == nil then nil else { Selectable = Frame.Selectable }
	}, {
		Icon = ReactModule.createElement(Icon, {
			name = Frame.icon,
			size = IconSize.Medium,
			style = UseTokensFunction().Color.Content.Emphasis
		})
	})
end