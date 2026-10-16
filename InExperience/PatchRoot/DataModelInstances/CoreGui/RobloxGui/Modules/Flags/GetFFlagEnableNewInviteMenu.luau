local Players = game:GetService("Players")
local NewInviteMenuExperimentManagerModule = require(game:GetService("CoreGui").RobloxGui.Modules.Settings.Pages.ShareGame.NewInviteMenuExperimentManager)
game:DefineFastInt("EnableNewInviteMenuStyleRollout", 0)
game:DefineFastFlag("EnableNewInviteMenuStyle", false)

return function() --[[ Line: 10 ]]
	-- upvalues: Players (copy), NewInviteMenuExperimentManagerModule (copy)
	return if Players.LocalPlayer then if game:GetFastFlag("EnableNewInviteMenuStyle") then true else Players.LocalPlayer.UserId % 100 < game:GetFastInt("EnableNewInviteMenuStyleRollout") or NewInviteMenuExperimentManagerModule.default:getStyleEnabled() else false
end