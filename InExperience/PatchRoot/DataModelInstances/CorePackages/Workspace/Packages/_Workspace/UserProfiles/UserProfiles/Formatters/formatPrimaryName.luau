local verifiedBadgesModule = require(script:FindFirstAncestor("UserProfiles").Parent.VerifiedBadges)

return function(p0, p1)
	-- upvalues: verifiedBadgesModule (ref)
	return if p1.hasVerifiedBadge then `{p0}{verifiedBadgesModule.emoji.verified}` elseif p1.hasPremiumMembership then `{p0}{verifiedBadgesModule.emoji.premium}` else p0
end