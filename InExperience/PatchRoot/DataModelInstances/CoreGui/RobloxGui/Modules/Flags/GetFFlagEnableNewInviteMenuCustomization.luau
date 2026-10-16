local _ = game:GetService("Players")
local NewInviteMenuExperimentManagerModule = require(game:GetService("CoreGui").RobloxGui.Modules.Settings.Pages.ShareGame.NewInviteMenuExperimentManager)
game:DefineFastFlag("EnableNewInviteMenuCustomization2", false)
game:DefineFastFlag("EnableNewInviteMenuCustomizationIXP2", false)

return function() --[[ Line: 10 ]]
	-- upvalues: NewInviteMenuExperimentManagerModule (copy)
	return game:GetFastFlag("EnableNewInviteMenuCustomization2") or game:GetFastFlag("EnableNewInviteMenuCustomizationIXP2") and NewInviteMenuExperimentManagerModule.default:getCustomizationEnabled()
end