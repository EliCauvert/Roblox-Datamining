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
local var1 = if fFlagMigrateFriendshipStatusesSocialCarouselModule then dataHydrationModule.Friends.FriendsStore.get() else nil
local t = { skipFetch = true }

local var2 = function(p1, p2)
	return p1.rank < p2.rank
end

return function(p1)
	-- upvalues: useSelector (ref), fFlagSocialCarouselMigrateRecommendations (ref), getDeepValueModule (ref), constantsModule (ref), fFlagMigrateFriendshipStatusesSocialCarouselModule (ref), recommendationSourceEnum (ref), reactModule (ref), cryoModule (ref), signalsModule (ref), var1 (ref), t (ref), signalsReactModule (ref), friendsRecommendationsStore (ref), dataSource (ref), var2 (ref)
	local var3 = useSelector(function(p2)
		-- upvalues: fFlagSocialCarouselMigrateRecommendations (copy), getDeepValueModule (copy), constantsModule (copy), p1 (ref), fFlagMigrateFriendshipStatusesSocialCarouselModule (copy), recommendationSourceEnum (copy)
		return {
			recommendationsDict = if fFlagSocialCarouselMigrateRecommendations then nil else getDeepValueModule(p2, string.format("%s.Friends.recommendations.byUserId.%s", constantsModule.RODUX_KEY, p1 or "")) or {},
			friendshipStatus = if fFlagMigrateFriendshipStatusesSocialCarouselModule then nil else getDeepValueModule(p2, string.format("%s.Friends.friendshipStatus", constantsModule.RODUX_KEY)) or {},
			friendsCarouselRecommendationIds = if fFlagSocialCarouselMigrateRecommendations then nil else getDeepValueModule(p2, string.format("%s.Friends.recommendations.bySource.%s", constantsModule.RODUX_KEY, recommendationSourceEnum.HomepageFriendsCarousel)) or {},
			hasIncomingFriendRequest = if fFlagSocialCarouselMigrateRecommendations then nil else getDeepValueModule(p2, string.format("%s.Friends.recommendations.hasIncomingFriendRequest", constantsModule.RODUX_KEY))
		}
	end)
	local var4 = if fFlagSocialCarouselMigrateRecommendations then nil else reactModule.useMemo(function()
		-- upvalues: cryoModule (copy), var3 (ref)
		return cryoModule.List.filter(cryoModule.Dictionary.keys(var3.recommendationsDict), function(p2)
			-- upvalues: var3 (copy)
			return var3.friendsCarouselRecommendationIds[p2]
		end)
	end, {
		var3.recommendationsDict,
		var3.friendsCarouselRecommendationIds
	})
	local var5 = if fFlagMigrateFriendshipStatusesSocialCarouselModule and not fFlagSocialCarouselMigrateRecommendations then signalsReactModule.useSignalState(if fFlagMigrateFriendshipStatusesSocialCarouselModule and not fFlagSocialCarouselMigrateRecommendations then reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), var4 (ref), var1 (copy), t (copy)
		return signalsModule.createComputed(function(p2)
			-- upvalues: var4 (copy), var1 (copy), t (copy)
			local t_1 = {}
			
			for i, v in var4 do
				local friendshipStatus = var1.GetFriendshipStatus(v, t)
				t_1[v] = if friendshipStatus then friendshipStatus.data(p2) else nil
			end
			return t_1
		end)
	end, { table.concat(var4, ",") }) else nil) else nil
	local var6 = if fFlagSocialCarouselMigrateRecommendations then nil else reactModule.useCallback(function(p2)
		-- upvalues: var3 (ref), fFlagMigrateFriendshipStatusesSocialCarouselModule (copy), var5 (write), cryoModule (copy)
		local var7
		local var8 = var3.recommendationsDict[p2]
		local var9 = if fFlagMigrateFriendshipStatusesSocialCarouselModule then var5 and var5[p2] else var3.friendshipStatus[p2]
		local join = cryoModule.Dictionary.join
		local t = {}
		local t_1 = {}
		
		if var9 then
			var7 = var9 == Enum.FriendStatus.Friend
			var7 = nil
		else
			var7 = false
		end
		local var10
		t_1.isFriendWithUser = var7
		
		if var9 then
			var10 = var9 == Enum.FriendStatus.FriendRequestSent
			var10 = nil
		else
			var10 = false
		end
		local var11
		t_1.hasPendingFriendRequest = var10
		
		if var9 then
			var11 = var9 == Enum.FriendStatus.NotFriend
			var11 = nil
		else
			var11 = true
		end
		t_1.canSendFriendRequest = var11
		t_1.hasIncomingFriendRequest = var3.hasIncomingFriendRequest[p2]
		
		return join(t, var8, t_1)
	end, {
		var3.recommendationsDict,
		if fFlagMigrateFriendshipStatusesSocialCarouselModule then var5 else var3.friendshipStatus,
		var3.hasIncomingFriendRequest
	})
	
	return if fFlagSocialCarouselMigrateRecommendations then if fFlagSocialCarouselMigrateRecommendations then signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), friendsRecommendationsStore (copy), dataSource (copy), t (copy), cryoModule (copy), fFlagMigrateFriendshipStatusesSocialCarouselModule (copy), var1 (copy), var3 (ref)
		return signalsModule.createComputed(function(p2)
			-- upvalues: friendsRecommendationsStore (copy), dataSource (copy), t (copy), cryoModule (copy), fFlagMigrateFriendshipStatusesSocialCarouselModule (copy), var1 (copy), var3 (copy)
			local var7 = friendsRecommendationsStore.get().getFriendsRecommendations(dataSource.HomepageFriendsCarousel, t).data(p2)
			
			return cryoModule.List.map(if var7 then var7.data else {}, function(p3)
				-- upvalues: fFlagMigrateFriendshipStatusesSocialCarouselModule (copy), var1 (copy), t (copy), p2 (ref), var3 (copy)
				local var8
				local id = p3.id
				local _ = nil
				
				if fFlagMigrateFriendshipStatusesSocialCarouselModule then
					local friendshipStatus = var1.GetFriendshipStatus(id, t)
					var8 = if friendshipStatus then friendshipStatus.data(p2) else nil
				else
					var8 = var3.friendshipStatus[id]
				end
				local var9
				local t_1 = {
					id = id,
					mutualFriendsCount = p3.contextProps.mutualFriendsCount,
					contextType = p3.contextProps.contextType,
					rank = p3.rank,
					hasIncomingFriendRequest = p3.hasIncomingFriendRequest
				}
				
				if var8 then
					var9 = var8 == Enum.FriendStatus.Friend
					var9 = nil
				else
					var9 = false
				end
				local var10
				t_1.isFriendWithUser = var9
				
				if var8 then
					var10 = var8 == Enum.FriendStatus.FriendRequestSent
					var10 = nil
				else
					var10 = false
				end
				local var11
				t_1.hasPendingFriendRequest = var10
				
				if var8 then
					var11 = var8 == Enum.FriendStatus.NotFriend
					var11 = nil
				else
					var11 = true
				end
				t_1.canSendFriendRequest = var11
				
				return t_1
			end)
		end)
	end, if fFlagMigrateFriendshipStatusesSocialCarouselModule then {} else { var3.friendshipStatus })) else nil elseif fFlagSocialCarouselMigrateRecommendations then nil else reactModule.useMemo(function()
		-- upvalues: cryoModule (copy), var4 (ref), var6 (ref), var2 (copy)
		return cryoModule.List.sort(cryoModule.List.map(var4, var6), var2)
	end, { var4, var6 })
end