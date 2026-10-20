return function(_)
	return {
		FriendshipCreated = require(script.FriendshipCreated),
		FriendshipDestroyed = require(script.FriendshipDestroyed),
		RequestReceivedCountUpdated = require(script.RequestReceivedCountUpdated),
		ClearNewFriendRequestsCountUpdated = require(script.ClearNewFriendRequestsCountUpdated),
		FriendRequestCreated = require(script.FriendRequestCreated),
		FriendRequestDeclined = require(script.FriendRequestDeclined),
		RecommendationCreated = require(script.RecommendationCreated),
		RecommendationDestroyed = require(script.RecommendationDestroyed),
		RecommendationSourceCreated = require(script.RecommendationSourceCreated)
	}
end