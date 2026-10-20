local SocialCarousel = script:FindFirstAncestor("SocialCarousel")
local Parent = SocialCarousel.Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local GetDeepValueModule = require(SocialCarousel.Utils.getDeepValue)
local ConstantsModule = require(SocialCarousel.Common.Constants)
local RecommendationSourceEnum = require(Parent.SocialCommon).Enums.RecommendationSourceEnum
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector

local function v7(p1, p2): boolean
	return p1.rank < p2.rank
end

return function(p1)
	-- upvalues: UseSelectorFunction (copy), GetDeepValueModule (copy), ConstantsModule (copy), RecommendationSourceEnum (copy), ReactModule (copy), CryoModule (copy), v7 (copy)
	local UseSelectorResult = UseSelectorFunction(function(p2)
		-- upvalues: GetDeepValueModule (upval), ConstantsModule (upval), p1 (copy), RecommendationSourceEnum (upval)
		return {
			recommendationsDict = GetDeepValueModule(p2, string.format("%s.Friends.recommendations.byUserId.%s", ConstantsModule.RODUX_KEY, p1 or "")) or {},
			friendshipStatus = GetDeepValueModule(p2, string.format("%s.Friends.friendshipStatus", ConstantsModule.RODUX_KEY)) or {},
			friendsCarouselRecommendationIds = GetDeepValueModule(p2, string.format("%s.Friends.recommendations.bySource.%s", ConstantsModule.RODUX_KEY, RecommendationSourceEnum.HomepageFriendsCarousel)) or {},
			hasIncomingFriendRequest = GetDeepValueModule(p2, string.format("%s.Friends.recommendations.hasIncomingFriendRequest", ConstantsModule.RODUX_KEY)),
			users = GetDeepValueModule(p2, string.format("%s.Users.byUserId", ConstantsModule.RODUX_KEY))
		}
	end)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: CryoModule (upval), UseSelectorResult (copy)
		return CryoModule.List.filter(CryoModule.Dictionary.keys(UseSelectorResult.recommendationsDict), function(p2)
			-- upvalues: UseSelectorResult (upval)
			return UseSelectorResult.friendsCarouselRecommendationIds[p2]
		end)
	end, {
		UseSelectorResult.recommendationsDict,
		UseSelectorResult.friendsCarouselRecommendationIds
	})
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: UseSelectorResult (copy), CryoModule (upval)
		local FriendshipStatusEntry = UseSelectorResult.friendshipStatus[p2]
		
		return CryoModule.Dictionary.join(UseSelectorResult.users[p2], UseSelectorResult.recommendationsDict[p2], {
			isFriendWithUser = if FriendshipStatusEntry then FriendshipStatusEntry == Enum.FriendStatus.Friend else false,
			hasPendingFriendRequest = if FriendshipStatusEntry then FriendshipStatusEntry == Enum.FriendStatus.FriendRequestSent else false,
			canSendFriendRequest = not FriendshipStatusEntry or FriendshipStatusEntry == Enum.FriendStatus.NotFriend,
			hasIncomingFriendRequest = UseSelectorResult.hasIncomingFriendRequest[p2]
		})
	end, {
		UseSelectorResult.recommendationsDict,
		UseSelectorResult.friendshipStatus,
		UseSelectorResult.users,
		UseSelectorResult.hasIncomingFriendRequest
	})
	
	return (ReactModule.useMemo(function()
		-- upvalues: CryoModule (upval), UseMemoResult (copy), UseResult (copy), v7 (upval)
		return CryoModule.List.sort(CryoModule.List.map(UseMemoResult, UseResult), v7)
	end, { UseMemoResult, UseResult }))
end