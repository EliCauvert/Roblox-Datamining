local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local React = require(Parent.dependencies).React
local UseLocalizationFunction = require(Parent1.Localization).Hooks.useLocalization
local GetRecommendationContextualInfoDisplayFunction = require(Parent1.SocialCommon).Utils.getRecommendationContextualInfoDisplay
local _ = require(Parent1.UserList)

return function(p1) --[[ Line: 29 | Named "useContextualInfo" ]]
	-- upvalues: UseLocalizationFunction (copy), React (copy), GetRecommendationContextualInfoDisplayFunction (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		singularMutualConnection = "Feature.Friends.Label.OneMutual",
		frequents = "Feature.Friends.Label.Frequent",
		connectionRequests = "Feature.Friends.Label.Request",
		contacts = "Feature.Friends.Description.FromContacts",
		mutualConnections = {
			"Feature.Friends.Label.MultipleMutuals",
			numConnections = p1.recommendation.mutualFriendsCount
		}
	})
	
	return React.useMemo(function() --[[ Line: 40 ]]
		-- upvalues: p1 (copy), GetRecommendationContextualInfoDisplayFunction (upval), UseLocalizationResult (copy)
		return GetRecommendationContextualInfoDisplayFunction({
			recommendation = {
				contextType = p1.recommendation.contextType,
				mutualFriendsList = p1.recommendation.mutualFriendsList,
				mutualFriendsCount = p1.recommendation.mutualFriendsCount,
				hasIncomingFriendRequest = p1.hasIncomingFriendRequest
			},
			localized = UseLocalizationResult
		})
	end, {
		UseLocalizationResult,
		p1.recommendation.contextType,
		p1.recommendation.mutualFriendsList,
		p1.recommendation.mutualFriendsCount,
		p1.hasIncomingFriendRequest
	})
end