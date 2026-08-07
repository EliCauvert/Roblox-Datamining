local parent = script:FindFirstAncestor("BuildExperience").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local iconButton = foundationModule.IconButton
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconName = foundationModule.Enums.IconName
local inputSize = foundationModule.Enums.InputSize

return function(p0) --[[ line: 19 | named "AgentDetailMenu" ]]
	-- upvalues: reactModule (ref), iconButton (ref), iconName (ref), inputSize (ref), buttonVariant (ref)
	return reactModule.createElement(iconButton, {
		isCircular = true,
		testId = "build-header-agent-detail-menu",
		LayoutOrder = p0.layoutOrder,
		icon = iconName.RectangleList,
		isDisabled = p0.isDisabled,
		onActivated = p0.onActivated,
		size = inputSize.Medium,
		variant = buttonVariant.Utility
	})
end