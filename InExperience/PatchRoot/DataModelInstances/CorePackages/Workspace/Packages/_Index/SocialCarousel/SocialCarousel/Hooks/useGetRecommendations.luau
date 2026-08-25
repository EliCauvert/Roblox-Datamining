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
local friendsRecommendationsModule = require(parent.DataHydration.FriendsRecommendations)
local friendsRecommendationsStore = friendsRecommendationsModule.FriendsRecommendationsStore
local dataSource = friendsRecommendationsModule.Enums.DataSource
local fFlagMigrateFriendshipStatusesSocialCarouselModule = require(socialCarousel.Flags.FFlagMigrateFriendshipStatusesSocialCarousel)
local fFlagSocialCarouselMigrateRecommendations = require(parent.SharedFlags).FFlagSocialCarouselMigrateRecommendations
local var12 = if fFlagMigrateFriendshipStatusesSocialCarouselModule then dataHydrationModule.Friends.FriendsStore.get() else nil
local t = { skipFetch = true }

local var14 = function(p0, p1)
	return p0.rank < p1.rank
end

return function(p2)
	-- upvalues: useSelector (ref), fFlagSocialCarouselMigrateRecommendations (ref), getDeepValueModule (ref), constantsModule (ref), fFlagMigrateFriendshipStatusesSocialCarouselModule (ref), recommendationSourceEnum (ref), reactModule (ref), cryoModule (ref), signalsModule (ref), var12 (ref), t (ref), signalsReactModule (ref), friendsRecommendationsStore (ref), dataSource (ref), var14 (ref)
	local var15 = useSelector(function(p3)
		-- upvalues: fFlagSocialCarouselMigrateRecommendations (copy), getDeepValueModule (copy), constantsModule (copy), p2 (ref), fFlagMigrateFriendshipStatusesSocialCarouselModule (copy), recommendationSourceEnum (copy)
		return {
			recommendationsDict = if fFlagSocialCarouselMigrateRecommendations then nil else getDeepValueModule(p3, string.format("%s.Friends.recommendations.byUserId.%s", constantsModule.RODUX_KEY, p2 or "")) or {},
			friendshipStatus = if fFlagMigrateFriendshipStatusesSocialCarouselModule then nil else getDeepValueModule(p3, string.format("%s.Friends.friendshipStatus", constantsModule.RODUX_KEY)) or {},
			friendsCarouselRecommendationIds = if fFlagSocialCarouselMigrateRecommendations then nil else getDeepValueModule(p3, string.format("%s.Friends.recommendations.bySource.%s", constantsModule.RODUX_KEY, recommendationSourceEnum.HomepageFriendsCarousel)) or {},
			hasIncomingFriendRequest = if fFlagSocialCarouselMigrateRecommendations then nil else getDeepValueModule(p3, string.format("%s.Friends.recommendations.hasIncomingFriendRequest", constantsModule.RODUX_KEY))
		}
	end)
	local var16 = if fFlagSocialCarouselMigrateRecommendations then nil else reactModule.useMemo(function()
		-- upvalues: cryoModule (copy), var15 (ref)
		return cryoModule.List.filter(cryoModule.Dictionary.keys(var15.recommendationsDict), function(p4)
			-- upvalues: var15 (copy)
			return var15.friendsCarouselRecommendationIds[p4]
		end)
	end, {
		var15.recommendationsDict,
		var15.friendsCarouselRecommendationIds
	})
	local var17 = if fFlagMigrateFriendshipStatusesSocialCarouselModule and not fFlagSocialCarouselMigrateRecommendations then signalsReactModule.useSignalState(if fFlagMigrateFriendshipStatusesSocialCarouselModule and not fFlagSocialCarouselMigrateRecommendations then reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), var16 (ref), var12 (copy), t (copy)
		return signalsModule.createComputed(function(p5)
			-- upvalues: var16 (copy), var12 (copy), t (copy)
			local t_1 = {}
			
			for i, v in var16 do
				local friendshipStatus = var12.GetFriendshipStatus(v, t)
				t_1[v] = if friendshipStatus then friendshipStatus.data(p5) else nil
			end
			return t_1
		end)
	end, { table.concat(var16, ",") }) else nil) else nil
	local var18 = if fFlagSocialCarouselMigrateRecommendations then nil else reactModule.useCallback(function(p6)
		-- upvalues: var15 (ref), fFlagMigrateFriendshipStatusesSocialCarouselModule (copy), var17 (write), cryoModule (copy)
		local var25
		local var21 = var15.recommendationsDict[p6]
		local var22 = if fFlagMigrateFriendshipStatusesSocialCarouselModule then var17 and var17[p6] else var15.friendshipStatus[p6]
		local join = cryoModule.Dictionary.join
		local t = {}
		local t_1 = {}
		
		if var22 then
			var25 = var22 == Enum.FriendStatus.Friend
			var25 = nil
		else
			var25 = false
		end
		local var26
		t_1.isFriendWithUser = var25
		
		if var22 then
			var26 = var22 == Enum.FriendStatus.FriendRequestSent
			var26 = nil
		else
			var26 = false
		end
		local var27
		t_1.hasPendingFriendRequest = var26
		
		if var22 then
			var27 = var22 == Enum.FriendStatus.NotFriend
			var27 = nil
		else
			var27 = true
		end
		t_1.canSendFriendRequest = var27
		t_1.hasIncomingFriendRequest = var15.hasIncomingFriendRequest[p6]
		
		return join(t, var21, t_1)
	end, {
		var15.recommendationsDict,
		if fFlagMigrateFriendshipStatusesSocialCarouselModule then var17 else var15.friendshipStatus,
		var15.hasIncomingFriendRequest
	})
	
	return if fFlagSocialCarouselMigrateRecommendations then if fFlagSocialCarouselMigrateRecommendations then signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), friendsRecommendationsStore (copy), dataSource (copy), t (copy), cryoModule (copy), fFlagMigrateFriendshipStatusesSocialCarouselModule (copy), var12 (copy), var15 (ref)
		return signalsModule.createComputed(function(p7)
			-- upvalues: friendsRecommendationsStore (copy), dataSource (copy), t (copy), cryoModule (copy), fFlagMigrateFriendshipStatusesSocialCarouselModule (copy), var12 (copy), var15 (copy)
			local var28 = friendsRecommendationsStore.get().getFriendsRecommendations(dataSource.HomepageFriendsCarousel, t).data(p7)
			
			return cryoModule.List.map(if var28 then var28.data else {}, function(p8)
				-- upvalues: fFlagMigrateFriendshipStatusesSocialCarouselModule (copy), var12 (copy), t (copy), p7 (ref), var15 (copy)
				local var30
				local id = p8.id
				local _ = nil
				
				if fFlagMigrateFriendshipStatusesSocialCarouselModule then
					local friendshipStatus = var12.GetFriendshipStatus(id, t)
					var30 = if friendshipStatus then friendshipStatus.data(p7) else nil
				else
					var30 = var15.friendshipStatus[id]
				end
				local var32
				local t_1 = {
					id = id,
					mutualFriendsCount = p8.contextProps.mutualFriendsCount,
					contextType = p8.contextProps.contextType,
					rank = p8.rank,
					hasIncomingFriendRequest = p8.hasIncomingFriendRequest
				}
				
				if var30 then
					var32 = var30 == Enum.FriendStatus.Friend
					var32 = nil
				else
					var32 = false
				end
				local var33
				t_1.isFriendWithUser = var32
				
				if var30 then
					var33 = var30 == Enum.FriendStatus.FriendRequestSent
					var33 = nil
				else
					var33 = false
				end
				local var34
				t_1.hasPendingFriendRequest = var33
				
				if var30 then
					var34 = var30 == Enum.FriendStatus.NotFriend
					var34 = nil
				else
					var34 = true
				end
				t_1.canSendFriendRequest = var34
				
				return t_1
			end)
		end)
	end, if fFlagMigrateFriendshipStatusesSocialCarouselModule then {} else { var15.friendshipStatus })) else nil elseif fFlagSocialCarouselMigrateRecommendations then nil else reactModule.useMemo(function()
		-- upvalues: cryoModule (copy), var16 (ref), var18 (ref), var14 (copy)
		return cryoModule.List.sort(cryoModule.List.map(var16, var18), var14)
	end, { var16, var18 })
end