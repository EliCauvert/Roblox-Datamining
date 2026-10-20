local HttpService = game:GetService("HttpService")
local Parent = script.Parent.Parent
local ConstantsModule = require(Parent.Common.Constants)
local DependenciesModule = require(Parent.dependencies)
local Parent1 = Parent.Parent
local React = DependenciesModule.React
local UseSelectorFunction = DependenciesModule.Hooks.useSelector
local GetDeepValueFunction = DependenciesModule.SocialLibraries.Dictionary.getDeepValue
local FormatRecommendationContextTypeFunction = DependenciesModule.SocialLuaAnalytics.Analytics.Formatters.formatRecommendationContextType
local BuildUserSeenCollectionPayloadFunction = DependenciesModule.SocialLuaAnalytics.Analytics.buildUserSeenCollectionPayload
local RepeatValueFunction = DependenciesModule.SocialLuaAnalytics.Analytics.Formatters.repeatValue
local DataHydrationModule = require(Parent1.DataHydration)
local SharedFlagsModule = require(Parent1.SharedFlags)
local EventNamesModule = require(script.Parent.EventNames)
local GetFriendStatusModule = require(script.Parent.getFriendStatus)
local UseBatchedImpressionsFunction = require(Parent1.Impressions).useBatchedImpressions
local FFlagMigrateFriendshipStatusesPYMKModule = require(Parent.Flags.FFlagMigrateFriendshipStatusesPYMK)
local FFlagPymkCarouselPresenceStoreMigrationModule = require(Parent.Flags.FFlagPymkCarouselPresenceStoreMigration)
local FIntUserSeenCollectionBatchTimeMs = SharedFlagsModule.FIntUserSeenCollectionBatchTimeMs
local FFlagLuaAppUserSeenCollectionUnifiedFields = SharedFlagsModule.FFlagLuaAppUserSeenCollectionUnifiedFields
local FFlagLuaAppEnableSduiHomePage = SharedFlagsModule.FFlagLuaAppEnableSduiHomePage
local GetResult = if FFlagPymkCarouselPresenceStoreMigrationModule then DataHydrationModule.Presence.PresenceStore.get() else nil
local GetResult1 = if FFlagMigrateFriendshipStatusesPYMKModule then DataHydrationModule.Friends.FriendsStore.get() else nil

local function _(p1)
	-- upvalues: GetResult1 (copy)
	local FriendshipStatus = GetResult1.GetFriendshipStatus(p1, { skipFetch = true })
	
	return if FriendshipStatus then FriendshipStatus.data(false) else nil
end

return function(Callback, p1)
	-- upvalues: FFlagMigrateFriendshipStatusesPYMKModule (copy), UseSelectorFunction (copy), GetDeepValueFunction (copy), ConstantsModule (copy), FFlagLuaAppEnableSduiHomePage (copy), FFlagPymkCarouselPresenceStoreMigrationModule (copy), React (copy), BuildUserSeenCollectionPayloadFunction (copy), EventNamesModule (copy), FFlagLuaAppUserSeenCollectionUnifiedFields (copy), HttpService (copy), RepeatValueFunction (copy), GetResult (copy), GetFriendStatusModule (copy), GetResult1 (copy), FormatRecommendationContextTypeFunction (copy), UseBatchedImpressionsFunction (copy), FIntUserSeenCollectionBatchTimeMs (copy)
	local UseSelectorResult = if FFlagMigrateFriendshipStatusesPYMKModule then nil else UseSelectorFunction(function(p2)
		-- upvalues: GetDeepValueFunction (upval), ConstantsModule (upval)
		return GetDeepValueFunction(p2, string.format("%s.Friends.friendshipStatus", ConstantsModule.RODUX_KEY)) or {}
	end)
	local UseSelectorResult1 = if FFlagLuaAppEnableSduiHomePage then nil else UseSelectorFunction(function(p2)
		-- upvalues: GetDeepValueFunction (upval), ConstantsModule (upval)
		return GetDeepValueFunction(p2, string.format("%s.Friends.recommendations.hasIncomingFriendRequest", ConstantsModule.RODUX_KEY)) or {}
	end)
	local UseSelectorResult2 = if FFlagPymkCarouselPresenceStoreMigrationModule then nil else UseSelectorFunction(function(p2)
		-- upvalues: GetDeepValueFunction (upval)
		return GetDeepValueFunction(p2, "PYMKCarousel.Presence.byUserId") or {}
	end)
	local UseBatchedImpressionsResult = UseBatchedImpressionsFunction({
		batchTimeMs = FIntUserSeenCollectionBatchTimeMs,
		mapItem = React.useCallback(function(UserId, p2, p3)
			-- upvalues: FFlagPymkCarouselPresenceStoreMigrationModule (upval), GetResult (upval), UseSelectorResult2 (copy), GetFriendStatusModule (upval), FFlagMigrateFriendshipStatusesPYMKModule (upval), GetResult1 (upval), UseSelectorResult (ref), FFlagLuaAppEnableSduiHomePage (upval), UseSelectorResult1 (ref), FormatRecommendationContextTypeFunction (upval)
			if not p3 or p3.isButtonTile or p3.isTooltip then
				return nil
			end
			local DataResult = if FFlagPymkCarouselPresenceStoreMigrationModule then GetResult.GetPresenceByUserId(tostring(UserId), { skipFetch = true }).data(false) or {} else UseSelectorResult2 and UseSelectorResult2[UserId] or {}
			local UniverseId = if DataResult.universeId == nil or tostring(DataResult.universeId) == "" then -1 else DataResult.universeId
			local config = {
				isRecommendation = true,
				userId = UserId,
				index = p3.absolutePosition or p2,
				presence = DataResult.userPresenceType or "Offline"
			}
			local DataResult1 = nil
			
			if FFlagMigrateFriendshipStatusesPYMKModule then
				local FriendshipStatus = GetResult1.GetFriendshipStatus(UserId, { skipFetch = true })
				DataResult1 = if FriendshipStatus then FriendshipStatus.data(false) else nil
			else
				DataResult1 = UseSelectorResult[UserId]
			end
			config.friendStatus = GetFriendStatusModule(DataResult1, if FFlagLuaAppEnableSduiHomePage then p3.hasIncomingFriendRequest else UseSelectorResult1[UserId])
			config.recommendationContextType = if p3.recommendationContextType then FormatRecommendationContextTypeFunction(p3.recommendationContextType) else "None"
			config.recommendationRank = p3.recommendationRank or -1
			config.universeId = UniverseId
			
			return config
		end, {
			if FFlagMigrateFriendshipStatusesPYMKModule then nil else UseSelectorResult,
			UseSelectorResult1,
			if FFlagPymkCarouselPresenceStoreMigrationModule then nil else UseSelectorResult2
		}),
		onFlush = React.useCallback(function(p2, p3)
			-- upvalues: BuildUserSeenCollectionPayloadFunction (upval), Callback (copy), EventNamesModule (upval), FFlagLuaAppUserSeenCollectionUnifiedFields (upval), HttpService (upval), p1 (copy), RepeatValueFunction (upval)
			local UserSeenCollectionPayload = BuildUserSeenCollectionPayloadFunction(p2, p3)
			Callback(EventNamesModule.UserSeenCollection, {
				userId = UserSeenCollectionPayload.userIds,
				absolutePosition = UserSeenCollectionPayload.absolutePositions,
				presence = UserSeenCollectionPayload.presences,
				recommendationRank = UserSeenCollectionPayload.recommendationRanks,
				friendStatus = UserSeenCollectionPayload.friendStatuses,
				recommendationContextType = UserSeenCollectionPayload.recommendationContextTypes,
				isRecommendation = UserSeenCollectionPayload.isRecommendations,
				universeId = UserSeenCollectionPayload.universeIds,
				tileCount = UserSeenCollectionPayload.tileCount,
				sessionEventCount = UserSeenCollectionPayload.sessionEventCount,
				contentType = if FFlagLuaAppUserSeenCollectionUnifiedFields then UserSeenCollectionPayload.contentType else nil,
				interactionUuid = if FFlagLuaAppUserSeenCollectionUnifiedFields then HttpService:GenerateGUID(false) else nil,
				collectionId = if FFlagLuaAppUserSeenCollectionUnifiedFields and p1 then p1.collectionId else nil,
				collectionPosition = if FFlagLuaAppUserSeenCollectionUnifiedFields and p1 then p1.collectionPosition else nil,
				positionsInRow = if FFlagLuaAppUserSeenCollectionUnifiedFields then UserSeenCollectionPayload.absolutePositions else nil,
				rowNumbers = if FFlagLuaAppUserSeenCollectionUnifiedFields then RepeatValueFunction(1, UserSeenCollectionPayload.tileCount) else nil,
				feedRowNumbers = if FFlagLuaAppUserSeenCollectionUnifiedFields and p1 and p1.feedRowNumber then RepeatValueFunction(p1.feedRowNumber, UserSeenCollectionPayload.tileCount) else nil,
				totalNumberOfItems = if FFlagLuaAppUserSeenCollectionUnifiedFields and p1 then p1.totalNumberOfItems else nil
			})
		end, {
			Callback,
			if FFlagLuaAppUserSeenCollectionUnifiedFields and p1 then p1.collectionId else nil,
			if FFlagLuaAppUserSeenCollectionUnifiedFields and p1 then p1.collectionPosition else nil,
			if FFlagLuaAppUserSeenCollectionUnifiedFields and p1 then p1.feedRowNumber else nil,
			if FFlagLuaAppUserSeenCollectionUnifiedFields and p1 then p1.totalNumberOfItems else nil
		})
	})
	
	return React.useMemo(function()
		-- upvalues: UseBatchedImpressionsResult (copy)
		return {
			addTileToCollection = UseBatchedImpressionsResult.addImpression
		}
	end, { UseBatchedImpressionsResult.addImpression })
end