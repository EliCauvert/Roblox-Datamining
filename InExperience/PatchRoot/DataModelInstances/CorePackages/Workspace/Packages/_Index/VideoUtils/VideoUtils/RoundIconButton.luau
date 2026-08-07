local parent = script:FindFirstAncestor("VideoUtils").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local icon = foundationModule.Icon
local iconSize = foundationModule.Enums.IconSize
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens

return function(value) --[[ line: 21 | named "RoundIconButton" ]]
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), icon (ref), iconSize (ref)
	return reactModule.createElement(view, {
		tag = "auto-xy bg-over-media-100 radius-circle padding-medium",
		AnchorPoint = value.AnchorPoint,
		Position = value.Position,
		ZIndex = value.ZIndex,
		onActivated = value.onActivated,
		selection = if value.Selectable ~= nil then nil else { Selectable = value.Selectable }
	}, {
		Icon = reactModule.createElement(icon, {
			name = value.icon,
			size = iconSize.Medium,
			style = useTokens().Color.Content.Emphasis
		})
	})
end