local ProfileInsightsStore = require(script:FindFirstAncestor("TrustedFriendCandidates").Parent.DataHydration.ProfileInsights).ProfileInsightsStore

return function(p1)
	-- upvalues: ProfileInsightsStore (copy)
	return ProfileInsightsStore.get().GetProfileInsight(p1, { rankingStrategy = "tf_candidates" })
end