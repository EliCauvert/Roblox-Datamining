local expChat = script:FindFirstAncestor("ExpChat")
local getFFlagOverridePlayerVerifiedBadgeModule = require(expChat.Flags.getFFlagOverridePlayerVerifiedBadge)
local getFStringWhitelistVerifiedUserIdModule = require(expChat.Flags.getFStringWhitelistVerifiedUserId)

return function(p0)
	-- upvalues: getFFlagOverridePlayerVerifiedBadgeModule (ref), getFStringWhitelistVerifiedUserIdModule (ref)
	return if getFFlagOverridePlayerVerifiedBadgeModule() then true else tostring(p0.UserId) == getFStringWhitelistVerifiedUserIdModule() or p0.HasVerifiedBadge
end