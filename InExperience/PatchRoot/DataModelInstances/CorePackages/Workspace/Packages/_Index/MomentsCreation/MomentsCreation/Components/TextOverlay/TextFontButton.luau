local parent = script:FindFirstAncestor("MomentsCreation").Parent
local builderIconsModule = require(parent.BuilderIcons)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local iconButton = foundationModule.IconButton
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens

return function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), view (ref), iconButton (ref), builderIconsModule (ref), foundationModule (ref)
	return reactModule.createElement(view, {
		tag = "auto-xy radius-circle",
		LayoutOrder = p1.LayoutOrder
	}, {
		Icon = reactModule.createElement(iconButton, {
			isCircular = true,
			icon = builderIconsModule.Icon.TextUppercaseALowercaseA,
			onActivated = p1.onToggle,
			size = foundationModule.Enums.InputSize.Medium
		}),
		Highlight = if p1.expanded then reactModule.createElement(view, {
			ZIndex = 2,
			tag = "size-full radius-circle",
			backgroundStyle = useTokens().Color.State.Hover
		}) else nil
	})
end