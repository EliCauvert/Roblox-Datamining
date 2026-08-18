local socialCarousel = script:FindFirstAncestor("SocialCarousel")
local parent = socialCarousel.Parent
local socialCommonModule = require(parent.SocialCommon)
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local roactUtilsModule = require(parent.RoactUtils)
local dataHydrationModule = require(parent.DataHydration)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local getDeepValueModule = require(socialCarousel.Utils.getDeepValue)
local constantsModule = require(socialCarousel.Common.Constants)
local recommendationSourceEnum = socialCommonModule.Enums.RecommendationSourceEnum
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local fFlagFriendsCarouselDeprecateUnusedReducers = require(parent.SharedFlags).FFlagFriendsCarouselDeprecateUnusedReducers
local fFlagMigrateFriendshipStatusesSocialCarouselModule = require(socialCarousel.Flags.FFlagMigrateFriendshipStatusesSocialCarousel)
local var11 = if fFlagMigrateFriendshipStatusesSocialCarouselModule then dataHydrationModule.Friends.FriendsStore.get() else nil
local t = { skipFetch = true }

local var13 = function(p0, p1) --[[ line: 41 ]]
	return p0.rank < p1.rank
end

return function(p2) --[[ line: 45 ]]
	-- upvalues: useSelector (ref), getDeepValueModule (ref), constantsModule (ref), fFlagMigrateFriendshipStatusesSocialCarouselModule (ref), recommendationSourceEnum (ref), fFlagFriendsCarouselDeprecateUnusedReducers (ref), reactModule (ref), cryoModule (ref), signalsModule (ref), var11 (ref), t (ref), signalsReactModule (ref), var13 (ref)
	local var14 = useSelector(function(p3) --[[ line: 46 ]]
		-- upvalues: getDeepValueModule (copy), constantsModule (copy), p2 (ref), fFlagMigrateFriendshipStatusesSocialCarouselModule (copy), recommendationSourceEnum (copy), fFlagFriendsCarouselDeprecateUnusedReducers (copy)
		return {
			recommendationsDict = getDeepValueModule(p3, string.format("%s.Friends.recommendations.byUserId.%s", constantsModule.RODUX_KEY, p2 or "")) or {},
			friendshipStatus = if fFlagMigrateFriendshipStatusesSocialCarouselModule then nil else getDeepValueModule(p3, string.format("%s.Friends.friendshipStatus", constantsModule.RODUX_KEY)) or {},
			friendsCarouselRecommendationIds = getDeepValueModule(p3, string.format("%s.Friends.recommendations.bySource.%s", constantsModule.RODUX_KEY, recommendationSourceEnum.HomepageFriendsCarousel)) or {},
			hasIncomingFriendRequest = getDeepValueModule(p3, string.format("%s.Friends.recommendations.hasIncomingFriendRequest", constantsModule.RODUX_KEY)),
			users = if fFlagFriendsCarouselDeprecateUnusedReducers then nil else getDeepValueModule(p3, string.format("%s.Users.byUserId", constantsModule.RODUX_KEY))
		}
	end)
	local var15 = reactModule.useMemo(function() --[[ line: 73 ]]
		-- upvalues: cryoModule (copy), var14 (ref)
		return cryoModule.List.filter(cryoModule.Dictionary.keys(var14.recommendationsDict), function(p4) --[[ line: 74 ]]
			-- upvalues: var14 (copy)
			return var14.friendsCarouselRecommendationIds[p4]
		end)
	end, {
		var14.recommendationsDict,
		var14.friendsCarouselRecommendationIds
	})
	local var16 = if fFlagMigrateFriendshipStatusesSocialCarouselModule then signalsReactModule.useSignalState(if fFlagMigrateFriendshipStatusesSocialCarouselModule then reactModule.useMemo(function() --[[ line: 84 ]]
		-- upvalues: signalsModule (copy), var15 (ref), var11 (copy), t (copy)
		return signalsModule.createComputed(function(p5) --[[ line: 85 ]]
			-- upvalues: var15 (copy), var11 (copy), t (copy)
			local t_1 = {}
			
			for i, v in var15 do
				local friendshipStatus = var11.GetFriendshipStatus(v, t)
				t_1[v] = if friendshipStatus then friendshipStatus.data(p5) else nil
			end
			return t_1
		end)
	end, { table.concat(var15, ",") }) else nil) else nil
	local var17 = reactModule.useCallback(function(p6) --[[ line: 104 ]]
		-- upvalues: var14 (ref), fFlagMigrateFriendshipStatusesSocialCarouselModule (copy), var16 (write), cryoModule (copy), fFlagFriendsCarouselDeprecateUnusedReducers (copy)
		local var24
		local var20 = var14.recommendationsDict[p6]
		local var21 = if fFlagMigrateFriendshipStatusesSocialCarouselModule then var16 and var16[p6] else var14.friendshipStatus[p6]
		local join = cryoModule.Dictionary.join
		local var22 = if fFlagFriendsCarouselDeprecateUnusedReducers then {} else var14.users[p6]
		local t = {}
		
		if var21 then
			var24 = var21 == Enum.FriendStatus.Friend
			var24 = nil
		else
			var24 = false
		end
		local var25
		t.isFriendWithUser = var24
		
		if var21 then
			var25 = var21 == Enum.FriendStatus.FriendRequestSent
			var25 = nil
		else
			var25 = false
		end
		local var26
		t.hasPendingFriendRequest = var25
		
		if var21 then
			var26 = var21 == Enum.FriendStatus.NotFriend
			var26 = nil
		else
			var26 = true
		end
		t.canSendFriendRequest = var26
		t.hasIncomingFriendRequest = var14.hasIncomingFriendRequest[p6]
		
		return join(var22, var20, t)
	end, {
		var14.recommendationsDict,
		if fFlagMigrateFriendshipStatusesSocialCarouselModule then var16 else var14.friendshipStatus,
		if fFlagFriendsCarouselDeprecateUnusedReducers then nil else var14.users,
		var14.hasIncomingFriendRequest
	})
	
	return reactModule.useMemo(function() --[[ line: 133 ]]
		-- upvalues: cryoModule (copy), var15 (ref), var17 (ref), var13 (copy)
		return cryoModule.List.sort(cryoModule.List.map(var15, var17), var13)
	end, { var15, var17 })
end