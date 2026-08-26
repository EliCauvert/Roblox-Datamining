local sharedFlagsModule = require(script:FindFirstAncestor("UserLib").Parent.SharedFlags)
local getFFlagOverridePlayerVerifiedBadge = sharedFlagsModule.getFFlagOverridePlayerVerifiedBadge
local getFStringWhitelistVerifiedUserId = sharedFlagsModule.getFStringWhitelistVerifiedUserId

return function(p1)
	-- upvalues: getFFlagOverridePlayerVerifiedBadge (ref), getFStringWhitelistVerifiedUserId (ref)
	return if getFFlagOverridePlayerVerifiedBadge() then true else tostring(p1.UserId) == getFStringWhitelistVerifiedUserId() or (if p1.HasVerifiedBadge == nil then false else p1.HasVerifiedBadge)
end