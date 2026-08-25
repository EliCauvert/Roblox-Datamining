local playersService = game:GetService("Players")
local moments = script:FindFirstAncestor("Moments")
local getFStringMomentsDebugModeAllowListModule = require(moments.Flags.GetFStringMomentsDebugModeAllowList)
local parseUserAllowListModule = require(moments.Utils.parseUserAllowList)

return function()
	-- upvalues: playersService (ref), parseUserAllowListModule (ref), getFStringMomentsDebugModeAllowListModule (ref)
	local localPlayer = playersService.LocalPlayer
	
	return if localPlayer then parseUserAllowListModule(getFStringMomentsDebugModeAllowListModule(), localPlayer.UserId) else false
end