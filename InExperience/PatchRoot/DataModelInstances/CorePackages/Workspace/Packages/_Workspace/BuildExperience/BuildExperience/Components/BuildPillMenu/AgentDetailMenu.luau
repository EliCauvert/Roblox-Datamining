local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local IconButton = FoundationModule.IconButton
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local IconName = FoundationModule.Enums.IconName
local InputSize = FoundationModule.Enums.InputSize

return function(p1)
	-- upvalues: ReactModule (copy), IconButton (copy), IconName (copy), InputSize (copy), ButtonVariant (copy)
	return ReactModule.createElement(IconButton, {
		isCircular = true,
		testId = "build-header-agent-detail-menu",
		LayoutOrder = p1.layoutOrder,
		icon = p1.icon or IconName.RectangleList,
		isDisabled = p1.isDisabled,
		onActivated = p1.onActivated,
		size = InputSize.Medium,
		variant = ButtonVariant.Utility
	})
end