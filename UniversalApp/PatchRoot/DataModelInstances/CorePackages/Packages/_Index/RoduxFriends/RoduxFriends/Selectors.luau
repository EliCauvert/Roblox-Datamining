return function(p0)
	return {
		isFriendsWith = require(script.isFriendsWith)(p0),
		getSortedByRankRecommendations = require(script.getSortedByRankRecommendations)(p0),
		selectFriendshipStatusesByUserIds = require(script.selectFriendshipStatusesByUserIds)(p0),
		getRecommendationIdsBySource = require(script.getRecommendationIdsBySource)(p0),
		selectRecommendationsForUserId = require(script.selectRecommendationsForUserId)(p0),
		getSortedByRankRecommendationIds = require(script.getSortedByRankRecommendationIds)(p0)
	}
end