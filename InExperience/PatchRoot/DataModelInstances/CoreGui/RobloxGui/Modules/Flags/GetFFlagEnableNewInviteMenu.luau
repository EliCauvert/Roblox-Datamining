local playersService = game:GetService("Players")
local newInviteMenuExperimentManagerModule = require(game:GetService("CoreGui").RobloxGui.Modules.Settings.Pages.ShareGame.NewInviteMenuExperimentManager)
game:DefineFastInt("EnableNewInviteMenuStyleRollout", 0)
game:DefineFastFlag("EnableNewInviteMenuStyle", false)

return function()
	-- upvalues: playersService (ref), newInviteMenuExperimentManagerModule (ref)
	return if playersService.LocalPlayer then if game:GetFastFlag("EnableNewInviteMenuStyle") then true else playersService.LocalPlayer.UserId % 100 < game:GetFastInt("EnableNewInviteMenuStyleRollout") or newInviteMenuExperimentManagerModule.default:getStyleEnabled() else false
end