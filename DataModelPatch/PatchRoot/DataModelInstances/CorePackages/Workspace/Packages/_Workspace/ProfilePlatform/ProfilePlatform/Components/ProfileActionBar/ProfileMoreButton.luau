local Parent = script:FindFirstAncestor("ProfilePlatform").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local IconButton = FoundationModule.IconButton
local IconSize = FoundationModule.Enums.IconSize
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local IconName = FoundationModule.Enums.IconName

return function(p1)
	-- upvalues: ReactModule (copy), IconButton (copy), IconName (copy), IconSize (copy), ButtonVariant (copy)
	return ReactModule.createElement(IconButton, {
		LayoutOrder = p1.layoutOrder,
		icon = IconName.ThreeDotsHorizontal,
		isDisabled = p1.isDisabled,
		onActivated = p1.onActivated,
		size = IconSize.Medium,
		ref = p1.buttonRef,
		variant = ButtonVariant.Standard
	})
end