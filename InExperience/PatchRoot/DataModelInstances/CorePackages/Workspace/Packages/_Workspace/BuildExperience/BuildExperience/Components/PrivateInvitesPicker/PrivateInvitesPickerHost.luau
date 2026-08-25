local buildExperience = script:FindFirstAncestor("BuildExperience")
local reactModule = require(buildExperience.Parent.React)
local privateInvitesPickerContainerModule = require(buildExperience.Components.PrivateInvitesPicker.PrivateInvitesPickerContainer)

return function(p0)
	-- upvalues: reactModule (ref), privateInvitesPickerContainerModule (ref)
	return reactModule.createElement(privateInvitesPickerContainerModule, {
		universeId = p0.universeId,
		onClose = p0.onClose,
		onInvitesSent = p0.onInvitesSent,
		testId = p0.testId
	})
end