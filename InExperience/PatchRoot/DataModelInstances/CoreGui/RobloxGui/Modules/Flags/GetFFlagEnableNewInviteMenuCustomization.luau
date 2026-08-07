local _ = game:GetService("Players")
local newInviteMenuExperimentManagerModule = require(game:GetService("CoreGui").RobloxGui.Modules.Settings.Pages.ShareGame.NewInviteMenuExperimentManager)
game:DefineFastFlag("EnableNewInviteMenuCustomization2", false)
game:DefineFastFlag("EnableNewInviteMenuCustomizationIXP2", false)

return function() --[[ line: 10 ]]
	-- upvalues: newInviteMenuExperimentManagerModule (ref)
	return game:GetFastFlag("EnableNewInviteMenuCustomization2") or game:GetFastFlag("EnableNewInviteMenuCustomizationIXP2") and newInviteMenuExperimentManagerModule.default:getCustomizationEnabled()
end