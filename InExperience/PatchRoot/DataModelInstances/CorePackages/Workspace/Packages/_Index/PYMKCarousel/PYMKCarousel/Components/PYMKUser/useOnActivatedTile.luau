local HttpService = game:GetService("HttpService")
local Parent = script.Parent.Parent.Parent
local DependenciesModule = require(Parent.dependencies)
local Parent1 = Parent.Parent
local React = DependenciesModule.React
local ConstantsModule = require(Parent.Common.Constants)
local _ = require(Parent1.UserList)
local RecommendationContextType = DependenciesModule.RoduxFriends.Enums.RecommendationContextType
local GetRecommendationContextualInfoTypeFunction = require(Parent1.SocialCommon).Utils.getRecommendationContextualInfoType
local GetFriendStatusModule = require(Parent.Analytics.getFriendStatus)
local EventNames = require(Parent.Analytics).EventNames

return function(p1) --[[ Line: 43 | Named "useOnActivatedTile" ]]
	-- upvalues: React (copy), ConstantsModule (copy), GetRecommendationContextualInfoTypeFunction (copy), RecommendationContextType (copy), EventNames (copy), GetFriendStatusModule (copy), HttpService (copy)
	local UseMemoResult = React.useMemo(function() --[[ Line: 44 ]]
		-- upvalues: p1 (copy)
		return if p1.recommendation.mutualFriendsCount then p1.recommendation.mutualFriendsCount elseif p1.recommendation.mutualFriendsList then #p1.recommendation.mutualFriendsList else nil
	end, {
		p1.recommendation.mutualFriendsCount,
		p1.recommendation.mutualFriendsList
	})
	local UseResult = React.useCallback(function() --[[ Line: 57 ]]
		-- upvalues: p1 (copy), ConstantsModule (upval), UseMemoResult (copy), GetRecommendationContextualInfoTypeFunction (upval), RecommendationContextType (upval)
		p1.openProfilePeekView(p1.userId, {
			isRecommendation = true,
			absolutePosition = p1.absolutePosition,
			source = ConstantsModule.HomepagePYMKCarouselSourceName,
			mutualFriendsCount = UseMemoResult,
			recommendationSessionId = p1.recommendationSessionId,
			recommendationRank = p1.recommendation.rank,
			recommendationContextType = p1.recommendation.contextType and p1.recommendation.contextType.rawValue() or nil,
			contextualInfoType = GetRecommendationContextualInfoTypeFunction(p1.recommendation),
			contactProps = if p1.recommendation.contextType == RecommendationContextType.Contacts then {
				contactId = p1.userId,
				avatarImageUrl = if p1.recommendation.thumbnailEntities then p1.recommendation.thumbnailEntities.avatarImageUrl else nil,
				contactName = p1.recommendation.entityDisplayName
			} else nil,
			profileType = if p1.recommendation.contextType == RecommendationContextType.Contacts then "FromContacts" else nil
		})
	end, {
		p1.openProfilePeekView, p1.userId, p1.absolutePosition, UseMemoResult,
		p1.recommendationSessionId, p1.recommendation
	})
	
	return (React.useCallback(function() --[[ Line: 97 ]]
		-- upvalues: UseResult (copy), p1 (copy), EventNames (upval), GetFriendStatusModule (upval), RecommendationContextType (upval), HttpService (upval)
		UseResult()
		p1.fireAnalyticsEvent(EventNames.UserPressed, {
			recommendationId = p1.userId,
			friendStatus = GetFriendStatusModule(p1.friendshipStatus, p1.recommendation.hasIncomingFriendRequest),
			recommendationContextType = p1.recommendation.contextType,
			recommendationRank = p1.recommendation.rank,
			absolutePosition = p1.absolutePosition,
			positionInRow = p1.absolutePosition,
			contactId = if p1.recommendation.contextType == RecommendationContextType.Contacts then p1.userId else nil,
			presence = p1.userPresenceType,
			interactionUuid = HttpService:GenerateGUID(false)
		})
	end, {
		UseResult, p1.fireAnalyticsEvent, p1.userId, p1.friendshipStatus,
		p1.absolutePosition, p1.userPresenceType,
		p1.recommendation.hasIncomingFriendRequest, p1.recommendation.contextType,
		p1.recommendation.rank
	}))
end