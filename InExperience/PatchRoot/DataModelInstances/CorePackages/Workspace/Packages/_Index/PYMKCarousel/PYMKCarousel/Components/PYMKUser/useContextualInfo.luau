local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local react = require(parent.dependencies).React
local useLocalization = require(parent_1.Localization).Hooks.useLocalization
local getRecommendationContextualInfoDisplay = require(parent_1.SocialCommon).Utils.getRecommendationContextualInfoDisplay
local _ = require(parent_1.UserList)

return function(p1)
	-- upvalues: useLocalization (ref), react (ref), getRecommendationContextualInfoDisplay (ref)
	local var1 = useLocalization({
		singularMutualConnection = "Feature.Friends.Label.OneMutual",
		frequents = "Feature.Friends.Label.Frequent",
		connectionRequests = "Feature.Friends.Label.Request",
		contacts = "Feature.Friends.Description.FromContacts",
		mutualConnections = {
			"Feature.Friends.Label.MultipleMutuals",
			numConnections = p1.recommendation.mutualFriendsCount
		}
	})
	
	return react.useMemo(function()
		-- upvalues: p1 (ref), getRecommendationContextualInfoDisplay (copy), var1 (ref)
		return getRecommendationContextualInfoDisplay({
			recommendation = {
				contextType = p1.recommendation.contextType,
				mutualFriendsList = p1.recommendation.mutualFriendsList,
				mutualFriendsCount = p1.recommendation.mutualFriendsCount,
				hasIncomingFriendRequest = p1.hasIncomingFriendRequest
			},
			localized = var1
		})
	end, {
		var1,
		p1.recommendation.contextType,
		p1.recommendation.mutualFriendsList,
		p1.recommendation.mutualFriendsCount,
		p1.hasIncomingFriendRequest
	})
end