-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:07 2026 Pacific Standard Time.

return function(p0) --[[ line: 1 ]]
	return {
		isFriendsWith = require(script.isFriendsWith)(p0),
		getSortedByRankRecommendations = require(script.getSortedByRankRecommendations)(p0),
		selectFriendshipStatusesByUserIds = require(script.selectFriendshipStatusesByUserIds)(p0),
		getRecommendationIdsBySource = require(script.getRecommendationIdsBySource)(p0),
		selectRecommendationsForUserId = require(script.selectRecommendationsForUserId)(p0),
		getSortedByRankRecommendationIds = require(script.getSortedByRankRecommendationIds)(p0)
	}
end