local parent = script:FindFirstAncestor("ProfilePlatform").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local iconButton = foundationModule.IconButton
local iconSize = foundationModule.Enums.IconSize
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconName = foundationModule.Enums.IconName

return function(p1)
	-- upvalues: reactModule (ref), iconButton (ref), iconName (ref), iconSize (ref), buttonVariant (ref)
	return reactModule.createElement(iconButton, {
		LayoutOrder = p1.layoutOrder,
		icon = iconName.ThreeDotsHorizontal,
		isDisabled = p1.isDisabled,
		onActivated = p1.onActivated,
		size = iconSize.Medium,
		ref = p1.buttonRef,
		variant = buttonVariant.Standard
	})
end