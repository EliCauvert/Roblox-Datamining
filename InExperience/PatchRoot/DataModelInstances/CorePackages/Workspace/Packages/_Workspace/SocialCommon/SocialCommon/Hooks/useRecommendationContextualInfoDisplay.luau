local SocialCommon = script:FindFirstAncestor("SocialCommon")
local UseLocalizationFunction = require(SocialCommon.Parent.Localization).Hooks.useLocalization
local GetRecommendationContextualInfoDisplayModule = require(SocialCommon.Utils.getRecommendationContextualInfoDisplay)

return function(Recommendation)
	-- upvalues: UseLocalizationFunction (copy), GetRecommendationContextualInfoDisplayModule (copy)
	return GetRecommendationContextualInfoDisplayModule({
		recommendation = Recommendation,
		localized = UseLocalizationFunction({
			singularMutualConnection = "Feature.Friends.Label.MutualFriendTitle",
			frequents = "Feature.Friends.Label.Frequent",
			connectionRequests = "Feature.Friends.Label.FriendRequest",
			contacts = "Feature.Friends.Description.FromContacts",
			mutualConnections = {
				"Feature.Friends.Label.MutualFriendsTitle",
				numConnections = Recommendation.mutualFriendsCount
			}
		})
	})
end