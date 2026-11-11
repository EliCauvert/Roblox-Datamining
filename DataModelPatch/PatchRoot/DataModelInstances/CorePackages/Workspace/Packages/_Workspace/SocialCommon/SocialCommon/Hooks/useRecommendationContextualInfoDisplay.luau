local SocialCommon = script:FindFirstAncestor("SocialCommon")
local Parent = SocialCommon.Parent
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local GetRecommendationContextualInfoDisplayModule = require(SocialCommon.Utils.getRecommendationContextualInfoDisplay)
local FFlagConnectionsToFriendsRename = require(Parent.SharedFlags).FFlagConnectionsToFriendsRename

return function(Recommendation)
	-- upvalues: UseLocalizationFunction (copy), FFlagConnectionsToFriendsRename (copy), GetRecommendationContextualInfoDisplayModule (copy)
	return GetRecommendationContextualInfoDisplayModule({
		recommendation = Recommendation,
		localized = UseLocalizationFunction({
			frequents = "Feature.Friends.Label.Frequent",
			contacts = "Feature.Friends.Description.FromContacts",
			singularMutualConnection = if FFlagConnectionsToFriendsRename then "Feature.Friends.Label.MutualFriendTitle" else "Feature.Friends.Label.MutualConnection",
			mutualConnections = {
				if FFlagConnectionsToFriendsRename then "Feature.Friends.Label.MutualFriendsTitle" else "Feature.Friends.Label.MutualConnections",
				numConnections = Recommendation.mutualFriendsCount
			},
			connectionRequests = if FFlagConnectionsToFriendsRename then "Feature.Friends.Label.FriendRequest" else "Feature.Friends.Label.ConnectionRequest"
		})
	})
end