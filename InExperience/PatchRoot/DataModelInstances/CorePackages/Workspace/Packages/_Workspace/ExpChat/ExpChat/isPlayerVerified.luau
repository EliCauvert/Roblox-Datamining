local expChat = script:FindFirstAncestor("ExpChat")
local getFFlagOverridePlayerVerifiedBadgeModule = require(expChat.Flags.getFFlagOverridePlayerVerifiedBadge)
local getFStringWhitelistVerifiedUserIdModule = require(expChat.Flags.getFStringWhitelistVerifiedUserId)

return function(p1)
	-- upvalues: getFFlagOverridePlayerVerifiedBadgeModule (ref), getFStringWhitelistVerifiedUserIdModule (ref)
	return if getFFlagOverridePlayerVerifiedBadgeModule() then true else tostring(p1.UserId) == getFStringWhitelistVerifiedUserIdModule() or p1.HasVerifiedBadge
end