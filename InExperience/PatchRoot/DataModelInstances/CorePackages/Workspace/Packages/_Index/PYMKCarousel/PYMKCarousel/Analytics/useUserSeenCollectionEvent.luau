local httpService = game:GetService("HttpService")
local parent = script.Parent.Parent
local constantsModule = require(parent.Common.Constants)
local dependenciesModule = require(parent.dependencies)
local parent_1 = parent.Parent
local react = dependenciesModule.React
local useSelector = dependenciesModule.Hooks.useSelector
local getDeepValue = dependenciesModule.SocialLibraries.Dictionary.getDeepValue
local formatRecommendationContextType = dependenciesModule.SocialLuaAnalytics.Analytics.Formatters.formatRecommendationContextType
local buildUserSeenCollectionPayload = dependenciesModule.SocialLuaAnalytics.Analytics.buildUserSeenCollectionPayload
local repeatValue = dependenciesModule.SocialLuaAnalytics.Analytics.Formatters.repeatValue
local dataHydrationModule = require(parent_1.DataHydration)
local impressionsModule = require(parent_1.Impressions)
local sharedFlagsModule = require(parent_1.SharedFlags)
local eventNamesModule = require(script.Parent.EventNames)
local getFriendStatusModule = require(script.Parent.getFriendStatus)
local useBatchedImpressions = impressionsModule.useBatchedImpressions
local fFlagMigrateFriendshipStatusesPYMKModule = require(parent.Flags.FFlagMigrateFriendshipStatusesPYMK)
local fFlagPymkCarouselPresenceStoreMigrationModule = require(parent.Flags.FFlagPymkCarouselPresenceStoreMigration)
local fIntUserSeenCollectionBatchTimeMs = sharedFlagsModule.FIntUserSeenCollectionBatchTimeMs
local fFlagLuaAppUserSeenCollectionUnifiedFields = sharedFlagsModule.FFlagLuaAppUserSeenCollectionUnifiedFields
local fFlagLuaAppEnableSduiHomePage = sharedFlagsModule.FFlagLuaAppEnableSduiHomePage
local var1 = if fFlagPymkCarouselPresenceStoreMigrationModule then dataHydrationModule.Presence.PresenceStore.get() else nil
local var2 = if fFlagMigrateFriendshipStatusesPYMKModule then dataHydrationModule.Friends.FriendsStore.get() else nil

local function _(p1)
	-- upvalues: var2 (ref)
	local friendshipStatus = var2.GetFriendshipStatus(p1, { skipFetch = true })
	
	return if friendshipStatus then friendshipStatus.data(false) else nil
end

return function(p1, p2)
	-- upvalues: fFlagMigrateFriendshipStatusesPYMKModule (ref), useSelector (ref), getDeepValue (ref), constantsModule (ref), fFlagLuaAppEnableSduiHomePage (ref), fFlagPymkCarouselPresenceStoreMigrationModule (ref), react (ref), buildUserSeenCollectionPayload (ref), eventNamesModule (ref), fFlagLuaAppUserSeenCollectionUnifiedFields (ref), httpService (ref), repeatValue (ref), var1 (ref), getFriendStatusModule (ref), var2 (ref), formatRecommendationContextType (ref), useBatchedImpressions (ref), fIntUserSeenCollectionBatchTimeMs (ref)
	local var3 = if not fFlagMigrateFriendshipStatusesPYMKModule then useSelector(function(p3)
		-- upvalues: getDeepValue (copy), constantsModule (copy)
		return getDeepValue(p3, string.format("%s.Friends.friendshipStatus", constantsModule.RODUX_KEY)) or {}
	end) else nil
	local var4 = if not fFlagLuaAppEnableSduiHomePage then useSelector(function(p3)
		-- upvalues: getDeepValue (copy), constantsModule (copy)
		return getDeepValue(p3, string.format("%s.Friends.recommendations.hasIncomingFriendRequest", constantsModule.RODUX_KEY)) or {}
	end) else nil
	local var5 = if not fFlagPymkCarouselPresenceStoreMigrationModule then useSelector(function(p3)
		-- upvalues: getDeepValue (copy)
		return getDeepValue(p3, "PYMKCarousel.Presence.byUserId") or {}
	end) else nil
	local list = {
		p1,
		if fFlagLuaAppUserSeenCollectionUnifiedFields and p2 then p2.collectionId else nil,
		if fFlagLuaAppUserSeenCollectionUnifiedFields and p2 then p2.collectionPosition else nil,
		if fFlagLuaAppUserSeenCollectionUnifiedFields and p2 then p2.feedRowNumber else nil,
		if fFlagLuaAppUserSeenCollectionUnifiedFields and p2 then p2.totalNumberOfItems else nil
	}
	list = useBatchedImpressions({
		batchTimeMs = fIntUserSeenCollectionBatchTimeMs,
		mapItem = react.useCallback(function(p3, p4, p5)
			-- upvalues: fFlagPymkCarouselPresenceStoreMigrationModule (copy), var1 (copy), var5 (ref), getFriendStatusModule (copy), fFlagMigrateFriendshipStatusesPYMKModule (copy), var2 (copy), var3 (write), fFlagLuaAppEnableSduiHomePage (copy), var4 (write), formatRecommendationContextType (copy)
			if not p5 or p5.isButtonTile or p5.isTooltip then
				return nil
			end
			local var6
			local var7 = if fFlagPymkCarouselPresenceStoreMigrationModule then var1.GetPresenceByUserId(tostring(p3), { skipFetch = true }).data(false) or {} elseif var5 then var5[p3] else {}
			local var8 = if var7.universeId == nil or tostring(var7.universeId) == "" then -1 else var7.universeId
			local t = {
				isRecommendation = true,
				userId = p3,
				index = p5.absolutePosition or p4,
				presence = var7.userPresenceType or "Offline"
			}
			
			if fFlagMigrateFriendshipStatusesPYMKModule then
				local friendshipStatus = var2.GetFriendshipStatus(p3, { skipFetch = true })
				var6 = if friendshipStatus then friendshipStatus.data(false) else nil
			else
				var6 = var3[p3]
			end
			t.friendStatus = getFriendStatusModule(var6, if fFlagLuaAppEnableSduiHomePage then p5.hasIncomingFriendRequest else var4[p3])
			t.recommendationContextType = if p5.recommendationContextType then formatRecommendationContextType(p5.recommendationContextType) else "None"
			t.recommendationRank = p5.recommendationRank or -1
			t.universeId = var8
			
			return t
		end, {
			if not fFlagMigrateFriendshipStatusesPYMKModule then var3 else nil,
			var4,
			if not fFlagPymkCarouselPresenceStoreMigrationModule then var5 else nil
		}),
		onFlush = react.useCallback(function(p3, p4)
			-- upvalues: buildUserSeenCollectionPayload (copy), p1 (ref), eventNamesModule (copy), fFlagLuaAppUserSeenCollectionUnifiedFields (copy), httpService (copy), p2 (ref), repeatValue (copy)
			local var6 = buildUserSeenCollectionPayload(p3, p4)
			p1(eventNamesModule.UserSeenCollection, {
				userId = var6.userIds,
				absolutePosition = var6.absolutePositions,
				presence = var6.presences,
				recommendationRank = var6.recommendationRanks,
				friendStatus = var6.friendStatuses,
				recommendationContextType = var6.recommendationContextTypes,
				isRecommendation = var6.isRecommendations,
				universeId = var6.universeIds,
				tileCount = var6.tileCount,
				sessionEventCount = var6.sessionEventCount,
				contentType = if fFlagLuaAppUserSeenCollectionUnifiedFields then var6.contentType else nil,
				interactionUuid = if fFlagLuaAppUserSeenCollectionUnifiedFields then httpService:GenerateGUID(false) else nil,
				collectionId = if fFlagLuaAppUserSeenCollectionUnifiedFields and p2 then p2.collectionId else nil,
				collectionPosition = if fFlagLuaAppUserSeenCollectionUnifiedFields and p2 then p2.collectionPosition else nil,
				positionsInRow = if fFlagLuaAppUserSeenCollectionUnifiedFields then var6.absolutePositions else nil,
				rowNumbers = if fFlagLuaAppUserSeenCollectionUnifiedFields then repeatValue(1, var6.tileCount) else nil,
				feedRowNumbers = if fFlagLuaAppUserSeenCollectionUnifiedFields and p2 and p2.feedRowNumber then repeatValue(p2.feedRowNumber, var6.tileCount) else nil,
				totalNumberOfItems = if fFlagLuaAppUserSeenCollectionUnifiedFields and p2 then p2.totalNumberOfItems else nil
			})
		end, list)
	})
	
	return react.useMemo(function()
		-- upvalues: list (ref)
		return { addTileToCollection = list.addImpression }
	end, { list.addImpression })
end