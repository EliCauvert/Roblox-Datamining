local BuildExperience = script:FindFirstAncestor("BuildExperience")
local ReactModule = require(BuildExperience.Parent.React)
local PrivateInvitesPickerContainerModule = require(BuildExperience.Components.PrivateInvitesPicker.PrivateInvitesPickerContainer)

return function(p1) --[[ Line: 18 | Named "PrivateInvitesPickerHost" ]]
	-- upvalues: ReactModule (copy), PrivateInvitesPickerContainerModule (copy)
	return ReactModule.createElement(PrivateInvitesPickerContainerModule, {
		universeId = p1.universeId,
		onClose = p1.onClose,
		onInvitesSent = p1.onInvitesSent,
		testId = p1.testId
	})
end