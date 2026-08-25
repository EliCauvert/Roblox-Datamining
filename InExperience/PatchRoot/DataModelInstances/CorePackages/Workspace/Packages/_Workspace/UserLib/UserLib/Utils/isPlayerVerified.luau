local sharedFlagsModule = require(script:FindFirstAncestor("UserLib").Parent.SharedFlags)
local getFFlagOverridePlayerVerifiedBadge = sharedFlagsModule.getFFlagOverridePlayerVerifiedBadge
local getFStringWhitelistVerifiedUserId = sharedFlagsModule.getFStringWhitelistVerifiedUserId

return function(p0)
	-- upvalues: getFFlagOverridePlayerVerifiedBadge (ref), getFStringWhitelistVerifiedUserId (ref)
	return if getFFlagOverridePlayerVerifiedBadge() then true else tostring(p0.UserId) == getFStringWhitelistVerifiedUserId() or (if p0.HasVerifiedBadge == nil then false else p0.HasVerifiedBadge)
end