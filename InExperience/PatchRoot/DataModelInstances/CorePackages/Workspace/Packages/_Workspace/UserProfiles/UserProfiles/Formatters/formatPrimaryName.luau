local verifiedBadgesModule = require(script:FindFirstAncestor("UserProfiles").Parent.VerifiedBadges)

return function(p1, p2)
	-- upvalues: verifiedBadgesModule (ref)
	return if p2.hasVerifiedBadge then `{p1}{verifiedBadgesModule.emoji.verified}` elseif p2.hasPremiumMembership then `{p1}{verifiedBadgesModule.emoji.premium}` else p1
end