local _ = game:GetService("Players")
local newInviteMenuExperimentManagerModule = require(game:GetService("CoreGui").RobloxGui.Modules.Settings.Pages.ShareGame.NewInviteMenuExperimentManager)
game:DefineFastFlag("EnableNewInviteSendEndpoint", false)
game:DefineFastFlag("EnableNewInviteSendEndpointIXP", false)

return function() --[[ line: 10 ]]
	-- upvalues: newInviteMenuExperimentManagerModule (ref)
	return game:GetFastFlag("EnableNewInviteSendEndpoint") or game:GetFastFlag("EnableNewInviteSendEndpointIXP") and newInviteMenuExperimentManagerModule.default:getCustomizationEnabled()
end