local parent = script:FindFirstAncestor("Gifting").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local iconButton = foundationModule.IconButton
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconName = foundationModule.Enums.IconName
local inputSize = foundationModule.Enums.InputSize

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), iconButton (ref), iconName (ref), inputSize (ref), buttonVariant (ref)
	return reactModule.createElement(iconButton, {
		testId = "gift-icon-button",
		icon = iconName.GiftBox,
		onActivated = p1.onActivated,
		isCircular = p1.isCircular == true,
		isDisabled = p1.isDisabled,
		LayoutOrder = p1.LayoutOrder,
		size = inputSize.Medium,
		variant = buttonVariant.Standard
	})
end)