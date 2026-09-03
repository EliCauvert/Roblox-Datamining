local parent = script:FindFirstAncestor("BuildExperience").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local iconButton = foundationModule.IconButton
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconName = foundationModule.Enums.IconName
local inputSize = foundationModule.Enums.InputSize

return function(p1)
	-- upvalues: reactModule (ref), iconButton (ref), iconName (ref), inputSize (ref), buttonVariant (ref)
	return reactModule.createElement(iconButton, {
		isCircular = true,
		testId = "build-header-stop-playtest-button",
		LayoutOrder = p1.layoutOrder,
		icon = iconName.StopSmall,
		isDisabled = p1.isDisabled,
		onActivated = p1.onActivated,
		size = inputSize.Medium,
		variant = buttonVariant.Utility
	})
end