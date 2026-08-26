local socialCommon = script:FindFirstAncestor("SocialCommon")
local parent = socialCommon.Parent
local useLocalization = require(parent.Localization).Hooks.useLocalization
local getRecommendationContextualInfoDisplayModule = require(socialCommon.Utils.getRecommendationContextualInfoDisplay)
local fFlagConnectionsToFriendsRename = require(parent.SharedFlags).FFlagConnectionsToFriendsRename

return function(p1)
	-- upvalues: useLocalization (ref), fFlagConnectionsToFriendsRename (ref), getRecommendationContextualInfoDisplayModule (ref)
	return getRecommendationContextualInfoDisplayModule({
		recommendation = p1,
		localized = useLocalization({
			frequents = "Feature.Friends.Label.Frequent",
			contacts = "Feature.Friends.Description.FromContacts",
			singularMutualConnection = if fFlagConnectionsToFriendsRename then "Feature.Friends.Label.MutualFriendTitle" else "Feature.Friends.Label.MutualConnection",
			mutualConnections = {
				if fFlagConnectionsToFriendsRename then "Feature.Friends.Label.MutualFriendsTitle" else "Feature.Friends.Label.MutualConnections",
				numConnections = p1.mutualFriendsCount
			},
			connectionRequests = if fFlagConnectionsToFriendsRename then "Feature.Friends.Label.FriendRequest" else "Feature.Friends.Label.ConnectionRequest"
		})
	})
end