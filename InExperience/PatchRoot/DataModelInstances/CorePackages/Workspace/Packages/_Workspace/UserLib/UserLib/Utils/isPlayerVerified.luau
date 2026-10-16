local SharedFlagsModule = require(script:FindFirstAncestor("UserLib").Parent.SharedFlags)
local GetFFlagOverridePlayerVerifiedBadgeFunction = SharedFlagsModule.getFFlagOverridePlayerVerifiedBadge
local GetFStringWhitelistVerifiedUserIdFunction = SharedFlagsModule.getFStringWhitelistVerifiedUserId

return function(Player) --[[ Line: 27 | Named "isPlayerVerified" ]]
	-- upvalues: GetFFlagOverridePlayerVerifiedBadgeFunction (copy), GetFStringWhitelistVerifiedUserIdFunction (copy)
	return if GetFFlagOverridePlayerVerifiedBadgeFunction() then true else tostring(Player.UserId) == GetFStringWhitelistVerifiedUserIdFunction() or Player.HasVerifiedBadge ~= nil and Player.HasVerifiedBadge
end