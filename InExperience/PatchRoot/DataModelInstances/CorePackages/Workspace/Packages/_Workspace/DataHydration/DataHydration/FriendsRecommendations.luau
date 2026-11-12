local _ = require(script.FriendsRecommendationsStoreTypes)
local _ = require(script.SduiFriendRecommendationTypes)
local _ = require(script.createSduiFriendRecommendationsStore)

return {
	FriendsRecommendationsStore = require(script.FriendsRecommendationsStore),
	Enums = require(script.Enums),
	FriendRecommendations = require(script.SduiFriendRecommendations)
}