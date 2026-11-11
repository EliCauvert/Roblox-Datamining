return function(p1)
	return {
		absolutePosition = p1.position,
		requestedId = p1.playerId,
		isRecommendation = not p1.isFriendRequest,
		recommendationRank = if p1.isFriendRequest then nil else p1.rank,
		isContact = p1.isContact,
		contextualInfoType = p1.contextualInfoType
	}
end