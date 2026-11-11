local Players = game:GetService("Players")
local Moments = script:FindFirstAncestor("Moments")
local GetFStringMomentsDebugModeAllowListModule = require(Moments.Flags.GetFStringMomentsDebugModeAllowList)
local ParseUserAllowListModule = require(Moments.Utils.parseUserAllowList)

return function()
	-- upvalues: Players (copy), ParseUserAllowListModule (copy), GetFStringMomentsDebugModeAllowListModule (copy)
	local LocalPlayer = Players.LocalPlayer
	
	return if LocalPlayer then ParseUserAllowListModule(GetFStringMomentsDebugModeAllowListModule(), LocalPlayer.UserId) else false
end