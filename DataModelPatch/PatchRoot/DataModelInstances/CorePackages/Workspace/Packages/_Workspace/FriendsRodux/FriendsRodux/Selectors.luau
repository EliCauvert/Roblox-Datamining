return function(p1)
	return {
		isFriendsWith = require(script.isFriendsWith)(p1),
		getSortedByRankRecommendations = require(script.getSortedByRankRecommendations)(p1),
		selectFriendshipStatusesByUserIds = require(script.selectFriendshipStatusesByUserIds)(p1),
		getRecommendationIdsBySource = require(script.getRecommendationIdsBySource)(p1),
		selectRecommendationsForUserId = require(script.selectRecommendationsForUserId)(p1),
		getSortedByRankRecommendationIds = require(script.getSortedByRankRecommendationIds)(p1)
	}
end