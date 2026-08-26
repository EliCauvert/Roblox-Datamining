local buildExperience = script:FindFirstAncestor("BuildExperience")
local reactModule = require(buildExperience.Parent.React)
local privateInvitesPickerContainerModule = require(buildExperience.Components.PrivateInvitesPicker.PrivateInvitesPickerContainer)

return function(p1)
	-- upvalues: reactModule (ref), privateInvitesPickerContainerModule (ref)
	return reactModule.createElement(privateInvitesPickerContainerModule, {
		universeId = p1.universeId,
		onClose = p1.onClose,
		onInvitesSent = p1.onInvitesSent,
		testId = p1.testId
	})
end