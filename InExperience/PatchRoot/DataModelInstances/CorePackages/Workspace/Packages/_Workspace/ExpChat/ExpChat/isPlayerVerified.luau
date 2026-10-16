local ExpChat = script:FindFirstAncestor("ExpChat")
local GetFFlagOverridePlayerVerifiedBadgeModule = require(ExpChat.Flags.getFFlagOverridePlayerVerifiedBadge)
local GetFStringWhitelistVerifiedUserIdModule = require(ExpChat.Flags.getFStringWhitelistVerifiedUserId)

return function(Player) --[[ Line: 16 | Named "isPlayerVerified" ]]
	-- upvalues: GetFFlagOverridePlayerVerifiedBadgeModule (copy), GetFStringWhitelistVerifiedUserIdModule (copy)
	return if GetFFlagOverridePlayerVerifiedBadgeModule() then true else tostring(Player.UserId) == GetFStringWhitelistVerifiedUserIdModule() or Player.HasVerifiedBadge
end