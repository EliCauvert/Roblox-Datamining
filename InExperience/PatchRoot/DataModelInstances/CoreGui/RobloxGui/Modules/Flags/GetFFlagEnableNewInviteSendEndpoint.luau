local _ = game:GetService("Players")
local NewInviteMenuExperimentManagerModule = require(game:GetService("CoreGui").RobloxGui.Modules.Settings.Pages.ShareGame.NewInviteMenuExperimentManager)
game:DefineFastFlag("EnableNewInviteSendEndpoint", false)
game:DefineFastFlag("EnableNewInviteSendEndpointIXP", false)

return function() --[[ Line: 10 ]]
	-- upvalues: NewInviteMenuExperimentManagerModule (copy)
	return game:GetFastFlag("EnableNewInviteSendEndpoint") or game:GetFastFlag("EnableNewInviteSendEndpointIXP") and NewInviteMenuExperimentManagerModule.default:getCustomizationEnabled()
end