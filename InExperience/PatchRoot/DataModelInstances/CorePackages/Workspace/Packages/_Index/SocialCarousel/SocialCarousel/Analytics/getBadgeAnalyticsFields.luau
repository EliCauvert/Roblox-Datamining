local FIntSocalCarouselMaxNewRequestsCountModule = require(script:FindFirstAncestor("SocialCarousel").Flags.FIntSocalCarouselMaxNewRequestsCount)

return function(NewRequestCount: number, BadgeEnabled)
	-- upvalues: FIntSocalCarouselMaxNewRequestsCountModule (copy)
	return {
		newRequestCount = NewRequestCount,
		badgeEnabled = BadgeEnabled,
		badgeShown = BadgeEnabled and NewRequestCount > 0,
		badgeCapped = FIntSocalCarouselMaxNewRequestsCountModule < NewRequestCount
	}
end