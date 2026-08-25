local parent = script:FindFirstAncestor("ProfilePlatform").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local iconButton = foundationModule.IconButton
local iconSize = foundationModule.Enums.IconSize
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconName = foundationModule.Enums.IconName

return function(p0)
	-- upvalues: reactModule (ref), iconButton (ref), iconName (ref), iconSize (ref), buttonVariant (ref)
	return reactModule.createElement(iconButton, {
		LayoutOrder = p0.layoutOrder,
		icon = iconName.ThreeDotsHorizontal,
		isDisabled = p0.isDisabled,
		onActivated = p0.onActivated,
		size = iconSize.Medium,
		ref = p0.buttonRef,
		variant = buttonVariant.Standard
	})
end