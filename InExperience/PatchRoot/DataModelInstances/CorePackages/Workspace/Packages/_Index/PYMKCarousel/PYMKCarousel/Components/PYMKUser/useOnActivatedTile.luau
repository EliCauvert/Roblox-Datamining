local httpService = game:GetService("HttpService")
local parent = script.Parent.Parent.Parent
local dependenciesModule = require(parent.dependencies)
local parent_1 = parent.Parent
local react = dependenciesModule.React
local constantsModule = require(parent.Common.Constants)
local socialCommonModule = require(parent_1.SocialCommon)
local _ = require(parent_1.UserList)
local recommendationContextType = dependenciesModule.RoduxFriends.Enums.RecommendationContextType
local getRecommendationContextualInfoType = socialCommonModule.Utils.getRecommendationContextualInfoType
local getFriendStatusModule = require(parent.Analytics.getFriendStatus)
local eventNames = require(parent.Analytics).EventNames

return function(p1)
	-- upvalues: react (ref), constantsModule (ref), getRecommendationContextualInfoType (ref), recommendationContextType (ref), eventNames (ref), getFriendStatusModule (ref), httpService (ref)
	local var1 = react.useMemo(function()
		-- upvalues: p1 (ref)
		return if p1.recommendation.mutualFriendsCount then p1.recommendation.mutualFriendsCount elseif p1.recommendation.mutualFriendsList then #p1.recommendation.mutualFriendsList else nil
	end, {
		p1.recommendation.mutualFriendsCount,
		p1.recommendation.mutualFriendsList
	})
	local var2 = react.useCallback(function()
		-- upvalues: p1 (ref), constantsModule (copy), var1 (ref), getRecommendationContextualInfoType (copy), recommendationContextType (copy)
		p1.openProfilePeekView(p1.userId, {
			isRecommendation = true,
			absolutePosition = p1.absolutePosition,
			source = constantsModule.HomepagePYMKCarouselSourceName,
			mutualFriendsCount = var1,
			recommendationSessionId = p1.recommendationSessionId,
			recommendationRank = p1.recommendation.rank,
			recommendationContextType = p1.recommendation.contextType and p1.recommendation.contextType.rawValue() or nil,
			contextualInfoType = getRecommendationContextualInfoType(p1.recommendation),
			contactProps = if p1.recommendation.contextType == recommendationContextType.Contacts then {
				contactId = p1.userId,
				avatarImageUrl = if p1.recommendation.thumbnailEntities then p1.recommendation.thumbnailEntities.avatarImageUrl else nil,
				contactName = p1.recommendation.entityDisplayName
			} else nil,
			profileType = if p1.recommendation.contextType == recommendationContextType.Contacts then "FromContacts" else nil
		})
	end, {
		p1.openProfilePeekView, p1.userId, p1.absolutePosition, var1,
		p1.recommendationSessionId, p1.recommendation
	})
	
	return react.useCallback(function()
		-- upvalues: var2 (ref), p1 (ref), eventNames (copy), getFriendStatusModule (copy), recommendationContextType (copy), httpService (copy)
		var2()
		p1.fireAnalyticsEvent(eventNames.UserPressed, {
			recommendationId = p1.userId,
			friendStatus = getFriendStatusModule(p1.friendshipStatus, p1.recommendation.hasIncomingFriendRequest),
			recommendationContextType = p1.recommendation.contextType,
			recommendationRank = p1.recommendation.rank,
			absolutePosition = p1.absolutePosition,
			positionInRow = p1.absolutePosition,
			contactId = if p1.recommendation.contextType == recommendationContextType.Contacts then p1.userId else nil,
			presence = p1.userPresenceType,
			interactionUuid = httpService:GenerateGUID(false)
		})
	end, {
		var2, p1.fireAnalyticsEvent, p1.userId, p1.friendshipStatus,
		p1.absolutePosition, p1.userPresenceType,
		p1.recommendation.hasIncomingFriendRequest, p1.recommendation.contextType,
		p1.recommendation.rank
	})
end