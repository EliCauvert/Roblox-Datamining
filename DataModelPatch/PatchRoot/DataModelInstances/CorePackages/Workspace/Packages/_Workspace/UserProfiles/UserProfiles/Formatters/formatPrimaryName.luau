local VerifiedBadgesModule = require(script:FindFirstAncestor("UserProfiles").Parent.VerifiedBadges)

return function(p1, p2)
	-- upvalues: VerifiedBadgesModule (copy)
	return if p2.hasVerifiedBadge then `{p1}{VerifiedBadgesModule.emoji.verified}` elseif p2.hasPremiumMembership then `{p1}{VerifiedBadgesModule.emoji.premium}` else p1
end