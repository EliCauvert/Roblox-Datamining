local Parent = script:FindFirstAncestor("MomentsCreation").Parent
local BuilderIconsModule = require(Parent.BuilderIcons)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local IconButton = FoundationModule.IconButton
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens

return function(Frame)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy), IconButton (copy), BuilderIconsModule (copy), FoundationModule (copy)
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement(View, {
		tag = "auto-xy radius-circle",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Icon = ReactModule.createElement(IconButton, {
			isCircular = true,
			icon = BuilderIconsModule.Icon.TextUppercaseALowercaseA,
			onActivated = Frame.onToggle,
			size = FoundationModule.Enums.InputSize.Medium
		}),
		Highlight = if Frame.expanded then ReactModule.createElement(View, {
			ZIndex = 2,
			tag = "size-full radius-circle",
			backgroundStyle = UseTokensResult.Color.State.Hover
		}) else nil
	})
end