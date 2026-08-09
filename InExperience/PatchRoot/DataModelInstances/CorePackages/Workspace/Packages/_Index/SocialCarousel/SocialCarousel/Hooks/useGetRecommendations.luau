local socialCarousel = script:FindFirstAncestor("SocialCarousel")
local parent = socialCarousel.Parent
local socialCommonModule = require(parent.SocialCommon)
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local roactUtilsModule = require(parent.RoactUtils)
local getDeepValueModule = require(socialCarousel.Utils.getDeepValue)
local constantsModule = require(socialCarousel.Common.Constants)
local recommendationSourceEnum = socialCommonModule.Enums.RecommendationSourceEnum
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector

local var7 = function(p0, p1) --[[ line: 28 ]]
	return p0.rank < p1.rank
end

return function(p2) --[[ line: 32 ]]
	-- upvalues: useSelector (ref), getDeepValueModule (ref), constantsModule (ref), recommendationSourceEnum (ref), reactModule (ref), cryoModule (ref), var7 (ref)
	local var8 = useSelector(function(p3) --[[ line: 33 ]]
		-- upvalues: getDeepValueModule (copy), constantsModule (copy), p2 (ref), recommendationSourceEnum (copy)
		return {
			recommendationsDict = getDeepValueModule(p3, string.format("%s.Friends.recommendations.byUserId.%s", constantsModule.RODUX_KEY, p2 or "")) or {},
			friendshipStatus = getDeepValueModule(p3, string.format("%s.Friends.friendshipStatus", constantsModule.RODUX_KEY)) or {},
			friendsCarouselRecommendationIds = getDeepValueModule(p3, string.format("%s.Friends.recommendations.bySource.%s", constantsModule.RODUX_KEY, recommendationSourceEnum.HomepageFriendsCarousel)) or {},
			hasIncomingFriendRequest = getDeepValueModule(p3, string.format("%s.Friends.recommendations.hasIncomingFriendRequest", constantsModule.RODUX_KEY)),
			users = getDeepValueModule(p3, string.format("%s.Users.byUserId", constantsModule.RODUX_KEY))
		}
	end)
	local var9 = reactModule.useMemo(function() --[[ line: 57 ]]
		-- upvalues: cryoModule (copy), var8 (ref)
		return cryoModule.List.filter(cryoModule.Dictionary.keys(var8.recommendationsDict), function(p4) --[[ line: 58 ]]
			-- upvalues: var8 (copy)
			return var8.friendsCarouselRecommendationIds[p4]
		end)
	end, {
		var8.recommendationsDict,
		var8.friendsCarouselRecommendationIds
	})
	local var10 = reactModule.useCallback(function(p5) --[[ line: 66 ]]
		-- upvalues: var8 (ref), cryoModule (copy)
		local var15
		local var11 = var8.recommendationsDict[p5]
		local var12 = var8.friendshipStatus[p5]
		local join = cryoModule.Dictionary.join
		local var13 = var8.users[p5]
		local t = {}
		
		if var12 then
			var15 = var12 == Enum.FriendStatus.Friend
			var15 = nil
		else
			var15 = false
		end
		local var16
		t.isFriendWithUser = var15
		
		if var12 then
			var16 = var12 == Enum.FriendStatus.FriendRequestSent
			var16 = nil
		else
			var16 = false
		end
		local var17
		t.hasPendingFriendRequest = var16
		
		if var12 then
			var17 = var12 == Enum.FriendStatus.NotFriend
			var17 = nil
		else
			var17 = true
		end
		t.canSendFriendRequest = var17
		t.hasIncomingFriendRequest = var8.hasIncomingFriendRequest[p5]
		
		return join(var13, var11, t)
	end, {
		var8.recommendationsDict,
		var8.friendshipStatus,
		var8.users,
		var8.hasIncomingFriendRequest
	})
	
	return reactModule.useMemo(function() --[[ line: 87 ]]
		-- upvalues: cryoModule (copy), var9 (ref), var10 (ref), var7 (copy)
		return cryoModule.List.sort(cryoModule.List.map(var9, var10), var7)
	end, { var9, var10 })
end