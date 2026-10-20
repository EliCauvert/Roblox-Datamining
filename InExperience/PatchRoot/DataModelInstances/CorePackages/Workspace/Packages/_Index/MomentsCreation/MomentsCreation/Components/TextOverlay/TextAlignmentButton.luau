local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local IconButton = FoundationModule.IconButton
local UseTextAlignmentButtonStateModule = require(MomentsCreation.Components.TextOverlay.useTextAlignmentButtonState)
local _ = require(MomentsCreation.Types.CreationFlowTypes)

return function(Frame)
	-- upvalues: UseTextAlignmentButtonStateModule (copy), ReactModule (copy), IconButton (copy), FoundationModule (copy)
	local UseTextAlignmentButtonStateModuleResult = UseTextAlignmentButtonStateModule(Frame.controller)
	
	return ReactModule.createElement(IconButton, {
		LayoutOrder = Frame.LayoutOrder,
		icon = UseTextAlignmentButtonStateModuleResult.icon,
		onActivated = UseTextAlignmentButtonStateModuleResult.onActivated,
		size = FoundationModule.Enums.InputSize.Medium
	})
end