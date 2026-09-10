local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local iconButton = foundationModule.IconButton
local useTextAlignmentButtonStateModule = require(momentsCreation.Components.TextOverlay.useTextAlignmentButtonState)
local _ = require(momentsCreation.Types.CreationFlowTypes)

return function(p1)
	-- upvalues: useTextAlignmentButtonStateModule (ref), reactModule (ref), iconButton (ref), foundationModule (ref)
	local var1 = useTextAlignmentButtonStateModule(p1.controller)
	
	return reactModule.createElement(iconButton, {
		icon = var1.icon,
		onActivated = var1.onActivated,
		size = foundationModule.Enums.InputSize.Medium
	})
end